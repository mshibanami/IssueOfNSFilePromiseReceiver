//
//  ViewController.swift
//  IssueOfNSFilePromiseReceiver
//
//  Created by abc on 2018/03/11.
//  Copyright © 2018 mshibanami. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class DraggableView: NSView {
    override func awakeFromNib() {
        super.awakeFromNib()

        let types = NSFilePromiseReceiver.readableDraggedTypes.map {
            NSPasteboard.PasteboardType(rawValue: $0) }
        registerForDraggedTypes(types)
        registerForDraggedTypes([.png, .tiff])
    }

    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        super.draggingEntered(sender)
        return .copy
    }

    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return true
    }

    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let pasteboard = sender.draggingPasteboard()

        let typeStrs = pasteboard.types?
            .map { $0.rawValue }
            .joined(separator: "\n")
        print("🔵 pasteboard.types: -----------------------------------")
        print("\(typeStrs!) \n")

        let objects = pasteboard
            .readObjects(
                forClasses: [NSFilePromiseReceiver.self],
                options: nil)
        print("🔵 objects: -----------------------------------")
        print("\(objects!) \n")

        return true
    }
}
