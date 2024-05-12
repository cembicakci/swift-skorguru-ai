//
//  Model.swift
//  skorguru
//
//  Created by Cem Bıçakcı on 9.05.2024.
//

import Foundation

struct MatchResponse: Codable {
    let info: [Info]
    let response: [Response]
}

struct Info: Codable {
    let text: String
    let value: Int
}

struct Response: Codable {
    let flag: String
    let league: String
    let matchs: [Match]
}


struct Match: Codable {
    let id, matchID: Int
    let matchDate: String
    let status: Status
    let league, flag, homeTeam, awayTeam: String
    let homeTeamLogo, awayTeamLogo: String
    let odd1, oddX, odd2: String
    let homeScore, awayScore: Int?
    let tips: [Tip]
    let banksCategory, slipCategory: Category
    let createdAt, updatedAt: String
    let win1, winX, win2: Win1Union
    let trust: Trust

    enum CodingKeys: String, CodingKey {
        case id
        case matchID = "match_id"
        case matchDate = "match_date"
        case status, league, flag
        case homeTeam = "home_team"
        case awayTeam = "away_team"
        case homeTeamLogo = "home_team_logo"
        case awayTeamLogo = "away_team_logo"
        case odd1 = "odd_1"
        case oddX = "odd_x"
        case odd2 = "odd_2"
        case homeScore = "home_score"
        case awayScore = "away_score"
        case tips
        case banksCategory = "banks_category"
        case slipCategory = "slip_category"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case win1, winX, win2, trust
    }
}

enum Category: String, Codable {
    case no = "NO"
    case yes = "YES"
}

enum Status: String, Codable {
    case başlayacak = "Başlayacak"
    case canlı = "Canlı"
    case tamamlandı = "Tamamlandı"
}

struct Tip: Codable {
    let name: Name
    let tip: String
    let odd, trust: String?
    let bestTip, worstOdd: Bool?
    let win: Int?

    enum CodingKeys: String, CodingKey {
        case name, tip, odd, trust
        case bestTip = "best_tip"
        case worstOdd = "worst_odd"
        case win
    }
}

enum Name: String, Codable {
    case bestTip = "Best Tip"
    case bothTeamsToScore = "Both Teams To Score"
    case fullTimeCorrectScore = "Full-Time Correct Score"
    case halfTimeCorrectScore = "Half-Time Correct Score"
    case improvedUnderOver = "Improved Under/Over"
    case the1X2Tip = "1x2 Tip"
    case underOver = "Under/Over"
}

enum Trust: String, Codable {
    case the0 = "%0"
    case the10 = "%10"
    case the100 = "%100"
    case the20 = "%20"
    case the30 = "%30"
    case the40 = "%40"
    case the50 = "%50"
    case the60 = "%60"
    case the70 = "%70"
    case the80 = "%80"
    case the90 = "%90"
}

enum Win1Union: Codable {
    case bool(Bool)
    case enumeration(Win1Enum)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Win1Enum.self) {
            self = .enumeration(x)
            return
        }
        throw DecodingError.typeMismatch(Win1Union.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Win1Union"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .enumeration(let x):
            try container.encode(x)
        }
    }
}

enum Win1Enum: String, Codable {
    case the32Ad1F = "#32ad1f"
}
