//
//  Config.swift
//  Config
//
//  Created by ukseung.dev on 12/19/24.
//

import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToRoot("Plugins/UtilityPlugin"))
    ]
)
