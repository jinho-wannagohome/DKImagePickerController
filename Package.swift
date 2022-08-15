// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DKImagePickerController",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "DKImagePickerController",
            targets: ["DKImagePickerController"]),
    ],
    dependencies: [
        .package(url: "https://github.com/zhangao0086/DKCamera", .branch("develop")),
        .package(url: "https://github.com/zrn-ns/DKPhotoGallery", .branch("feature/support_swiftpm")),
    ],
    targets: [
        .target(
            name: "DKImagePickerController",
            dependencies: ["DKCamera", "DKPhotoGallery", "CropViewController"],
            path: "Sources"),
        
        .target(name: "TOCropViewController",
                path: "TOCropViewController/ObjC",
                exclude:["Supporting/Info.plist"],
                resources: [.process("Resources")],
                publicHeadersPath: "include"),
        
        .target(
            name: "CropViewController",
            dependencies: ["TOCropViewController"],
            path: "TOCropViewController/Swift",
            exclude:["Info.plist"],
            sources: ["CropViewController.swift"]
        )
    ]
)
