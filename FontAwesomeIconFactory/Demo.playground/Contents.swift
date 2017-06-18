// To use this workspace, remember to first build the FontAwesomeIconFactoryOSX target.

import FontAwesomeIconFactory

let factory = NIKFontAwesomeIconFactory()
factory.createImage(.barChart)

factory.colors = [NSColor.orange]
factory.createImage(.flag)

factory.colors = [NSColor.orange, NSColor.red]
factory.strokeWidth = 2
factory.strokeColor = .white
factory.size = 128
factory.createImage(.arrowDown)
