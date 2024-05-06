//
//  PrestatieView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 04/04/2024.
//

import SwiftUI

struct PrestatieView: View {
    var body: some View {
        List(Prestaties) { prestatie in
            VStack{
                Text(prestatie.name)
                    .font(.headline)
        Text(prestatie.description)
                
                CustomProgressBar(value:  Double(prestatie.progress), total: 100)
                    

            }
                    
                }
                .navigationBarTitle("Prestaties", displayMode: .inline)
    }
}

#Preview {
    PrestatieView()
}
