//
//  Project.swift
//  dippin-iOSManifests
//
//  Created by inforex on 9/13/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "Shared",
    dependencies: [],
    resources: Project.Environment.resourceFile
)
