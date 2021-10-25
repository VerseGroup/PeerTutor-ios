//
//  PreviewProvider.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    let homeVM = HomeViewModel()
}
