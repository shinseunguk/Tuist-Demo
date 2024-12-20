//
//  Project+Extensions.swift
//  UtilityPlugin
//
//  Created by ukseung.dev on 12/19/24.
//

@preconcurrency import ProjectDescription

public extension Project {
    public enum Environment {
        public static let appName = "Tuist-Demo"
        public static let destinations: Destinations = [.iPhone]
        public static let deploymentTarget: DeploymentTargets = .iOS("16.0")
        public static let bundlePrefix = "com.iOS"
        public static let featureProductType = ProjectDescription.Product.staticLibrary
        public static let infoPlist: ProjectDescription.InfoPlist = .file(path: .relativeToRoot("Support/Info.plist"))
        public static let resourceFile: ProjectDescription.ResourceFileElements = ["Resources/**"]
    }
}


