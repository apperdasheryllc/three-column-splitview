//
//  EmployeeDetails.swift
//  NavigationSplitView01
//
//  Created by Graham Diehl on 7/24/23.
//

import SwiftUI

/**
 Show employee details
 */

struct EmployeeDetails: View {
    var employeeIds: Set<Employee.ID>
    
    var body: some View {
        VStack {
            Text("EmployeeDetails")
        }
    }
}

struct EmployeeDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetails(employeeIds: [UUID()])
    }
}
