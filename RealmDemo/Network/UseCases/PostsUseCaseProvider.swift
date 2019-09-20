//
//  PostsUseCaseProvider.swift
//  RealmDemo
//
//  Created by Kyaw Kyaw Khing on 9/20/19.
//  Copyright © 2019 Kyaw Kyaw Khing. All rights reserved.
//

import Foundation

public final class PostsUseCaseProvider: PostsDomainUseCaseProvider {
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
    
    func makePostsDomainUseCase() -> PostsDomainUseCase {
        return PostsUseCase(network: networkProvider.makePostsNetwork(),
                            cache: Cache<Post>(path: "allPosts"))
    }
    
}
