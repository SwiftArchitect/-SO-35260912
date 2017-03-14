//
//  TableViewController.swift
//  SO-35260912
//
//  Copyright © 2017 Xavier Schott
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class TableViewController: UITableViewController {

    let words = ["Cat", "Chicken", "Fish", "Dog",
                 "Mouse", "Guinea Pig", "Monkey", "Cow", "Sheep", "Goat", "Rabbit", "Chicken", "Mouse", "Carp", "Parakeet", "Koi"]

    override func loadView() {
        super.loadView()
        // setup for the automatic height
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    @IBAction func doEditAction(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing

        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell

        func printManyWords(_ count: Int, text:[String]) -> String {
            var paragraph:String = ""
            var cursor = text.count - 1
            var iterator = count
            while iterator >= 0 {
                paragraph += ("" == paragraph ? "" : " ") + text[cursor]
                cursor = (0 == cursor) ? text.count - 1 : cursor - 1
                iterator -= 1
            }
            return paragraph
        }

        cell.configureCell("\(indexPath.row) \(printManyWords(indexPath.row, text: words))")
        
        return cell
    }
}


