//
//  Model.swift
//  skorguru
//
//  Created by Cem Bıçakcı on 9.05.2024.
//

import Foundation

struct MatchResponse: Codable {
    let info: [Info]
    let response: [MatchData]
}

struct Info: Codable {
    let text: String
    let value: Int
}

struct MatchData: Codable {
    let flag: String
    let league: String
    let matches: [Match]
}

struct Match: Codable {
    let id: Int
    let matchId: Int
    let matchDate: String
    let status: String
    let league: String
    let flag: String
    let homeTeam: String
    let awayTeam: String
    let homeTeamLogo: String
    let awayTeamLogo: String
    let odd1: String
    let oddX: String
    let odd2: String
    let homeScore: Int
    let awayScore: Int
    let tips: [Tip]
    let banksCategory: String
    let slipCategory: String
    let createdAt: String
    let updatedAt: String
    let win1: Bool
    let winX: Bool
    let win2: String
    let trust: String
}

struct Tip: Codable {
    let name: String
    let tip: String?
    let odd: String?
    let trust: String?
    let bestTip: Bool?
    let worstOdd: Bool?
    let win: Int?
}
