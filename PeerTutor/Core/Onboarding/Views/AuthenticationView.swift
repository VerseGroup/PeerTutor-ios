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
        VStack {
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
                }
                
                VStack(alignment: .leading) {
                    Text("Email")
                    TextField("", text: $vm.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
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
                
                VStack(alignment: .leading) {
                    Text("Password")
                    SecureField("", text: $vm.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding()
            .padding(.vertical, 25)
            
            Button(action: {
                vm.register()
            }, label: {
                ButtonView(color: Color.theme.orange, text: "Sign Up")
            })
            Spacer()
            Text(vm.alertMessage)
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}


struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
