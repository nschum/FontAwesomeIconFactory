Pod::Spec.new do |s|
  s.name         = "FontAwesomeIconFactory"
  s.version      = "2.0.1"
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
    :tag => "2.0.1",
    :submodules => "true"
  }

  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"

  s.source_files = "*.{h,m}"
  s.ios.source_files = "iOS/*.{h,m}"
  s.ios.exclude_files = "**/*+OSX.*"
  s.osx.source_files = "OSX/*.{h,m}"
  s.osx.exclude_files = "**/*+iOS.*"

  s.public_header_files = [
    "FontAwesomeIconFactory.h",
    "NIKFontAwesomeIconFactory*.h",
    "NIKFontAwesomeIcon.h",
    "NIKFontAwesomeIconTraits.h"
  ]
  s.ios.public_header_files = "iOS/*.h"
  s.osx.public_header_files = "OSX/*.h"

  s.resource  = "Font-Awesome/fonts/FontAwesome.otf"
  s.ios.frameworks = "CoreText", "CoreGraphics"
  s.osx.frameworks = "CoreText", "CoreGraphics", "ApplicationServices"

  s.requires_arc = true

end
