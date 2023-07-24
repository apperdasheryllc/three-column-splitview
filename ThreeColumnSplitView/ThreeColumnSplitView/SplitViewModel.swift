//
//  SplitViewModel.swift
//  ThreeColumnSplitView
//
//  Created by Graham Diehl on 7/24/23.
//

import Foundation

/**
 Data model for the split view, derived from the documentation
 */

struct SplitViewModel {
    
    let humanResources = Department(
        name: "Human Resources", employees: [
            Employee(name: "Bob"),
            Employee(name: "Joe")
        ]
    )
    
    let sales = Department(
        name: "Sales",
        employees: [
            Employee(name: "Mary"),
            Employee(name: "Pat")
        ]
    )
    
    let marketing = Department(
        name: "Marketing",
        employees: [
            Employee(name: "Jeff"),
            Employee(name: "Brook")
        ]
    )
    
    var departments: [Department] {
        return [humanResources, sales, marketing]
    }
    
    func department(id: UUID?) -> Department? {
        return departments.filter { $0.id == id }.first
    }
}
