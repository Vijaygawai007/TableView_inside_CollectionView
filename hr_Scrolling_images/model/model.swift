//
//  model.swift
//  hr_Scrolling_images
//
//  Created by Prince's Mac on 08/08/23.
//
import Foundation

struct ProjectRecord1: Codable {
    let id: Int
    let title: String
    let shortDescription: String
    let collectedValue: Int
    let totalValue: Int
    let startDate: String
    let endDate: String
    let mainImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case title
        case shortDescription
        case collectedValue
        case totalValue
        case startDate
        case endDate
        case mainImageURL
    }
}

struct APIResponse: Codable {
    let status: Int
    let message: String
    let data: APIResponseData
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case data
    }
}

struct APIResponseData: Codable {
    let totalRecords: Int
    let records: [ProjectRecord1]
    
    enum CodingKeys: String, CodingKey {
        case totalRecords = "TotalRecords"
        case records = "Records"
    }
}
