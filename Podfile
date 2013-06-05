workspace 'FontAwesomeIconFactory'

# https://github.com/CocoaPods/CocoaPods/issues/738
xcodeproj 'FontAwesomeIconFactoryDemo/FontAwesomeIconFactoryDemo.xcodeproj'
xcodeproj 'FontAwesomeIconFactoryDemoOSX/FontAwesomeIconFactoryDemoOSX.xcodeproj'

target 'FontAwesomeIconFactoryTests', :exclusive => true do
  xcodeproj 'FontAwesomeIconFactoryDemo/FontAwesomeIconFactoryDemo.xcodeproj'
  platform :ios, "6.0"
  pod 'OCHamcrest', '= 2.0.1'
end

target 'FontAwesomeIconFactoryTestsOSX', :exclusive => true do
  xcodeproj 'FontAwesomeIconFactoryDemoOSX/FontAwesomeIconFactoryDemoOSX.xcodeproj'
  platform :osx, "10.7"
  pod 'OCHamcrest', '= 2.0.1'
end
