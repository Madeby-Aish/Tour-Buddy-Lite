import SwiftUI

// 1. GLOBAL SETTINGS CLASS (Defined ONLY here)
class AppSettings: ObservableObject {
    @AppStorage("fontSizeMultiplier") var fontSizeMultiplier: Double = 1.0
    
    func increaseFont() { if fontSizeMultiplier < 2.0 { fontSizeMultiplier += 0.1 } }
    func decreaseFont() { if fontSizeMultiplier > 0.5 { fontSizeMultiplier -= 0.1 } }
}

@main
struct TourBuddyLiteApp: App {
    @StateObject private var settings = AppSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
        .commands {
            // BACK SHORTCUT (Cmd + [)
            CommandMenu("Navigation") {
                Button("Go Back") {
                    NotificationCenter.default.post(name: NSNotification.Name("GoBack"), object: nil)
                }
                .keyboardShortcut("[", modifiers: .command)
            }
            
            // SEARCH SHORTCUT (Cmd + F)
            CommandGroup(replacing: .textEditing) {
                Button("Find...") {
                    NotificationCenter.default.post(name: NSNotification.Name("FocusSearch"), object: nil)
                }
                .keyboardShortcut("f", modifiers: .command)
            }
            
            // FONT SCALING (Cmd + / Cmd -)
            CommandGroup(replacing: .textFormatting) {
                Button("Increase Font Size") { settings.increaseFont() }
                    .keyboardShortcut("=", modifiers: .command) // Cmd + = (standard zoom in)
                
                Button("Decrease Font Size") { settings.decreaseFont() }
                    .keyboardShortcut("-", modifiers: .command) // Cmd + -
                
                Button("Reset Font Size") { settings.fontSizeMultiplier = 1.0 }
                    .keyboardShortcut("0", modifiers: .command)
            }
        }
    }
}
