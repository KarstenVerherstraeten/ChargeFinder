//
//  CustomProgressBar.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 04/04/2024. + chatGPT
//

import SwiftUI

struct CustomProgressBar: View {
    var value: Double
    var total: Double
    
    private var percentage: Double {
        (value / total)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: geometry.size.width, height: 20) // Use the available width
                
                Capsule()
                    .fill(Color.yellow) // Your preferred progress color
                    .frame(width: geometry.size.width * CGFloat(percentage), height: 20) // Calculate width based on available space and percentage
                
                HStack {
                    Spacer()
                    Text("\(Int(percentage * 100))%")
                        .foregroundColor(.black)
                    Spacer()
                }
            }
        }
        .frame(height: 20) // Fixed height for the progress bar
        .cornerRadius(10) // Rounded corners for the capsule
    }
}
#Preview {
    CustomProgressBar(value: 99, total: 100)
}
