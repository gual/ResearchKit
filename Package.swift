// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResearchKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Main product that includes all three frameworks
        .library(
            name: "ResearchKit",
            targets: ["ResearchKit", "ResearchKitUI", "ResearchKitActiveTask"]
        ),
        // Individual framework products for modular usage
        .library(
            name: "ResearchKitCore",
            targets: ["ResearchKit"]
        ),
        .library(
            name: "ResearchKitUI", 
            targets: ["ResearchKitUI"]
        ),
        .library(
            name: "ResearchKitActiveTask",
            targets: ["ResearchKitActiveTask"]
        )
    ],
    targets: [
        // ResearchKit Core Framework
        .target(
            name: "ResearchKit",
            path: "ResearchKit",
            exclude: [
                "Info.plist",
                "ResearchKit.docc",
                "Configuration",
                "PrivacyInfo.xcprivacy"
            ],
            sources: [
                "Common",
                "Consent", 
                "Onboarding",
                "Stale"
            ],
            resources: [
                .process("Localized"),
                .process("Artwork.xcassets")
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("Common"),
                .headerSearchPath("Consent"),
                .headerSearchPath("Onboarding"),
                .headerSearchPath("Stale")
            ]
        ),
        
        // ResearchKit UI Framework  
        .target(
            name: "ResearchKitUI",
            dependencies: ["ResearchKit"],
            path: "ResearchKitUI",
            exclude: [
                "Info.plist",
                "Info-iOS.plist", 
                "PrivacyInfo.xcprivacy"
            ],
            resources: [
                .process("Localized")
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        
        // ResearchKit Active Task Framework
        .target(
            name: "ResearchKitActiveTask", 
            dependencies: ["ResearchKit", "ResearchKitUI"],
            path: "ResearchKitActiveTask",
            exclude: [
                "Info.plist",
                "PrivacyInfo.xcprivacy",
                "ResearchKitActiveTask.docc"
            ],
            sources: [
                "3D Model",
                "AmslerGrid", 
                "Audio",
                "Common",
                "Fitness",
                "Front Facing Camera",
                "Hole Peg Test",
                "ORKSpeechInNoise",
                "PSAT",
                "Range of Motion",
                "Reaction Time", 
                "Spatial Span Memory",
                "SpeechRecognition",
                "Stroop",
                "Tapping",
                "Tone Audiometry",
                "Touch Ability",
                "TowerOfHanoi",
                "Trailmaking",
                "Walking",
                "dBHL Tone Audiometry",
                "environmentSPLMeter"
            ],
            resources: [
                .process("ORKSpeechInNoise/Noise.wav"),
                .process("ORKSpeechInNoise/Window.wav"),
                .process("environmentSPLMeter/splMeter_sensitivity_offset.plist")
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("3D Model"),
                .headerSearchPath("AmslerGrid"),
                .headerSearchPath("Audio"), 
                .headerSearchPath("Common"),
                .headerSearchPath("Fitness"),
                .headerSearchPath("Front Facing Camera"),
                .headerSearchPath("Hole Peg Test"),
                .headerSearchPath("ORKSpeechInNoise"),
                .headerSearchPath("PSAT"),
                .headerSearchPath("Range of Motion"),
                .headerSearchPath("Reaction Time"),
                .headerSearchPath("Spatial Span Memory"),
                .headerSearchPath("SpeechRecognition"),
                .headerSearchPath("Stroop"),
                .headerSearchPath("Tapping"),
                .headerSearchPath("Tone Audiometry"),
                .headerSearchPath("Touch Ability"),
                .headerSearchPath("TowerOfHanoi"),
                .headerSearchPath("Trailmaking"),
                .headerSearchPath("Walking"),
                .headerSearchPath("dBHL Tone Audiometry"),
                .headerSearchPath("environmentSPLMeter")
            ]
        ),
        
        // Test target
        .testTarget(
            name: "ResearchKitTests",
            dependencies: ["ResearchKit", "ResearchKitUI", "ResearchKitActiveTask"],
            path: "ResearchKitTests",
            exclude: [
                "Info.plist",
                "samples.bundle"
            ],
            resources: [
                .process("samples.bundle")
            ]
        )
    ]
)