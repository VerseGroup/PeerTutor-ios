//
//  CreateTeachingRequestViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import Foundation
import Combine

class CreateTeachingRequestViewModel: ObservableObject {
    var userManager = UserManager.instance
    
    @Published var allCourses: [Course] = []
    
    @Published var selectedCourse: Course? = nil
    
    @Published var requestSuccess: Bool = false
    
    @Published var foundMatch: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        userManager.$courseCatalog
            .map { courseCatalog -> [Course] in
                return courseCatalog.courses
            }
            .sink { [weak self] returnedCourses in
                self?.allCourses = returnedCourses
            }
            .store(in: &cancellables)
        
        userManager.$foundMatch
            .sink { [weak self] foundMatch in
                self?.foundMatch = foundMatch
            }
            .store(in: &cancellables)
    }
    
    func createRequest() {
        if let user = userManager.currentUser,
           let course = selectedCourse {
            userManager.requestMatch(user: user, course: course, relationship: true)
            requestSuccess = true
        }
    }
}
