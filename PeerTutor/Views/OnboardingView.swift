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
        switch onboardingStage {
        case 0:
            welcomePage
                .transition(transition)
        case 1:
            learningRequestPage
                .transition(transition)
        case 2:
            teachingRequestPage
                .transition(transition)
        case 3:
            learningSessionPage
                .transition(transition)
        case 4:
            teachingSessionPage
                .transition(transition)
        default:
            Text("Uh oh")
        }
    }
}

extension OnboardingView {
    private var continueButton: some View {
        Button(action: {
            withAnimation {
                onboardingStage += 1
            }
        }, label: {
            HStack {
                Text("Continue")
                Image(systemName: "chevron.right")
            }
            .foregroundColor(Color.theme.background)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.theme.text))
        })
    }
    
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
            
            continueButton
            .font(.headline)
            .padding()
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
            
            TabView(color: Color.theme.red, text: "Your learning\nrequests")
            
            Spacer()
            
            Spacer()
            continueButton
            .font(.headline)
            .padding()
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
            
            TabView(color: Color.theme.yellow, text: "Your teaching\nrequests")
            
            Spacer()
            
            Spacer()
            continueButton
            .font(.headline)
            .padding()
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
            
            TabView(color: Color.theme.blue, text: "Your learning\nsessions")
            
            Spacer()
            
            Spacer()
            continueButton
            .font(.headline)
            .padding()
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
            
            TabView(color: Color.theme.green, text: "Your teaching\nsessions")
            
            Spacer()
            
            Spacer()
            continueButton
            .font(.headline)
            .padding()
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
