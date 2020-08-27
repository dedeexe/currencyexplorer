// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "ProjectModules",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "HexagonalArchtecture",
            targets: [
                "HexagonArchtecture"
            ]
        ),
    ],
    dependencies: [
        .package(url: "git@github.com:dedeexe/DDXNetwork.git", .exact("1.0.0")),
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.8.1")
    ],
    targets: [

        // ========================================
        // MODULES
        // ========================================
        .target(
            name: "HexagonEdges",
            dependencies: [
                "DDXNetwork"
            ]
        ),

        .target(
            name: "HexagonArchtecture",
            dependencies: [
                "HexagonEdges",
                "DDXNetwork"
            ]
        ),

        // ========================================
        // TESTS
        // ========================================

        .testTarget(
            name: "HexagonArchtectureTests",
            dependencies: [
                "HexagonArchtecture",
                "HexagonEdges"
            ]
        ),

        .testTarget(
            name: "HexagonArchtectureIntegratedTests",
            dependencies: [
                "HexagonArchtecture",
                "HexagonEdges"
            ]
        )
    ]
)

