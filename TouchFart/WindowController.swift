//
//  WindowController.swift
//  Meh
//
//  Created by Hung Truong on 10/27/16.
//  Copyright © 2016 Hung Truong. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBar.CustomizationIdentifier {
    static let touchBar = NSTouchBar.CustomizationIdentifier("com.hung-truong.meh")
}

fileprivate extension NSTouchBarItem.Identifier {
    static let meh     = NSTouchBarItem.Identifier("meh")
}


class WindowController: NSWindowController, NSTouchBarDelegate {

    @objc func handleMeh(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: NSSound.Name(rawValue: title)) else {
            return
        }
        sound.play()
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier    = .touchBar
        touchBar.defaultItemIdentifiers     = .meh
        
        return touchBar
    }
    
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        let touchBarItem    = NSCustomTouchBarItem(identifier: identifier)
        touchBarItem.view   = NSButton(title: identifier.rawValue, target: self, action: #selector(handleMeh))
        return touchBarItem
    }
}
