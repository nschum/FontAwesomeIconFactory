FontAwesomeIconFactory
======================

A factory for turning Font Awesome icons into images for user interface
controls. Works for iOS and OS X.

Font Awesome was created by Dave Gandy.
http://fortawesome.github.com/Font-Awesome

FontAwesomeIconFactory was created by Nikolaj Schumacher.

[![Build Status](https://travis-ci.org/nschum/FontAwesomeIconFactory.png?branch=master)](https://travis-ci.org/nschum/FontAwesomeIconFactory)

![screenshot Interface Builder](https://nschum.github.io/FontAwesomeIconFactory/screenshot-IB@2x.png)
![screenshot OS X](https://nschum.github.io/FontAwesomeIconFactory/screenshot-OSX@2x.png)
![screenshot iOS](https://nschum.github.io/FontAwesomeIconFactory/screenshot-iOS@2x.png)

Setup
-----

### CocoaPods ###

Add the following to your Podfile:

    pod 'FontAwesomeIconFactory'

Then run `pod install` as usual.

### Manual Installation ###

If you don't use CocoaPods, copy the *.m and *.h files from the repository root
level, and FontAwesome.otf into your project.

The font is included as a submodule. So remember to run `git submodule update --init` if you clone this repository.

Changes
-------

### 2.0 ###

- Updates Font Awesome to version 4.3.0 for new and changed icons.
- Annotated for nicer use in Swift.
- Support for adding icons to iOS controls in Interface Builder.

### 1.4 ###

- Updates Font Awesome to version 4.2.0 for new and changed icons.

### 1.3 ###

- Updates Font Awesome to version 4.0.3 for new and changed icons.
- On iOS 7 `renderingMode` is now adjusted automatically when setting a color.

### 1.2.1 ###

- Updates Font Awesome to version 3.2.1.
- Butter support for iOS 7 by allowing to override `renderingMode`.

### 1.2 ###

- Updates Font Awesome to version 3.2 for new and changed icons.
- The images now actually have the exact height (and width if `square` is set)
  specified in the `size` property. Get the old behavior (where the image is
  only as high as needed) by setting `padded` to `NO`. The predefined factories
  have been adjusted in size.

### 1.1 ###

- Updates Font Awesome to version 3.1.1 for 54 new icons.

### 1.0.1 ###

- Removes the need to modify the Info.plist.
