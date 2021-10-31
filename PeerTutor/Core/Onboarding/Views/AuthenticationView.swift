//
//  AuthenticationView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/25/21.
//

import SwiftUI

struct AuthenticationView: View {
    // shows welcome view only on first screen
    @AppStorage("show_welcome") var showWelcomeView: Bool = true
    @State var showSignIn = false
    @State var showSignUp = false
    
    @StateObject private var vm = AuthenticationViewModel()
    
    var body: some View {
        VStack {
            VStack {
                LogoView()
            }
            .frame(height: 100)
            .padding()
            Text("Create an account or sign in to continue")
                .font(.headline)
            
            Spacer()
            
            Spacer()
            
            Spacer()
            
            VStack(spacing: 50) {
                Button(action: {
                    showSignIn.toggle()
                }, label: {
                    ButtonView(color: Color.theme.orange, text: "Sign In")
                })
                .sheet(isPresented: $showSignIn, content: {
                    signInView
                })
                
                Button(action: {
                    showSignUp.toggle()
                }, label: {
                    ButtonView(color: Color.theme.orange, text: "Sign Up")
                })
                .sheet(isPresented: $showSignUp, content: {
                    signUpView
                })
            }
            
            Spacer()
            
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $showWelcomeView, content: {
            WelcomeView(showWelcome: $showWelcomeView)
        })
    }
}

extension AuthenticationView {
    private var signInView: some View {
        VStack {
            VStack {
                LogoView()
            }
            .frame(height: 100)
            .padding()
            
            Spacer()
            VStack(spacing: 25) {
                VStack(alignment: .leading) {
                    Text("Username")
                    TextField("", text: $vm.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                    SecureField("", text: $vm.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
            }
            .padding()
            .padding(.vertical, 25)
            
            Button(action: {
                vm.login()
            }, label: {
                ButtonView(color: Color.theme.orange, text: "Sign In")
            })
            Spacer()
            Text(vm.alertMessage)
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
    
    private var signUpView: some View {
        ScrollView {
            VStack(spacing: 25) {
                VStack {
                    LogoView()
                }
                .frame(height: 100)
                .padding()
                VStack() {
                    VStack(alignment: .leading) {
                        Text("Username")
                        TextField("", text: $vm.username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Email")
                        TextField("", text: $vm.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                        SecureField("", text: $vm.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Grade")
                        Picker("Grade", selection: $vm.gradePicker, content: {
                            ForEach(0..<vm.grades.count) { grade in
                                Text("\(vm.grades[grade])")
                            }
                        })
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    // columns for the grid
                    let columns: [GridItem] = [
                        GridItem(.flexible(), spacing: nil, alignment: nil),
                        GridItem(.flexible(), spacing: nil, alignment: nil),
                        GridItem(.flexible(), spacing: nil, alignment: nil),
                    ]
                    
                    VStack(alignment: .leading) {
                        Text("Frees")
                        LazyVGrid(columns: columns) {
                            ForEach(0..<vm.allPeriods.count) { periodIndex in
                                let period = vm.allPeriods[periodIndex]
                                PeriodRowView(period: period, color: vm.frees.contains(period) ? Color.theme.orange : Color.theme.secondaryBackground)
                                    .onTapGesture {
                                        withAnimation(.default.speed(2)) {
                                            vm.selectPeriod(period: period)
                                        }
                                    }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Grade Levels You Want to Teach")
                        HStack(spacing: -15) {
                            ForEach(9..<13) { gradeLevel in
                                GradeRowView(grade: gradeLevel, color: vm.teachableGrades.contains(gradeLevel) ? Color.theme.orange : Color.clear)
                                    .onTapGesture {
                                        vm.selectGrade(grade: gradeLevel)
                                    }
                            }
                        }
                        .background(Color.theme.secondaryBackground.cornerRadius(10))
                    }
                }
                .padding()
                .padding(.vertical, 25)
                
                Button(action: {
                    vm.register()
                }, label: {
                    ButtonView(color: Color.theme.orange, text: "Sign Up")
                })
                Text(vm.alertMessage)
            }
        }
    }
}


struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
