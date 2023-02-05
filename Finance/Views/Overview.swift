//
//  Overview.swift
//  Finance
//
//  Created by Luka Ivanović on 10.02.2023..
//

import SwiftUI
import CoreData

struct Overview: View {
    @EnvironmentObject private var data: Data
    
    var body: some View {
        NavigationStack{
            AssetsList()
            .navigationTitle("\(data.balance)")
        }
        
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
            .environmentObject(Data())
    }
}
