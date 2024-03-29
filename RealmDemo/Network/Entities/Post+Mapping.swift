//
//  Post+Mapping.swift
//  RealmDemo
//
//  Created by Kyaw Kyaw Khing on 9/20/19.
//  Copyright © 2019 Kyaw Kyaw Khing. All rights reserved.
//

import Foundation
 
extension Post: Identifiable {}

extension Post {
    func toJSON() -> [String: Any] {
        return [
            "body": body,
            "title": title,
            "uid": uid,
            "userId": userId,
            "createdAt": createdAt
        ]
    }
}

extension Post: Encodable {
    var encoder: NETPost {
        return NETPost(with: self)
    }
}

final class NETPost: NSObject, NSCoding, DomainConvertibleType {
    struct Keys {
        static let body = "body"
        static let title = "title"
        static let uid = "uid"
        static let userId = "userId"
        static let createdAt = "createdAt"
    }
    let body: String
    let title: String
    let uid: String
    let userId: String
    let createdAt: String
    
    init(with domain: Post) {
        self.body = domain.body
        self.title = domain.title
        self.uid = domain.uid
        self.userId = domain.userId
        self.createdAt = domain.createdAt
    }
    
    init?(coder aDecoder: NSCoder) {
        guard
            let body = aDecoder.decodeObject(forKey: Keys.body) as? String,
            let title = aDecoder.decodeObject(forKey: Keys.title) as? String,
            let uid = aDecoder.decodeObject(forKey: Keys.uid) as? String,
            let userId = aDecoder.decodeObject(forKey: Keys.userId) as? String,
            let createdAt = aDecoder.decodeObject(forKey: Keys.createdAt) as? String
            else {
                return nil
        }
        self.body = body
        self.title = title
        self.uid = uid
        self.userId = userId
        self.createdAt = createdAt
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(body, forKey: Keys.body)
        aCoder.encode(title, forKey: Keys.title)
        aCoder.encode(uid, forKey: Keys.uid)
        aCoder.encode(userId, forKey: Keys.userId)
        aCoder.encode(createdAt, forKey: Keys.createdAt)
    }
    
    func asDomain() -> Post {
        return Post(body: body,
                    title: title,
                    uid: uid,
                    userId: userId,
                    createdAt: createdAt)
    }
}
