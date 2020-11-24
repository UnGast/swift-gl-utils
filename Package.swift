// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GLUtils",
    products: [
        .library(
            name: "GLUtils",
            targets: ["GLUtils"]),
    ],
    dependencies: [
        .package(name: "GL", url: "https://github.com/UnGast/swift-opengl.git", .branch("master")),
        .package(name: "GfxMath", url: "https://github.com/UnGast/swift-gfx-math.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "GLUtils",
            dependencies: ["GL", "GfxMath"])//,
    ]
)
