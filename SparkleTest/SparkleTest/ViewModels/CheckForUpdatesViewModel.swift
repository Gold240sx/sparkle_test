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
    
    // Store the subscription to maintain it for the lifetime of the ViewModel
    private var cancellable: AnyCancellable?
    
    init(updater: SPUUpdater) {
        // Store the AnyCancellable to keep the subscription alive
        // Without storing it, the subscription would be cancelled immediately
        cancellable = updater.publisher(for: \.canCheckForUpdates)
            .receive(on: DispatchQueue.main)
            .assign(to: \.canCheckForUpdates, on: self)
    }
}
