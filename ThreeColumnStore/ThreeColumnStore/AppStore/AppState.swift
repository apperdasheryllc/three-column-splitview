//
//  AppState.swift
//  ThreeColumnStore
//
//  Created by Graham Diehl on 7/25/23.
//

import Foundation

protocol MyState {}

struct AppState: MyState, Equatable {
    var counter: Int = 0
    var departmentId: Department.ID?
    var employeeIds: Set<Employee.ID> = []
    
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
    
    var department: Department? {
        return departments.filter { $0.id == departmentId }.first
    }
    
    var employee: Employee? {
        guard
            let department
        else {
            return nil
        }
        
        let employee = department.employees.first { employee in
            employeeIds.contains(employee.id)
        }
        
        return employee
    }
}
