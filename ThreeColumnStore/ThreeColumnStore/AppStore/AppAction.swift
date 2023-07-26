//
//  AppAction.swift
//  ThreeColumnStore
//
//  Created by Graham Diehl on 7/25/23.
//

import Foundation

enum AppAction {
    case didTap
    case didSelectDepartmentId(_ departmentId: Department.ID)
    case didSelectEmployeeIds(_ employeeIds: Set<Employee.ID>)
}
