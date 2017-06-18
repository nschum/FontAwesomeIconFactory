// To use this workspace, remember to first build the FontAwesomeIconFactoryOSX target.

import FontAwesomeIconFactory

let factory = NIKFontAwesomeIconFactory()
factory.createImage(for: .barChart)

factory.colors = [NSColor.orange]
factory.createImage(for: .flag)

factory.colors = [NSColor.orange, NSColor.red]
factory.strokeWidth = 2
factory.strokeColor = .white
factory.size = 128
factory.createImage(for: .arrowDown)
