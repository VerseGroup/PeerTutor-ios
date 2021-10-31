//
//  CreateTeachingRequestView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct CreateTeachingRequestView: View {
    
    @StateObject private var vm = CreateTeachingRequestViewModel()
    @State private var selectedCourse: Course? = nil
    
    var body: some View {
        ZStack {
            Color.teachingRequestTheme.background
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Label(
                            title: { Text("Select a Course") },
                            icon: { Image(systemName: "text.book.closed.fill") }
                        )
                        ForEach(vm.allCourses) { course in
                            CourseInfoView(color: course.id == selectedCourse?.id ? Color.teachingRequestTheme.foreground.opacity(0.5) : Color.teachingRequestTheme.foreground, course: course)
                                .onTapGesture {
                                    selectedCourse = course
                                    vm.selectedCourse = course
                                }
                        }
                        
                        Label(
                            title: { Text("Send the Request") },
                            icon: { Image(systemName: "paperplane.fill") }
                        )
                        selectCourseButton
                    }
                    Text(vm.foundMatch ? "Match Found!" : "")
                }
            }
            .padding()
        }
        .navigationTitle("Add teaching request")
    }
}

extension CreateTeachingRequestView {
    private var selectCourseButton: some View {
        Button(action: {
            vm.createRequest()
        }, label: {
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(vm.requestSuccess ? "Request Sent" : "Make a Request")
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: vm.requestSuccess ? "checkmark" : "plus")
                            .font(Font.title.weight(.medium))
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.teachingRequestTheme.foreground)
                        .shadow(color: Color.theme.secondaryText.opacity(0.2), radius: 5, y: 5)
                )
            }
            .frame(height: 100)
            .foregroundColor(Color.theme.text)
            .font(.title)
        })
    }
}

struct CreateTeachingRequestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateTeachingRequestView()
        }
    }
}
