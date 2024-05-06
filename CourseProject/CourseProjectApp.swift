//
//  CourseProjectApp.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 29/03/2024.
//

import SwiftUI

@main
struct CourseProjectApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                FirstLaunchView()
            } else {
                ContentView()
            }
        }
    }
}

