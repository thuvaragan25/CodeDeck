import SwiftUI

@main
struct CodeDeckApp: App {
    @StateObject private var modelData = ModelData()
    @StateObject private var userData = UserData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
                .environmentObject(modelData)
        }
    }
}
