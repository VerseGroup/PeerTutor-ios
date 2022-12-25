//
//  APIManager.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/25/21.
//

import Foundation
import Combine
import Networking


// Handles downloading and posting all the data from the API
struct APIManager: NetworkingService {
    
    let network = NetworkingClient(baseURL: "https://urchin-app-zppcb.ondigitalocean.app/api")
    
    // gets user info
    func getUser(id: Int) -> AnyPublisher<User, Error> {
        get("/user/\(id)")
    }
    
    // gets course info
    func getCourse(id: Int) -> AnyPublisher<Course, Error> {
        get("/course/\(id)")
    }
    
    // gets matches where the user is the tutee (learning sessions)
    func findMatchByTutee(user: User) -> AnyPublisher<Matches, Error> {
        get("/findmatchbytutee/\(user.id)")
    }
    
    // gets matches where the user is the tutor (teaching sessions)
    func findMatchByTutor(user: User) -> AnyPublisher<Matches, Error> {
        get("/findmatchbytutor/\(user.id)")
    }
    
    // gets match requests where the user wants to be tutee (learning requests)
    func findMatchRequestByTutee(user: User) -> AnyPublisher<MatchRequests, Error> {
        get("/findmatchrequestbytutee/\(user.id)")
    }
    
    // gets match requests where the user wants to be the tutor (teaching requests)
    func findMatchRequestByTutor(user: User) -> AnyPublisher<MatchRequests, Error> {
        get("/findmatchrequestbytutor/\(user.id)")
    }
    
    // registers a user
    func registerUser(username: String, email: String, grade: Int, password: String, frees: [Period], teachableGrades: [Int]) -> AnyPublisher<RegisterJSONMessage, Error> {
        post("/register", params: ["username": username, "email": email, "grade": grade, "password": password, "frees": frees.map{$0.rawValue}.joined(separator: ","), "teachableGrades": teachableGrades.map{String.init($0)}.joined(separator: ",")])
    }
    
    // sends a match request
    // relationship:
    // true means the user is a teacher (will appear in findMatchRequestByTutor)
    // false means the user is a student (will appear in findMatchRequestByTutee)
    func requestMatch(user: User, course: Course, relationship: Bool) -> AnyPublisher<RequestJSONMessage, Error> {
        post("/request", params: ["user_id": user.id, "course_id": course.id, "relationship": relationship])
    }
    
    // logs in a user
    func loginUser(username: String, password: String) -> AnyPublisher<LoginJSONMessage, Error> {
        post("/login", params: ["username": username, "password": password])
    }
    
    // gets all courses in the api
    func getCourseCatalog() -> AnyPublisher<CourseCatalog, Error> {
        get("/courses")
    }
}
