//
//  Project+Setting.swift
//  UtilityPlugin
//
//  Created by ukseung.dev on 12/19/24.
//

@preconcurrency import ProjectDescription

public extension Settings {
    static let defaultSettings: Self = {
        .settings(configurations: [
            .defaultRelease,
            .defaultDebug,
            .defaultTest
        ])
    }()
}
