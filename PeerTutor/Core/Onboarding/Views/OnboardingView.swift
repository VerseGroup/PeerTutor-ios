//
//  OnboardingView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/19/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var onboardingStage = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    var body: some View {
        TabView {
            welcomePage
                .tag(0)
            learningRequestPage
                .tag(1)
            teachingRequestPage
                .tag(2)
            learningSessionPage
                .tag(3)
            teachingSessionPage
                .tag(4)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

extension OnboardingView {
    
    private var welcomePage: some View {
        VStack {
            VStack {
                Text("Welcome to")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                LogoView()
                Spacer()
                Text("Learn and teach your classmates")
            }
            .frame(height: 100)
            .padding()
            
            Spacer()
            
            Text("Let's get started!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding()
    }
    
    private var learningRequestPage: some View {
        VStack {
            VStack {
                LogoView()
            }
            .frame(height: 100)
            .padding()
            
            Spacer()
            
            Text("Get help in your classes in the learning requests tab")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            MenuTabView(color: Color.theme.red, text: "Your learning\nrequests")
            
            Spacer()
        }
        .padding()
    }
    
    private var teachingRequestPage: some View {
        VStack {
            VStack {
                LogoView()
            }
            .frame(height: 100)
            .padding()
            
            Spacer()
            
            Text("Sign up to help your classmates in the teaching requests tab")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            MenuTabView(color: Color.theme.yellow, text: "Your teaching\nrequests")
            
            Spacer()
        }
        .padding()
    }
    
    private var learningSessionPage: some View {
        VStack {
            VStack {
                LogoView()
            }
            .frame(height: 100)
            .padding()
            
            Spacer()
            
            Text("Once a match is made, see when you’re scheduled to get help in the learning sessions tab")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            MenuTabView(color: Color.theme.blue, text: "Your learning\nsessions")
            
            Spacer()
        }
        .padding()
    }
    
    private var teachingSessionPage: some View {
        VStack {
            VStack {
                LogoView()
            }
            .frame(height: 100)
            .padding()
            
            Spacer()
            
            Text("Once a match is made, see when you’re scheduled to tutor in the teaching sessions tab")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            MenuTabView(color: Color.theme.green, text: "Your teaching\nsessions")
            
            Spacer()
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OnboardingView()
                .navigationBarHidden(true)
        }
    }
}
