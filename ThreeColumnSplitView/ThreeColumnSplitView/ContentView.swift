//
//  ContentView.swift
//  ThreeColumnSplitView
//
//  Created by Graham Diehl on 7/24/23.
//

import SwiftUI

/**
 Turn the Apple documentation on 3 column Navigation Split View into a working app for demonstration.
 https://developer.apple.com/documentation/swiftui/navigationsplitview
 */

struct ContentView: View {
    let model = SplitViewModel()
    
    // ===================================
    //MARK: - This is all Apple gives you
    @State private var departmentId: Department.ID? // Single selection.
    @State private var employeeIds: Set<Employee.ID> = [] // Multiple selection.
    
    var body: some View {
        NavigationSplitView {
            List(model.departments, selection: $departmentId) { department in
                Text(department.name)
            }
        } content: {
            if let department = model.department(id: departmentId) {
                List(department.employees, selection: $employeeIds) { employee in
                    Text(employee.name)
                }
            } else {
                Text("Select a department")
            }
        } detail: {
            EmployeeDetails(employeeIds: employeeIds)
        }
    }
    // ===================================
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
