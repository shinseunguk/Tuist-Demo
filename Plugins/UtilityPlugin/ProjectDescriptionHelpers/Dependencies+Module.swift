//
//  Dependencies+Module.swift
//  UtilityPlugin
//
//  Created by ukseung.dev on 12/19/24.
//

import ProjectDescription


/// Dependencies + Module
extension TargetDependency {
    public enum Module {
        public static let domain = TargetDependency.project(
            target: TargetName.domain.rawValue,
            path: .relativeToRoot(ProjectPath.domain.rawValue))
        
        public static let presentation = TargetDependency.project(
            target:TargetName.presentation.rawValue,
            path: .relativeToRoot(ProjectPath.presentation.rawValue))
        
        public static let data = TargetDependency.project(
            target: TargetName.data.rawValue,
            path: .relativeToRoot(ProjectPath.data.rawValue))
        
        public static let shared = TargetDependency.project(
            target: TargetName.shared.rawValue,
            path: .relativeToRoot(ProjectPath.shared.rawValue))
    }
}

public enum ProjectPath: String {
    case app = "Tuist-Demo/App"
    case data = "Tuist-Demo/Data"
    case domain = "Tuist-Demo/Domain"
    case presentation = "Tuist-Demo/Presentation"
    case shared = "Tuist-Demo/Shared"
}

public enum TargetName: String {
    case app = "App"
    case data = "Data"
    case domain = "Domain"
    case presentation = "Presentation"
    case shared = "Shared"
}

