Pod::Spec.new do |s|
  s.name         = "Theme"
  s.version      = "5.0.1"
  s.summary      = "Support one or more configurable appearance themes."
  s.author       = 'Hilton Campbell', 'Stephan Heilner'
  s.homepage     = "https://github.com/CrossWaterBridge/Theme"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.source       = { :git => "https://github.com/CrossWaterBridge/Theme.git", :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '10.0'
  s.source_files = 'Theme/*.swift'
  s.requires_arc = true
  s.dependency 'Signals'
  s.swift_version = '4.1'
end
