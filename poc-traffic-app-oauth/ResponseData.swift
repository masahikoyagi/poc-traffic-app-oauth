//
//  ResponseData.swift
//  poc-traffic-app-oauth
//
//  Created by 八木真彦 on 2019/07/14.
//  Copyright © 2019 八木真彦. All rights reserved.
//

import Foundation

struct ResponseData: Codable {
    var login: String?
    var id: Int?
    var node_id: String?
    var avatar_url: String?
    var gravatar_id: String?
    var url: String?
    var html_url: String?
    var followers_url: String?
    var following_url: String?
    var gists_url: String?
    var starred_url: String?
    var subscriptions_url: String?
    var repos_url: String?
    var events_url: String?
    var received_events_url: String?
    var type: String?
    var site_admin: Bool?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: String?
    var bio: String?
    var public_repos: Int?
    var public_gists: Int?
    var followers: Int?
    var following: Int?
    var created_at: String?
    var updated_at: String?
    var private_gists: Int?
    var total_private_repos: Int?
    var owned_private_repos: Int?
    var disk_usage: Int?
    var collaborators: Int?
    var two_factor_authentication: Bool?
    var plan: Plan?
}

struct Plan: Codable {
    var name: String?
    var space: Int?
    var collaborators: Int?
    var private_repos: Int?
}
