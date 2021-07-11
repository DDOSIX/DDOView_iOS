//
//  MainResponse.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/11.
//

import Foundation

// MARK: - MainResponseElement
struct MainResponseElement: Codable {
    let companyID: Int
    let companyName: String
    let companyCategory: String
    let introduce: String

    enum CodingKeys: String, CodingKey {
        case companyID = "companyId"
        case companyName = "companyName"
        case companyCategory = "companyCategory"
        case introduce = "introduce"
    }
}

typealias MainResponse = [MainResponseElement]
