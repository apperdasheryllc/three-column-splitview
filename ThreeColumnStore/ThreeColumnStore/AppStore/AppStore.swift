//
//  AppStore.swift
//  ThreeColumnStore
//
//  Created by Graham Diehl on 7/25/23.
//

import Foundation

typealias MyStore = AppStore<AppState, AppAction>

class AppStore<State, Action>: ObservableObject {
    @Published var state: AppState
    private let reducer: AppReducer<AppState, AppAction>
    private let queue = DispatchQueue(
        label: "net.apperdashery.core.store",
        qos: .userInitiated
    )
    
    init(
        initial: AppState,
        reducer: @escaping AppReducer<AppState, AppAction>
    ) {
        self.state = initial
        self.reducer = reducer
    }
    
    func dispatch(_ action: AppAction) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }
    
    private func dispatch(_ currentState: AppState, _ action: AppAction) {
        let newState = reducer(currentState, action)
        state = newState
    }
}
