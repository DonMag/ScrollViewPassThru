//
//  ExamplesTableViewController.swift
//  ScollViewPassThru
//
//  Created by Don Mini on 4/23/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class MyCellView: UITableViewCell {
	
	@IBOutlet weak var myTitleLabel: UILabel!
	@IBOutlet weak var mySubTitleLabel: UILabel!
	
}

class ExamplesTableViewController: UITableViewController {
	
	let aData: [[String]] = [
		["Overlapping ScrollViews",
		 "Vertical ScrollView overlapping a Horizontal ScrollView. Touches in the top \"empty\" portion of the Vertical Scroll \"Pass Thru\" to the underlying Horizontal ScrollView.",
		 "OverlapSegue"],
		["UIView Overlay on ScrollView",
		 "UIView overlaid on top of a UIScrollView. Touches on the UIView \"Pass Thru\" to the underlying ScrollView, but only if they do NOT touch subviews of the Overlay view.",
		 "OverlaySegue"]
	]
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.estimatedRowHeight = 100

		let v = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
		self.tableView.tableFooterView = v
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCellView

		cell.myTitleLabel.text = aData[indexPath.row][0]
		cell.mySubTitleLabel.text = aData[indexPath.row][1]

        return cell
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let segueID = aData[indexPath.row][2]
		performSegue(withIdentifier: segueID, sender: nil)
	}

}
