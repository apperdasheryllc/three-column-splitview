//
//  ContentView.swift
//  ThreeColumnStore
//
//  Created by Graham Diehl on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: MyStore
    
    var departmentBinding: Binding<Department.ID?> {
        Binding {
            store.state.departmentId
        } set: { newValue in
            if let newValue {
                store.dispatch(.didSelectDepartmentId(newValue))
           }
        }
    }
    
    var employeeIdsBinding: Binding<Set<Employee.ID>> {
        Binding {
            store.state.employeeIds
        } set: { newValue in
            store.dispatch(.didSelectEmployeeIds(newValue))
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(store.state.departments, selection: departmentBinding) { department in
                Text(department.name)
            }
        } content: {
            if let department = store.state.department {
                List(department.employees, selection: employeeIdsBinding) { employee in
                    Text(employee.name)
                }
            } else {
                Text("Select a department")
            }
        } detail: {
            if let employee = store.state.employee {
                Text("Welcome, \(employee.name)")
            }
            else {
                Text("Select an employee")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
