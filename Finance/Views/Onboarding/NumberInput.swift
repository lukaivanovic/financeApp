//
//  NumberInput.swift
//  Finance
//
//  Created by Luka Ivanović on 11.02.2023..
//

import SwiftUI

struct NumberInput: View {
    var textLabel: String
    
    @Binding var textInput: Int
    @Binding var pathAbove: NavigationPath
    @Binding var isUser: Bool
    
    @State private var currentInput = ""
    
    enum FocusField: Hashable {
      case field
    }

    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        TextField(textLabel, text: $currentInput)
            .multilineTextAlignment(.center)
            .navigationBarBackButtonHidden(true)
            .focused($focusedField, equals: .field)
            .onAppear {
                self.focusedField = .field
            }
            .onSubmit {
                textInput = Int(currentInput) ?? 0
                pathAbove.append(120)
                isUser = true
            }

    }
}

//struct NumberInput_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberInput()
//    }
//}
