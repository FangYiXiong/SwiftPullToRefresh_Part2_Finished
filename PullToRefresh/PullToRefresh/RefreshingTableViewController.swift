//
//  RefreshingTableViewController.swift
//  PullToRefresh
//
//  Created by fang on 15/6/9.
//  Copyright (c) 2015年 Fang YiXiong. All rights reserved.
//

import UIKit

private let kRefreshViewHeight: CGFloat = 200

class RefreshingTableViewController: UITableViewController {
    private var refreshView: RefreshView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshView = RefreshView(frame: CGRect(x: 0, y: -kRefreshViewHeight, width: CGRectGetWidth(view.bounds), height: kRefreshViewHeight), scrollView: tableView)
        view.insertSubview(refreshView, atIndex: 0)
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        // 在这里我们要把这个通知传递给 refresh view
        refreshView.scrollViewDidScroll(scrollView)
    }


    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel!.text = "第 \(indexPath.row) 行"
        return cell
    }
}
