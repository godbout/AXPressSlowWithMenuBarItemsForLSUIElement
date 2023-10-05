import AppKit


class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]
        AXIsProcessTrustedWithOptions(options)
        
        guard AXIsProcessTrusted() else {
            return
        }
                
        var axElement: AXUIElement?
        // AXPress the  of the menu bar
        if AXUIElementCopyElementAtPosition(AXUIElementCreateSystemWide(), Float(10), Float(10), &axElement) == .success, axElement != nil {
            AXUIElementPerformAction(axElement!, kAXPressAction as CFString)
        }
    }

}
