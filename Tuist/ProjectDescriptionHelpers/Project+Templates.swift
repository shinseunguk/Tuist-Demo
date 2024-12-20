//
//  Project+Templates.swift
//  Config
//
//  Created by ukseung.dev on 12/19/24.
//

import ProjectDescription
import Foundation
import UtilityPlugin

public extension Project {

    static let bundleId = "\(Environment.bundlePrefix).Tuist-Demo"
//    public static let teamCode: String = ""
    static let version: SettingValue = "1.0.0"
    static let build: SettingValue = "1"

    // MARK: make App

    static func app(
        name: String,
        product: Product = .app,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return project(
            name: name,
            product: product,
            dependencies: dependencies,
            resources: resources
        )
    }

    // MARK: make Framework(from a Project)

    static func framework(
        name: String,
        product: Product = .framework,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return project(
            name: name,
            product: product,
            dependencies: dependencies,
            resources: resources
        )
    }

    // MARK: make Project

    static func project(
        name: String,
        product: Product,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project{
        return Project(
            name: name,
            settings: .makeSetting(),
            targets: [
                Target.target(
                    name: name,
                    destinations: Environment.destinations,
                    product: product,
                    bundleId: "\(bundleId).\(name)",
                    deploymentTargets: Environment.deploymentTarget,
                    infoPlist: Environment.infoPlist,
                    sources: ["Sources/**"],
                    resources: resources,
                    dependencies: dependencies
                ),
                Target.target(
                    name: "\(name)Tests",
                    destinations: Environment.destinations,
                    product: .unitTests,
                    bundleId: "\(bundleId).\(name)Tests",
                    deploymentTargets: Environment.deploymentTarget,
                    infoPlist: Environment.infoPlist,
                    sources: ["Tests/**"],
                    dependencies: [.target(name: name)]
                )
            ],
            schemes: [.makeScheme(target: .debug, name: name)]
        )
    }
}

// MARK: make Settings

public extension Settings{
    static func makeSetting() -> Settings {
        return settings(
            base: defaultProjectSetting,
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ],
            defaultSettings: .recommended
        )
    }
    
    static let defaultProjectSetting = SettingsDictionary()//.automaticCodeSigning(devTeam: Project.teamCode)
        .merging([
            "MARKETING_VERSION" : Project.version,
            "CURRENT_PROJECT_VERSION" : Project.build,
            "OTHER_LDFLAGS" : "$(inherited) -ObjC"
        ])
}

// MARK: make Scheme

public extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme.scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
