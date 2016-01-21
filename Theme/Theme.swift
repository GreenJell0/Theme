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

import UIKit

public class Theme: NSObject {
    
    let name: String
    let themesDictionary: NSDictionary
    
    init(named name: String, themesDictionary: NSDictionary) {
        self.name = name
        self.themesDictionary = themesDictionary
    }
    
    public func stringForKeyPath(keyPath: String) -> String? {
        let value = themesDictionary.valueForKeyPath(keyPath)
        switch value {
        case let values as NSDictionary:
            return (values[name] as? String) ?? (values["*"] as? String)
        default:
            return value as? String
        }
    }
    
    public func colorForKeyPath(keyPath: String) -> UIColor? {
        if let string = stringForKeyPath(keyPath) {
            return UIColor(string: string)
        } else {
            return nil
        }
    }

}
