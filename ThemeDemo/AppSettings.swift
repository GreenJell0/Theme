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

import Foundation
import Theme

enum AppTheme: String {
    case Day = "day"
    case Sepia = "sepia"
    case Night = "night"
    
    static let Choices: [AppTheme] = [.Day, .Sepia, .Night]
}

class AppSettings {
    private static let ThemeKey = "theme"
    
    init() {
        // Set the initial theme on app launch
        ThemeController.shared.themeName = appTheme.rawValue
    }
    
    var appTheme: AppTheme {
        get {
            if let rawValue = UserDefaults.standard.string(forKey: AppSettings.ThemeKey), let appTheme = AppTheme(rawValue: rawValue) {
                return appTheme
            } else {
                return .Day
            }
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: AppSettings.ThemeKey)
            
            ThemeController.shared.themeName = newValue.rawValue
        }
    }
    
    func cycleTheme() {
        // Choose the next app theme
        appTheme = AppTheme.Choices[((AppTheme.Choices.firstIndex(of: appTheme) ?? 0) + 1) % AppTheme.Choices.count]
    }
    
}
