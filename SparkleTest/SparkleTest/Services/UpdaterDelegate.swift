//
//  UpdaterDelegate.swift
//  SparkleTest
//
//  Created by Michael Martell on 1/30/26.
//

import Foundation
import Sparkle

/// Delegate to handle automatic update checking on app launch
class UpdaterDelegate: NSObject, SPUUpdaterDelegate {
    func updaterDidNotFindUpdate(_ updater: SPUUpdater, error: Error) {
        // Handle case when no update is found
        print("No update available: \(error.localizedDescription)")
    }
    
    func updater(_ updater: SPUUpdater, didFinishUpdateCycleFor updateCheck: SPUUpdateCheck, error: Error?) {
        if let error = error {
            print("Update check finished with error: \(error.localizedDescription)")
        } else {
            print("Update check completed successfully")
        }
    }
}
