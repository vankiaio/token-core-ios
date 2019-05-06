Pod::Spec.new do |s|
  s.name          = "TokenCore"
  s.version       = "0.1"
  s.summary       = "Blockchain Library for imToken"

  s.description   = <<-DESC
  Token Core Library powering imToken iOS app.
  DESC

  s.homepage      = "https://token.im"
  s.license       = {
    type: "Apache License, Version 2.0",
    file: "LICENSE"
  }

  s.author        = { "James Chen" => "james@ashchan.com" }
  s.platform      = :ios, "9.0"

  s.source        = { :git => "https://github.com/vankiaio/token-core-ios.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.{h,m,swift}", "Vendor/**/*.{h,m,c}"
  s.swift_version = "4.0"
  s.vendored_frameworks = [
    "Vendor/secp256k1/secp256k1.framework"
  ]
  s.preserve_paths = "Modules"
  s.pod_target_xcconfig = {
    "SWIFT_INCLUDE_PATHS" => "$(SRCROOT)/TokenCore/Modules",
    "OTHER_LDFLAGS" => "-lObjC",
    "SWIFT_OPTIMIZATION_LEVEL" => "-Owholemodule"
  }
  s.public_header_files = [umbrella_header] + [
    "TokenCore.h",
    "CoreBitcoin.h",
    "NS+BTCBase58.h",
    "NSData+BTCData.h",
    "b64.h",
    "crypto_scrypt-hexconvert.h",
    "libscrypt.h",
    "sha256.h",
    "slowequals.h",
    "sysendian.h"
  ].map{|path| "#{pod_path_prefix}/#{path}"}

  s.dependency "CryptoSwift", "0.9.0"
  s.dependency "BigInt", "3.0.0"
  s.dependency "GRKOpenSSLFramework"
end
