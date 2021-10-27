//
//  AboutView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/25/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            // background
            Color.aboutTheme.background
                .ignoresSafeArea()
            VStack(spacing: 50) {
                // content
                VStack {
                    Text("""
                    This app was made by...
                    
                    Paul Evans
                     • Handled making the backend of the app
                    Malcolm Krolick
                     • Handled dealing with hosting the server
                    Steven Yu
                     • Made the iOS app
                    
                    This app made use of:
                     • SwiftUI
                     • Combine
                     • Networking
                     • Flask
                    """)
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(Color.aboutTheme.foreground)
                )
                
                HStack {
                    Spacer()
                    
                    Link(destination: URL(string: "https://github.com/TextbookConnect/PeerTutor-ios")!) {
                        Label(
                            title: {
                                Text("iOS App Source Code")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            },
                            icon: {
                                Image(systemName: "link.circle.fill")
                                    .font(.headline)
                            }
                        )
                    }
                    .frame(width: 150, height: 75)
                    .background(
                        RoundedRectangle(cornerRadius: 15.0)
                            .foregroundColor(Color.aboutTheme.foreground)
                    )
                    
                    Spacer()
                    
                    Link(destination: URL(string: "https://github.com/TextbookConnect/PeerTutor")!) {
                        Label(
                            title: {
                                Text("Flask API Source Code")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            },
                            icon: {
                                Image(systemName: "link.circle.fill")
                                    .font(.headline)
                            }
                        )
                    }
                    .frame(width: 150, height: 75)
                    .background(
                        RoundedRectangle(cornerRadius: 15.0)
                            .foregroundColor(Color.aboutTheme.foreground)
                    )
                    
                    Spacer()
                }
            }
            .padding()
        }
        .navigationBarTitle("About")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutView()
                .navigationBarHidden(true)
        }
    }
}
