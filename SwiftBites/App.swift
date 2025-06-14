import SwiftUI

@main
struct SwiftBitesApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(BiteContainer.create())
  }
}
