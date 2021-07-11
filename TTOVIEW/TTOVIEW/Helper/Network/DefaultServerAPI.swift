//
//  DefaultServerAPI.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import Foundation
import Moya

enum DefaultServerAPI {
    case main
    case reviewList(companyId: Int)
    case reviewWrite(title: String, companyId: Int, memberId: Int, reviewQuestRequests: [ReviewQuestRequest])
}

//MARK: - TargetType, Moya에서 제공하는 프로토콜
extension DefaultServerAPI: TargetType {
    public var baseURL: URL {
        //        guard let host = URL(string: "http://3.34.96.70:5000") else { fatalError() }
        guard let host = URL(string: "http://ec2-18-221-139-75.us-east-2.compute.amazonaws.com:9001") else { fatalError() }
        return host
    }
    
    public var path: String {
        switch self {
        case .main:
            return "/api/companies"
        case .reviewList(let companyId):
            return "/api/companies/\(companyId)/reviews"
        case .reviewWrite:
            return "/api/reviews"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .main, .reviewList:
            return .get
        case .reviewWrite:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        // URLEncoding.default
        switch self {
        case .reviewWrite(title: let title, companyId: let companyId, memberId: let memberId, reviewQuestRequests: let reviewQuestRequests):
            return .requestParameters(
                parameters: [
                    "reviewTitle" : title,
                    "companyId" : companyId,
                    "memberId" : memberId,
                    "reviewQuestRequests" : [reviewQuestRequests]
                ],
                encoding: JSONEncoding.default)
        case .main, .reviewList:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        let token = ""
        return [
            "content-Type": "application/json",
            "accept": "application/json"
            //            "authorization" : token
        ]
    }
}
