//
//  prestaties.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 04/04/2024.
//

import Foundation


struct Prestatie: Identifiable{
    let id =  UUID()
    let name: String
    let description: String
    let progress: Float
}

let Prestaties = [

    Prestatie(name: "Een nieuwe wereld", description: "Start je eerste laadbeurt", progress: 100),
    
    Prestatie(name: "Nachtlader", description: "Gerbuik 5x een laadpost tussen middernacht en 5u s'ochtens", progress: 40),
    
    Prestatie(name: "Wereldreiziger", description: "gebruik laadpalen in 5 verschillende landen", progress: 0),
    
    Prestatie(name: "Superconnector", description: "gebruik elk type laadpaal", progress: 25),
    
    Prestatie(name: "Laadmeester", description: "Start 500 laadsessies", progress: 87),
    
    Prestatie(name: "Verkenner", description: "Gebruik een laadpaal in elke provincie", progress: 35),
    
    

]
