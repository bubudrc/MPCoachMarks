
Pod::Spec.new do |s|
  s.name         = "MPCoachMarks"
  s.version      = "0.0.1"
  s.summary      = "MPCoachMarks is an iOS class that displays user coach marks with a couple of shapescutout over an existing UI. This approach leverages your actual UI as part of the onboarding process for your user."
  s.homepage     = "https://github.com/bubudrc/MPCoachMarks"
  s.screenshots  = "http://zippy.gfycat.com/DefiantTastyDogwoodtwigborer.gif"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Marcelo Perretta" => "marcelo.perretta@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/bubudrc/MPCoachMarks", :tag => s.version }
  s.source_files  = "MPCoachMarks", "MPCoachMarks/**/*.{h,m}"
  s.frameworks = "QuartzCore", "CoreGraphics"
  s.requires_arc = true
end
