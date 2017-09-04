Pod::Spec.new do |s|
  s.name        = "iCalKit"
  s.version     = "0.1.0"
  s.summary     = "Parse and generate iCalendar (.ics) files in Swift"
  s.description = <<-DESC
    A library to help with parsing and generating iCalender (.ics) files with a pretty API.
  DESC

  s.homepage         = "https://github.com/kiliankoe/iCalKit"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Kilian Koeltzsch" => "me@kilian.io" }
  s.social_media_url = "https://twitter.com/kiliankoe"

  s.ios.deployment_target     = "8.0"
  s.osx.deployment_target     = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target    = "9.0"

  s.source       = { :git => "https://github.com/kiliankoe/iCalKit.git", :tag => s.version.to_s }
  s.source_files = "Sources/**/*"
  s.frameworks   = "Foundation"
end
