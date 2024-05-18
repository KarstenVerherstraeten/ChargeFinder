//
//  ProfileView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 04/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @State var name: String = "Steven Stil"
    @State var carType: String = "Tesla Model X"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        NavigationLink(destination: ProfileSettingsView(name: $name, carType: $carType)) {
                            Image(systemName: "pencil")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    
                    Image("jefke")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding(.bottom, 20)
                    
                    Text(name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("200 Punten")
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    
                    HStack {
                        Image(systemName: "car.fill")
                            .foregroundColor(.yellow)
                        Text(carType)
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Image(systemName: "battery.50percent")
                            .foregroundColor(.yellow)
                        Text("100kWh")
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 30)
                    
                    VStack(alignment: .leading) {
                        NavigationLink(destination: PrestatieView()) {
                            HStack {
                                Image(systemName: "medal.fill")
                                    .foregroundColor(.yellow)
                                Text("Prestatie")
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: PrestatieView()) {
                            HStack {
                                Image(systemName: "globe")
                                    .foregroundColor(.yellow)
                                Text("Community prestaties")
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: PrestatieView()) {
                            HStack {
                                Image(systemName: "car.fill")
                                    .foregroundColor(.yellow)
                                Text("Auto Icon")
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: PrestatieView()) {
                            HStack {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.yellow)
                                Text("Persoonlijke voorkeur")
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 69.0)
                    
                    NavigationLink(destination: FirstLaunchView()) {
                        Text("Logout")
                            .foregroundColor(.red)
                            .font(.headline)
                    }
                    .padding(.bottom, 20)
                }
                .navigationBarTitle("Account", displayMode: .inline)
            }
        }
    }
}

#Preview {
    ProfileView()
}
