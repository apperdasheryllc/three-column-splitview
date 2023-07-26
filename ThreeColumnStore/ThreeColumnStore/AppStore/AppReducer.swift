//
//  AppReducer.swift
//  ThreeColumnStore
//
//  Created by Graham Diehl on 7/25/23.
//

import Foundation

typealias AppReducer<MyState, AppAction> = (MyState, AppAction) -> MyState

let appReducer: AppReducer<AppState, AppAction> = {state, action in
    var mutatingState = state
    
    switch action {
    case .didTap:
        mutatingState.counter += 1
        
    case .didSelectDepartmentId(let departmentId):
        mutatingState.departmentId = departmentId
        
    case .didSelectEmployeeIds(let employeeIds):
        mutatingState.employeeIds = employeeIds
    }
    
    return mutatingState
}
