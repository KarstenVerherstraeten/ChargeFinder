//
//  ProfileSettingsView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 04/04/2024.
//

import SwiftUI

struct ProfileSettingsView: View {
    
    @Binding var name: String
    @Binding var carType: String
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack(alignment: .center){

            Image("jefke")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 100))
           
            
            
            
            VStack{
                Text("naam:")
                TextField("Enter Name", text: $name)
            }
            
            VStack{
                Text("Auto merk:")
                TextField("Enter Car brand", text: $carType)
            }
     
            
            Button(action: {
                            // Pass the name and car type values to profileView
                            name = name
                            carType = carType
                
                self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Save")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
            
        }
    }
}

#Preview {
    ProfileSettingsView(name: .constant("Test"), carType: .constant("Volvo"))
}
