FontAwesomeIconFactory
======================

A factory for turning Font Awesome icons into images for user interface
controls. Works for iOS and OS X.

Font Awesome was created by Dave Gandy.
http://fortawesome.github.com/Font-Awesome

FontAwesomeIconFactory was created by Nikolaj Schumacher.

![OS X ≥ 10.7](https://img.shields.io/badge/OS%20X-≥%2010.7-lightgrey.svg) ![iOS ≥ 6.0](https://img.shields.io/badge/iOS%20-≥%206.0-lightgrey.svg) ![CocoaPods compatible](https://img.shields.io/cocoapods/v/FontAwesomeIconFactory.svg) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

[![Build Status](https://travis-ci.org/nschum/FontAwesomeIconFactory.svg?branch=master)](https://travis-ci.org/nschum/FontAwesomeIconFactory)

![screenshot Interface Builder](https://nschum.github.io/FontAwesomeIconFactory/screenshot-IB@2x.png)
![screenshot OS X](https://nschum.github.io/FontAwesomeIconFactory/screenshot-OSX@2x.png)
![screenshot iOS](https://nschum.github.io/FontAwesomeIconFactory/screenshot-iOS@2x.png)

Setup
-----

### CocoaPods ###

Add the following to your Podfile:

    pod 'FontAwesomeIconFactory'

Then run `pod install` as usual.

Changes
-------

### 2.1.0 ###

- Fixes a naming regression in the Swift version of the enum.

### 2.1 ###

- Updates Font Awesome to version 4.2.0 for new and changed icons.
- Fixed for usage with Xcode 7.

### 2.0.2 ###

- FontAwesome is now a proper framework and supports Carthage.

### 2.0.1 ###

- [Fix clipped icons](https://github.com/nschum/FontAwesomeIconFactory/issues/9)
- Annotated generic collection types for Swift 2.

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
