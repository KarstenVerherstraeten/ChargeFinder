//
//  profileView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 29/03/2024.
//

import SwiftUI

struct profileView: View {
    static var name: String = ""
    static var carType: String = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                
                NavigationLink {
                    ProfileSettingsView()
                } label: {
                    Image(systemName: "pencil")
                }
                .padding(.leading, 300.0)
                .padding(.top, -5.0)
                .font(.system(size: 25))
                

                
                Image("jefke")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 150, height: 150)
                  .clipShape(RoundedRectangle(cornerRadius: 100))
                Text(profileView.name)
                Text("200 Punten")
                
                HStack{
                    Image(systemName: "car.fill")
                    Text(profileView.carType)
                }
                
                HStack{
                    Image(systemName: "battery.50percent")
                    Text("100kWh")
                }
                
                VStack(alignment: .center){
                    
                        HStack{
                            Image(systemName: "medal.fill")
                            NavigationLink(destination: PrestatieView()) {
                                Text("Prestatie")
                                    .foregroundColor(Color.black)
                                            }
                        }.padding(.all)
                        .frame(width: 250.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    
                    HStack{
                        Image(systemName: "globe")
                        NavigationLink(destination: PrestatieView()) {
                                            Text("Comunity prestaties") .foregroundColor(Color.black)
                                        }
                    }.padding(.all)
                        .frame(width: 250.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    
                    HStack{
                        Image(systemName: "car.fill")
                        NavigationLink(destination: PrestatieView()) {
                                            Text("Auto Icon") .foregroundColor(Color.black)
                                        }
                    }.padding(.all)
                        .frame(width: 250.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    
                    
                    HStack{
                        Image(systemName: "slider.horizontal.3")
                        NavigationLink(destination: PrestatieView()) {
                                            Text("Persoonlijke voorkeur") .foregroundColor(Color.black)
                                        }
                    }.padding(.all)
                        .frame(width: 250.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    
                
                }.padding(.top, 69.0).navigationTitle("Account")
        
            
       
            
           
               
               
                
            
            }
            .padding(.top, -69.0)
           
           
        }
        
        
       
    }
}


#Preview {
    profileView()
}
