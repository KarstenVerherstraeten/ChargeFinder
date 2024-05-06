//
//  FirstLaunchView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 05/05/2024.
//

import SwiftUI

struct FirstLaunchView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true

    var body: some View {
        VStack {
            Text("First Launch")
            Button("Finish Onboarding") {
                isFirstLaunch = false
            }
        }
    }
}

#Preview {
    FirstLaunchView()
}
