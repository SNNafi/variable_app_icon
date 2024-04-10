#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint variable_app_icon.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'variable_app_icon'
  s.version          = '0.0.3'
  s.summary          = 'A pod to use multiple app icon ios iOS on Flutter app'
  s.description      = <<-DESC
A pod to use multiple app icon ios iOS on Flutter app.
                       DESC
  s.homepage         = 'https://github.com/SNNafi/variable_app_icon/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Shahriar Nasim Nafi' => 'shahriarnasim.nafi@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
