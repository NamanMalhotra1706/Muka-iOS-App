//
//  UserProfileService.swift
//  muka App
//
//  Created by student on 25/04/24.
//

import Foundation

import UIKit

class UserProfileService {
    func fetchUserProfile(completion: @escaping (UserProfile?) -> Void) {
        // Implement your data fetching logic here
        // This could involve networking, accessing local storage, etc.
        // For demonstration purposes, let's create a dummy user profile
        
        let placeholderImage = UIImage(named: "Image")!
        let placeholderName = "Manpreet"
        
        let userProfile = UserProfile(name: placeholderName, image: placeholderImage)
        
        // Call the completion handler with the fetched user profile
        completion(userProfile)
    }
}
