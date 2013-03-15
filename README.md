FontAwesomeIconFactory
======================

A factory for turning Font Awesome icons into images for user interface
controls. Works for iOS and OS X.

Font Awesome was created by Dave Gandy.
http://fortawesome.github.com/Font-Awesome

FontAwesomeIconFactory was created by Nikolaj Schumacher.

Setup
-----

### Info.plist ###

For iOS apps, edit your app's Info.plist to contain the key: "Fonts provided by
application" (UIAppFonts). Then add "FontAwesome.otf" to the list under that
key.

This is what the XML should look like:

    <key>UIAppFonts</key>
    <array>
        <string>FontAwesome.otf</string>
    </array>

For OSX apps, edit your app's Info.plist to contain the key: "Application fonts
resource path" (ATSApplicationFontsPath). Set the value to "." (or to the
resource path where you have the font file copied).

This is what the XML should look like:

    <key>ATSApplicationFontsPath</key>
    <string>.</string>

### CocoaPods ###

Add the following to your Podfile:

    pod 'FontAwesomeIconFactory', '~> 1.0'

Then run `pod install` as usual.

### Manual Installation ###

If you don't use CocoaPods, copy the *.m and *.h files from the repository root
level, and FontAwesome.otf into your project.
