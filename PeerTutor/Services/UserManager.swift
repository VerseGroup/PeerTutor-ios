//
//  UserManager.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/23/21.
//

import Foundation
import Combine
import SwiftUI

// handles and manages the CRUD for the current user
class UserManager: ObservableObject {
    // will only have one instance of UserManager, all viewmodels should point to this instance
    static let instance = UserManager()
    private init() {
        getCourseCatalog()
    }
    
    private let api = APIManager()
    private var cancellables = Set<AnyCancellable>()
    
    // checks if user is logged in
    // appstorage

    // the current signed in user
    @Published var currentUser: User?
    
    // the user's matches
    @Published var learningMatches: Matches?
    @Published var teachingMatches: Matches?
    
    // the user's match requests
    @Published var learningMatchRequests: MatchRequests?
    @Published var teachingMatchRequests: MatchRequests?
    
    // all courses in the course catalog
    @Published var courseCatalog: CourseCatalog = CourseCatalog(courses: [])
    
    // message the API outputs
    @Published var message: String = ""
    
    
    // handles the completion, if fetches data successfully, sinks data, otherwise prints error
    func completionHandler(result: Subscribers.Completion<Error>) -> () {
        switch result {
        case .finished:
            print("Sucessfuly retrieved data!")
            break
        case .failure(let error):
            print("Error retrieving data: \(error)")
        }
    }
    
    // CRUD FUNCTIONS - handles managing the current user's info (sending and getting requests)
    
    // gets a user by their id, otherwise returns nil
    func getUser(id: Int) -> User? {
        var user: User?
        print("Fetching user info")
        api.getUser(id: id)
            .sink(receiveCompletion: completionHandler, receiveValue: { apiUser in
                user = apiUser
            })
            .store(in: &cancellables)
        return user
    }
    
    // gets a course by its id, otherwise returns nil
    func getCourse(id: Int) -> Course? {
        var course: Course?
        print("Fetching course info")
        api.getCourse(id: id)
            .sink(receiveCompletion: completionHandler) { apiCourse in
                course = apiCourse
            }
            .store(in: &cancellables)
        return course
    }
    
    // GETTING USER INFO (GET REQUEST)
    
    // gets matches the user is getting tutored in (learning sessions)
    func findMatchByTutee(user: User) {
        print("Getting the current user's learning sessions")
        api.findMatchByTutee(user: user)
            .sink(receiveCompletion: completionHandler) { matches in
                self.learningMatches = matches
            }
            .store(in: &cancellables)
    }
    
    // gets matches the user is tutoring in (teaching sessions)
    func findMatchByTutor(user: User) {
        print("Getting current user's teaching sessions")
        api.findMatchByTutor(user: user)
            .sink(receiveCompletion: completionHandler) { matches in
                self.teachingMatches = matches
            }
            .store(in: &cancellables)
    }
    
    // gets match requests the user wants to get tutored in (learning request sessions)
    func findMatchRequestByTutee(user: User) {
        print("Getting the match requests the current user wants to get tutored in")
        api.findMatchRequestByTutee(user: user)
            .sink(receiveCompletion: completionHandler) { matches in
                self.learningMatchRequests = matches
            }
            .store(in: &cancellables)
    }
    
    // gets match requests the user wants to tutor in (teaching request sessions)
    func findMatchRequestByTutor(user: User) {
        print("Getting the match requests the current user wants to tutor")
        api.findMatchRequestByTutor(user: user)
            .sink(receiveCompletion: completionHandler) { matches in
                self.teachingMatchRequests = matches
            }
            .store(in: &cancellables)
    }
    
    // POSTING (POST REQUEST)
    
    // registers a user and sets the currentUser to the user, otherwise shows user an error message
    func registerUser(username: String, email: String, grade: Int, password: String, frees: [Period], teachableGrades: [Int]) {
        api.registerUser(username: username, email: email, grade: grade, password: password, frees: frees, teachableGrades: teachableGrades)
            .sink(receiveCompletion: completionHandler) { JSONMessage in
                if let user = JSONMessage.user {
                    self.currentUser = user
                } else {
                    self.message = "Can't register, try again?"
                }
            }
            .store(in: &cancellables)
    }
    
    // logs in a user and sets the currentUser to the user, otherwise shows user an error message
    func loginUser(username: String, password: String) {
        api.loginUser(username: username, password: password)
            .sink(receiveCompletion: completionHandler) { JSONMessage in
                if let user = JSONMessage.user {
                    self.currentUser = user
                } else {
                    self.message = "Can't log in, try again?"
                }
            }
            .store(in: &cancellables)
    }
    
    // requests a match for the user and course
    // relationship:
    // true means the user is a teacher (will appear in findMatchRequestByTutor)
    // false means the user is a student (will appear in findMatchRequestByTutee)
    func requestMatch(user: User, course: Course, relationship: Bool) {
        api.requestMatch(user: user, course: course, relationship: relationship)
            .sink(receiveCompletion: completionHandler) { JSONMessage in
                if JSONMessage.match_found {
                    self.message = "Match found!"
                } else {
                    self.message = "Match not found yet..."
                }
            }
            .store(in: &cancellables)
    }
    
    // MISC FUNCTIONS
    
    // gets all the courses in the api
    func getCourseCatalog() {
        api.getCourseCatalog()
            .sink(receiveCompletion: completionHandler) { courseCatalog in
                self.courseCatalog = courseCatalog
            }
            .store(in: &cancellables)
    }
}
