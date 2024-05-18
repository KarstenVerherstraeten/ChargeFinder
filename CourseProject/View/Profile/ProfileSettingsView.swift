//
//  ProfileSettingsView.swift
//  CourseProject
//  Partialy helped by ChatGPT
//  Created by Karsten Verherstraeten on 04/04/2024.
//

import SwiftUI


struct ProfileSettingsView: View {
    
    @Binding var name: String
    @Binding var carType: String
    @State private var profileImage: Image? = Image("jefke")
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center) {
            profileImage?
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 100))
                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black, lineWidth: 2)) // Add black outline
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Name:")
                TextField("Enter Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply rounded border text field style
                    .padding(.horizontal)
                
                Text("Car Brand:")
                TextField("Enter Car Brand", text: $carType)
                    .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply rounded border text field style
                    .padding(.horizontal)
            }
            .padding(.vertical)
            
            Button(action: {
                // Save action
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow) // Yellow background
                    .foregroundColor(.black) // Black text
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileSettingsView(name: .constant("Test"), carType: .constant("Volvo"))
}
