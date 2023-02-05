//
//  Data.swift
//  Finance
//
//  Created by Luka Ivanović on 06.02.2023..
//

import Foundation
import SwiftUI

final class Data: ObservableObject {
    @AppStorage("username") var usernameS = ""
    @AppStorage("isUser") var isUser = false
    @AppStorage("balance") var balance = 0
    
    @AppStorage("assets") var loll = 0
    
}
