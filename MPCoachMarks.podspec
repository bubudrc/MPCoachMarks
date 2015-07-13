Pod::Spec.new do |s|
  s.name         = "MPCoachMarks"
  s.version      = "1.0.0"
  s.summary      = "MPCoachMarks is an iOS class that displays user coach marks with a couple of shapescutout over an existing UI. This approach leverages your actual UI as part of the onboarding process for your user. "
  s.homepage     = "https://github.com/bubudrc/MPCoachMarks"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = "https://github.com/bubudrc/MPCoachMarks"
  s.authors      = { "Marcelo Perretta" => "marcelo.perretta@gmail.com" }
  s.source       = { :git => "https://github.com/bubudrc/MPCoachMarks.git", :tag => s.version.to_s }
  s.platform 	= :ios
  s.source_files = 'MPCoachMarks/*.{h,m}'
  s.ios.frameworks  = 'Foundation', 'QuartzCore', 'UIKit'
  s.requires_arc = true
end
