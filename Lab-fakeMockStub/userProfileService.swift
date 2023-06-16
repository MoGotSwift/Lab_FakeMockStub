//
//  userProfileService.swift
//  Lab-fakeMockStub
//
//  Created by Mohanad Abbood on 6/16/23.
//

import Foundation

struct UserProfile: Equatable {
    let userId: String
    let name: String
    let email: String
}

enum UserServiceError: Error {
    case userNotFound
}

protocol UserProfileService {
    func fetchProfile(userId: String, completion: @escaping (UserProfile?, Error?) -> Void)
}

class UserProfileServiceFake: UserProfileService {
    var users: [String: UserProfile] = [:]

    func fetchProfile(userId: String, completion: @escaping (UserProfile?, Error?) -> Void) {
        if let user = users[userId] {
            completion(user, nil)
        } else {
            completion(nil, UserServiceError.userNotFound)
        }
    }
}

class UserProfileServiceMock: UserProfileService {
    var profile: UserProfile?
    var error: Error?

    var fetchProfileCalled = false
    var lastUserId: String?

    func fetchProfile(userId: String, completion: @escaping (UserProfile?, Error?) -> Void) {
        fetchProfileCalled = true
        lastUserId = userId
        completion(profile, error)
    }
}

class UserProfileServiceStub: UserProfileService {
    var profile: UserProfile?
    var error: Error?

    func fetchProfile(userId: String, completion: @escaping (UserProfile?, Error?) -> Void) {
        completion(profile, error)
    }
}
