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

public extension UIColor {
    struct Static {
        static let regex = try! NSRegularExpression(pattern: "^(?:#([0-9a-fA-F]{3})|#([0-9a-fA-F]{6})|rgb\\(([^)]+)\\)|rgba\\(([^)]+)\\))$", options: [])
    }
    
    public convenience init?(string: String) {
        if let match = Static.regex.firstMatch(in: string, options: [], range: NSMakeRange(0, (string as NSString).length)) {
            // #cf0
            let range1 = match.range(at: 1)
            if range1.location != NSNotFound {
                let scanner = Scanner(string: (string as NSString).substring(with: range1))
                
                var rgb: UInt32 = 0
                scanner.scanHexInt32(&rgb)
                
                self.init(red: CGFloat((rgb & 0xF00) >> 8) / 15, green: CGFloat((rgb & 0x0F0) >> 4) / 15, blue: CGFloat(rgb & 0x00F) / 15, alpha: 1)
                return
            }
            
            // #ccff00
            let range2 = match.range(at: 2)
            if range2.location != NSNotFound {
                let scanner = Scanner(string: (string as NSString).substring(with: range2))
                
                var rgb: UInt32 = 0
                scanner.scanHexInt32(&rgb)
                
                self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255, green: CGFloat((rgb & 0x00FF00) >> 8) / 255, blue: CGFloat(rgb & 0x0000FF) / 255, alpha: 1)
                return
            }
            
            // rgb(204, 255, 0)
            let range3 = match.range(at: 3)
            if range3.location != NSNotFound {
                let scanner = Scanner(string: (string as NSString).substring(with: range3))
                
                var r: Int = 0
                scanner.scanInt(&r)
                scanner.scanString(",", into: nil)
                
                var g: Int = 0
                scanner.scanInt(&g)
                scanner.scanString(",", into: nil)
                
                var b: Int = 0
                scanner.scanInt(&b)
                scanner.scanString(",", into: nil)
                
                self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: 1)
                return
            }
            
            // rgba(204, 255, 0, 0.7)
            let range4 = match.range(at: 4)
            if range4.location != NSNotFound {
                let scanner = Scanner(string: (string as NSString).substring(with: range4))
                
                var r: Int = 0
                scanner.scanInt(&r)
                scanner.scanString(",", into: nil)
                
                var g: Int = 0
                scanner.scanInt(&g)
                scanner.scanString(",", into: nil)
                
                var b: Int = 0
                scanner.scanInt(&b)
                scanner.scanString(",", into: nil)
                
                var a: Double = 0
                scanner.scanDouble(&a)
                
                self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a))
                return
            }
        }
        
        return nil
    }
}
