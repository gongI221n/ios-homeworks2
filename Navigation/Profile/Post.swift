//
//  Post.swift
//  Navigation
//
//  Created by Ivan Chaschin on 25.02.2022.
//

import Foundation

struct Post {
    var title: String
    var description: String
    var image: String
    var likes: Int
    var views: Int

}

let post1 = Post(title: "Пост 1.",
                 description: "Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 Пост 1 ",
                 image: "Post1",
                 likes: 1066,
                 views: 9673)

let post2 = Post(title: "Пост 2.",
                 description: "Пост 2 Пост 2 Пост 2 Пост 2 Пост 2 Пост 2 Пост 2 Пост 2 Пост 2 Пост 2 ",
                 image: "Post2",
                 likes: 1266,
                 views: 10765)

let post3 = Post(title: "Пост 3.",
                 description: "Пост 3 Пост 3 Пост 3 Пост 3 Пост 3 Пост 3 Пост 3 Пост 3 Пост 3 Пост 3 ",
                 image: "Post3",
                 likes: 107,
                 views: 7649)

let post4 = Post(title: "Пост 4.",
                 description: "Пост 4 Пост 4 Пост 4 Пост 4 Пост 4 Пост 4 Пост 4 Пост 4 Пост 4 Пост 4 ",
                 image: "Post4",
                 likes: 1839,
                 views: 11845)

var posts: [Post] = [post1, post2, post3, post4]
