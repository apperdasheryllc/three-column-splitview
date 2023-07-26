//
//  ThreeColumnStoreApp.swift
//  ThreeColumnStore
//
//  Created by Graham Diehl on 7/25/23.
//

import SwiftUI

@main
struct ThreeColumnStoreApp: App {
    let store = MyStore(initial: AppState(), reducer: appReducer)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
