Pod::Spec.new do |s|
  s.name         = "FontAwesomeIconFactory"
  s.version      = "2.1"
  s.summary      = "Create icons using the resolution-independent Font Awesome."
  s.description  = <<-DESC
                    A factory for turning Font Awesome pictograms into icon
                    images for user interface controls and buttons. Works for
                    iOS and OS X.

                    Font Awesome by Dave Gandy -
                    http://fortawesome.github.com/Font-Awesome
                   DESC
  s.homepage     = "https://nschum.github.com/FontAwesomeIconFactory/"

  s.license      = "OFL/MIT"
  s.author       = { "Nikolaj Schumacher" => "me@nschum.de" }

  s.source       = {
    :git => "https://github.com/nschum/FontAwesomeIconFactory.git",
    :tag => "2.1",
    :submodules => "true"
  }

  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"

  s.source_files = "FontAwesomeIconFactory/*.{h,m}"
  s.ios.source_files = "FontAwesomeIconFactory/iOS/*.{h,m}"
  s.osx.source_files = "FontAwesomeIconFactory/OSX/*.{h,m}"

  s.resource = "Font-Awesome/fonts/FontAwesome.otf"
  s.ios.frameworks = "CoreText", "CoreGraphics"
  s.osx.frameworks = "CoreText", "CoreGraphics", "ApplicationServices"

end
