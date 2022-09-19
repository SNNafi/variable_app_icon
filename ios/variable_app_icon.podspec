#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint variable_app_icon.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'variable_app_icon'
  s.version          = '0.0.1'
  s.summary          = 'A plugin to use multiple app icon on iOS'
  s.description      = <<-DESC
A plugin to use multiple app icon on iOS
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
