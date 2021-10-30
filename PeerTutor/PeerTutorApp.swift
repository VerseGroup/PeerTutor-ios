//
//  PeerTutorApp.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/8/21.
//

import SwiftUI

@main

// removed homeVM, i dont think it's needed...
struct PeerTutorApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView()
        }
    }
}
