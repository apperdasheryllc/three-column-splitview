//
//  Department.swift
//  NavigationSplitView01
//
//  Created by Graham Diehl on 7/24/23.
//

import Foundation

struct Department: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var employees: [Employee] = []
}
