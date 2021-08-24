//
//  PostElement.swift
//  MedisageTest
//
//  Created by Abhi on 24/08/21.


import Foundation

// MARK: - PostElement
struct PostElement: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
