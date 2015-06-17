// To use this workspace, remember to first build the FontAwesomeIconFactoryOSX target.

import FontAwesomeIconFactory

let factory = NIKFontAwesomeIconFactory()
factory.createImageForIcon(.BarChart)

factory.colors = [NSColor.orangeColor()]
factory.createImageForIcon(.Flag)

factory.colors = [NSColor.orangeColor(), NSColor.redColor()]
factory.strokeWidth = 2
factory.strokeColor = NSColor.whiteColor()
factory.size = 128
factory.createImageForIcon(.ArrowDown)
