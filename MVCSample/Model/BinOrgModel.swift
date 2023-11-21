//
//  BinOrgModel.swift
//  MVCSample
//
//  Created by 中村太郎 on 2023/11/21.
//

import Foundation


struct BinOrgModel: Codable {
    let origin: String
    let url: String
 
 enum CodingKeys: CodingKey {
  case origin
  case url
 }
}
