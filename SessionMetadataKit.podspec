#
# Be sure to run `pod lib lint SessionMetadataKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SessionMetadataKit"
  s.version          = "1.0.8"
  s.summary          = "A Swift & Objective-C library used by other Session libraries."

  s.description      = <<-DESC
A Swift & Objective-C library used by other Session libraries.
  DESC

  s.homepage         = "https://github.com/loki-project/session-ios-metadata-kit"
  s.license          = 'GPLv3'
  s.author           = { "Niels Andriesse" => "niels@loki.network" }
  s.source           = { :git => "https://github.com/loki-project/session-ios-metadata-kit.git", :tag => "#{s.version}" }
  s.social_media_url = 'https://getsession.org/'

  s.platform     = :ios, '10.0'
  #s.ios.deployment_target = '9.0'
  #s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.source_files  = 'SignalMetadataKit/src/**/*.{h,m,mm,swift}', 'SignalMetadataKit/Private/**/*.{h,m,mm,swift}'

  s.public_header_files = 'SignalMetadataKit/src/**/*.h'

  # We want to use modules to avoid clobbering CocoaLumberjack macros defined
  # by other OWS modules which *also* import CocoaLumberjack. But because we
  # also use Objective-C++, modules are disabled unless we explicitly enable
  # them
  s.compiler_flags = "-fcxx-modules"

  s.prefix_header_file = 'SignalMetadataKit/SMKPrefix.h'
  s.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC' }

  #s.resources = ["SignalMetadataKit/Resources/Certificates/*"]

  s.dependency 'SessionAxolotlKit', '~> 1.0.7'
  s.dependency 'CocoaLumberjack'
  s.dependency 'CryptoSwift', '~> 1.3'
  s.dependency 'SessionCurve25519Kit', '~> 2.1.2'
  s.dependency 'SessionHKDFKit', '~> 0.0.5'
  s.dependency 'SessionCoreKit', '~> 1.0.0'
  s.dependency 'SwiftProtobuf', '~> 1.5.0'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'SignalMetadataKitTests/src/**/*.{h,m,swift}'
  end
end
