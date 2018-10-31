//
//  TableViewController.swift
//  LoadMorePefect
//
//  Created by Trần Đức Anh on 10/6/18.
//  Copyright © 2018 Trần Đức Anh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var arrayNumbers = [Int](0...9)
    var pageIndex = 0 {
        didSet {
            if arrayNumbers.count < 60 {
                arrayNumbers += [Int](arrayNumbers.count ... arrayNumbers.count + 9)
                tableView.reloadData()
            } else {
                indicator.stopAnimating()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(arrayNumbers[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRow = arrayNumbers.count - 1
        if lastRow == indexPath.row {
            pageIndex += 1
        }
    }
}
