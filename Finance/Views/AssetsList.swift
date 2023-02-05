//
//  Assets.swift
//  Finance
//
//  Created by Luka Ivanović on 12.02.2023..
//

import SwiftUI

struct AssetsList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Assets.name, ascending: true)],
        animation: .default)
    private var assets: FetchedResults<Assets>
    
    @State private var isAdding: Bool = false
    @State private var assetName: String = ""
    
    enum FocusField: Hashable {
      case field
    }

    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        List{
            
            ForEach(assets){ item in
                Text("\(item.name!)")
            }
            .onDelete(perform: deleteItems)
            
            if(isAdding){
                TextField("Asset name", text: $assetName)
                    .focused($focusedField, equals: .field)
                    .onAppear{
                        self.focusedField = .field
                    }
                    .onSubmit {
                        if(assetName == ""){
                            isAdding = false
                        } else {
                            addItem(name: assetName)
                            isAdding = false
                            assetName = ""
                        }
                    }
                    
            } else {
                Button("Add new asset"){
                    // addItem()
                    isAdding = true
                }
            }
        }
    }
    
    private func addItem(name: String) {
        let newAsset = Assets(context: viewContext)
        newAsset.name = name
        
        do {
            try viewContext.save()
        } catch {
            print("error")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { assets[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct AssetsList_Previews: PreviewProvider {
    static var previews: some View {
        AssetsList()
    }
}
