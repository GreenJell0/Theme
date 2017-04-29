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
import Theme

struct DemoTheme: Theme {
    
    static var tintColor: UIColor?
    static var tableViewCellTextColor: UIColor?
    static var tableViewCellBackgroundColor: UIColor?
    static var tableViewCellSelectedBackgroundColor: UIColor?
    static var tableViewSeparatorColor: UIColor?
    static var tableViewBackgroundColor: UIColor?
    static var navigationBarBarStyle: String?
    
    static func themeDefault() {
        tintColor = UIColor(string: "#f00")
        tableViewCellTextColor = UIColor(string: "#000")
        tableViewCellBackgroundColor = UIColor(string: "#fff")
        tableViewCellSelectedBackgroundColor = UIColor(string: "#d9d9d9")
        tableViewSeparatorColor = UIColor(string: "#c8c7cc")
        tableViewBackgroundColor = UIColor(string: "#efeff4")
        navigationBarBarStyle = nil
    }
    
    static func themeNight() {
        themeDefault()
        
        tintColor = UIColor(string: "#00b57c")
        tableViewCellTextColor = UIColor(string: "#fff")
        tableViewCellBackgroundColor = UIColor(string: "#000")
        tableViewCellSelectedBackgroundColor = UIColor(string: "#363636")
        tableViewSeparatorColor = UIColor(string: "#3d3d3d")
        tableViewBackgroundColor = UIColor(string: "#141414")
        navigationBarBarStyle = "black"
    }
    
    static func themeSepia() {
        themeDefault()
        
        tableViewCellBackgroundColor = UIColor(string: "#f8f1e4")
        tableViewCellSelectedBackgroundColor = UIColor(string: "#D9C6A2")
        tableViewSeparatorColor = UIColor(string: "#d0bd9b")
        tableViewBackgroundColor = UIColor(string: "#f3e7d0")
    }
    
    static func setTheme(themeName: String) {
        switch themeName {
        case "night":
            themeNight()
        case "sepia":
            themeSepia()
        default:
            themeDefault()
        }
    }
    
}
