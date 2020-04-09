//
//  Entity.swift
//  CleanMVVMExercise
//
//  Created by Song on 2020-04-09.
//  Copyright © 2020 Song. All rights reserved.
//

import Foundation

//when loading whole json data form response by JsonDecoder, may use them
struct Program: Decodable {
    let id: Int
    let name: String
    let desc: String
    let shortDesc: String
    let programType: String
    let owner: Owner
    let episode: String?
    let agvotCode: String
    let agvotDisclaimer: String?
    let qfrCode: String
    let airingOrder: String?
    let broadcastDate: Date?
    let broadcastTime: Date?
    let broadcastDateTime: Date?
    let lastModifiedDateTime: Date
    let gameId: String?
    let album: String?
    let genres: [String]
    let keywords: [String]
    let tags: [String]
    let images: [Images]
    let authentication: Authentication
    let nextAuthentication: Authentication?
    let ratingWarnings: [String]
    let people: [String]
    let funding: String?
    let musicLabels: [String]
    let broadcastNetworks: [String]
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "Id"
        case name = "Name"
        case desc = "Desc"
        case shortDesc = "ShortDesc"
        case programType = "Type"
        case owner = "Owner"
        case episode = "Episode"
        case agvotCode = "AgvotCode"
        case agvotDisclaimer = "AgvotDisclaimer"
        case qfrCode = "QfrCode"
        case airingOrder = "AiringOrder"
        case broadcastDate = "BroadcastDate"
        case broadcastTime = "BroadcastTime"
        case broadcastDateTime = "BroadcastDateTime"
        case lastModifiedDateTime = "LastModifiedDateTime"
        case gameId = "GameId"
        case album = "Album"
        case genres = "Genres"
        case keywords = "Keywords"
        case tags = "Tags"
        case images = "Images"
        case authentication = "Authentication"
        case nextAuthentication = "NextAuthentication"
        case ratingWarnings = "RatingWarnings"
        case people = "People"
        case funding = "Funding"
        case musicLabels = "MusicLabels"
        case broadcastNetworks = "BroadcastNetworks"
        
    }
}

struct Owner: Decodable {
    
}

struct Images: Decodable {
    let imageType: String
    let url: String
    let width: Int
    let height: Int
    
    private enum CodingKeys: String, CodingKey {
        case imageType = "Type"
        case url = "Url"
        case width = "Width"
        case height = "Height"
    }
}

struct Authentication: Decodable {
    let required: Bool
    let resources: [Resources]
    
    private enum CodingKeys: String, CodingKey {
        
        case required = "Required"
        case resources = "Resources"
    }
}

struct Resources: Decodable {
    let resourceCode: String
    private enum CodingKeys: String, CodingKey {
        
        case resourceCode = "ResourceCode"
        
    }
}
