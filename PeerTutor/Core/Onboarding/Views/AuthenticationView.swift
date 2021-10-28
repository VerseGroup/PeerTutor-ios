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
                
                Button(action: {
                    showSignUp.toggle()
                }, label: {
                    ButtonView(color: Color.theme.orange, text: "Sign Up")
                })
            }
            
            Spacer()
            
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $showWelcomeView, content: {
            WelcomeView(showWelcome: $showWelcomeView)
        })
        .sheet(isPresented: $showSignIn, content: {
            signInView
        })
        .sheet(isPresented: $showSignUp, content: {
            signUpView
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
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                    TextField("", text: $vm.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding()
            .padding(.vertical, 25)
            
            Button(action: {
                
            }, label: {
                ButtonView(color: Color.theme.orange, text: "Sign In")
            })
            Spacer()
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
            
            Spacer()
            VStack(spacing: 25) {
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
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/,
                           label: Text("Grade"), content: {
                        /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                    })
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                    TextField("", text: $vm.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding()
            .padding(.vertical, 25)
            
            Button(action: {
                
            }, label: {
                ButtonView(color: Color.theme.orange, text: "Sign Up")
            })
            Spacer()
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
