//
//  ReviewListRespone.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/11.
//

import Foundation

// MARK: - ReviewListResponse
struct ReviewListResponse: Codable {
    let id: Int
    let name: String
    let profilePhotoURL: String
    let introduce: String
    let reviewListResponseDescription: String
    let serviceDescription: String
    let reviews: [Review]
    let questions: [Question]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case profilePhotoURL = "profilePhotoUrl"
        case introduce = "introduce"
        case reviewListResponseDescription = "description"
        case serviceDescription = "serviceDescription"
        case reviews = "reviews"
        case questions = "questions"
    }
}

// MARK: - Question
struct Question: Codable {
    let questionID: Int
    let questionContent: String

    enum CodingKeys: String, CodingKey {
        case questionID = "questionId"
        case questionContent = "questionContent"
    }
}

// MARK: - Review
struct Review: Codable {
    let reviewID: Int
    let reviewTitle: String
    let memberName: String
    let createDate: String
    let questions: [Question]

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case reviewTitle = "reviewTitle"
        case memberName = "memberName"
        case createDate = "createDate"
        case questions = "questions"
    }
}
