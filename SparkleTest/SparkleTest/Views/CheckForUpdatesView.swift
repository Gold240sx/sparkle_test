//
//  CheckForUpdatesView.swift
//  SparkleTest
//
//  Created by Michael Martell on 1/30/26.
//

import SwiftUI
import Sparkle

struct CheckForUpdatesView: View {
    @ObservedObject private var viewModel: CheckForUpdatesViewModel
    private let updater: SPUUpdater
    
    init(updater: SPUUpdater) {
        self.updater = updater
        self.viewModel = CheckForUpdatesViewModel(updater: updater)
    }
    
    var body: some View {
        Button("Check For Updates...", action: updater.checkForUpdates)
            .disabled(!viewModel.canCheckForUpdates)
    }
}
