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

class ViewController: UIViewController {
    
    static let CellIdentifier = "Cell"
    
    let appSettings: AppSettings
    
    lazy var tableView: UITableView = {
        let tableView = ThemeAwareTableView(frame: .zero, style: .Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(appSettings: AppSettings) {
        self.appSettings = appSettings
        
        super.init(nibName: nil, bundle: nil)
        
        title = "Theme Demo"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next Theme", style: .Plain, target: self, action: #selector(cycleTheme))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 44
        tableView.registerClass(ThemeAwareTableViewCell.self, forCellReuseIdentifier: ViewController.CellIdentifier)
        
        view.addSubview(tableView)
        
        let views = [
            "tableView": tableView,
        ]
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[tableView]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView]|", options: [], metrics: nil, views: views))
        
        observeTheme(self.dynamicType.themeDidChange)
    }

    func themeDidChange(theme: Theme) {
        // You can make theme adjustments here
    }
    
    func cycleTheme() {
        appSettings.cycleTheme()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.flashScrollIndicators()
    }

}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(ViewController.CellIdentifier, forIndexPath: indexPath)
            cell.textLabel?.text = "Hello, world!"
            return cell
        default:
            break
        }
        
        assert(false, "unhandled case in \(__FUNCTION__)")
        return tableView.dequeueReusableCellWithIdentifier(ViewController.CellIdentifier, forIndexPath: indexPath)
    }
    
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
}
