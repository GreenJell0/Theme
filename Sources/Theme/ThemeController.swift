//
// Copyright (c) 2015 Hilton Campbell
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Combine
import Foundation

public class ThemeController: NSObject {
    
    public static var shared = ThemeController()
    
    let themeSubject = PassthroughSubject<Void, Never>()

    private var theme: Theme.Type?
    private var cancellables = Set<AnyCancellable>()
    
    struct Subscription {
        weak var object: AnyObject?
        let cancellable: AnyCancellable
    }
    private var subscriptions = [Subscription]()
    
    public var themeName = "" {
        didSet {
            theme?.setTheme(themeName: themeName)
            handleThemeChange()
        }
    }
    
    public func setTheme(_ theme: Theme.Type) {
        self.theme = theme
        
        theme.setTheme(themeName: themeName)
        handleThemeChange()
    }
        
    public func observeTheme<T: AnyObject>(_ object: T, _ callback: @escaping () -> Void) {
        let cancellable = themeSubject
            .sink { _ in
                callback()
            }
        subscriptions.append(Subscription(object: object, cancellable: cancellable))
        
        callback()
    }
    
    private func handleThemeChange() {
        flushCancelledSubscriptions()
        themeSubject.send()
    }
    
    private func flushCancelledSubscriptions() {
        subscriptions = subscriptions.filter { subscription in
            if subscription.object == nil {
                subscription.cancellable.cancel()
                return false
            }
            return true
        }
    }
}
