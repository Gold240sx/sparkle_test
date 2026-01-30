//
//  SparkleTestApp.swift
//  SparkleTest
//
//  Created by Michael Martell on 1/30/26.
//

import SwiftUI
import SwiftData
import Sparkle

@main
struct SparkleTestApp: App {
    private let updaterController: SPUStandardUpdaterController
    private let updaterDelegate: UpdaterDelegate
    private let updateChecker: UpdateChecker
    
    init() {
        // Create updater delegate for handling update events
        updaterDelegate = UpdaterDelegate()
        
        // Initialize updater controller with delegate
        updaterController = SPUStandardUpdaterController(
            startingUpdater: true,
            updaterDelegate: updaterDelegate,
            userDriverDelegate: nil
        )
        
        // Configure update checker
        // Customize these settings as needed:
        let updateConfig = UpdateChecker.Configuration(
            checkOnLaunch: true,           // Check on launch
            launchCheckDelay: 1.0,         // Wait 1 second after launch
            checkPeriodically: true,       // Check automatically every hour
            updateCheckInterval: 3600,     // 1 hour = 3600 seconds
            checkOnBecomeActive: false     // Don't check when app becomes active
        )
        
        updateChecker = UpdateChecker(
            updater: updaterController.updater,
            configuration: updateConfig
        )
        
        // Check for updates on app launch
        updateChecker.checkOnLaunch()
    }
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        .commands {
            CommandGroup(after: .appInfo) {
                CheckForUpdatesView(updater: updaterController.updater)
            }
        }
    }
}
