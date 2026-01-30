//
//  CheckForUpdatesViewModel.swift
//  SparkleTest
//
//  Created by Michael Martell on 1/30/26.
//

import Foundation
import Combine
import Sparkle

final class CheckForUpdatesViewModel: ObservableObject {
    @Published var canCheckForUpdates: Bool = false
    
    init(updater: SPUUpdater) {
        updater.publisher(for: \.canCheckForUpdates)
            .assign(to: &$canCheckForUpdates)
    }
}
