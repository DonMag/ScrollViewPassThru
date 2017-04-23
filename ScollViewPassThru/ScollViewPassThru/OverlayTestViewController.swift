//
//  OverlayTestViewController.swift
//  ScollViewPassThru
//
//  Created by Don Mini on 4/23/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class OverlayTestViewController: UIViewController {
	
	@IBOutlet weak var theScrollView: UIScrollView!
	
	@IBOutlet weak var theTextView: UITextView!
	
	var tapCount = 0
	var didInit = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		var prevView: UIView?
		
		let padding: CGFloat = 8
		
		// add some labels as prototype views to the scrollview
		for i in 1...9 {
			
			let myView = UILabel()
			
			myView.text = "Horizontal Scroll image \(i)"
			myView.textAlignment = .center
			myView.backgroundColor = .yellow
			myView.layer.cornerRadius = 16
			myView.layer.borderWidth = 1
			myView.layer.borderColor = UIColor.blue.cgColor
			myView.layer.masksToBounds = true
			
			theScrollView.addSubview(myView)
			
			myView.translatesAutoresizingMaskIntoConstraints = false
			
			myView.widthAnchor.constraint(equalTo: theScrollView.widthAnchor, constant: -(padding * 2.0)).isActive = true
			myView.heightAnchor.constraint(equalTo: theScrollView.heightAnchor, constant: -(padding * 2.0)).isActive = true
			
			myView.centerYAnchor.constraint(equalTo: theScrollView.centerYAnchor, constant: 0).isActive = true
			
			if let pv = prevView {
				
				// constrain to right edge of previous image
				myView.leftAnchor.constraint(equalTo: pv.rightAnchor, constant: padding).isActive = true
				
			} else {
				
				// constrain to left of scrollview
				myView.leadingAnchor.constraint(equalTo: theScrollView.leadingAnchor, constant: padding).isActive = true
				
			}
			
			prevView = myView
			
		}
		
		// constraint right edge of last view to right edge of scrollview (sets the .contentSize)
		prevView?.rightAnchor.constraint(equalTo: theScrollView.rightAnchor, constant: padding).isActive = true
		
		theTextView.isScrollEnabled = false
		var s = "Scroll me...\n"
		for i in 1...20 {
			s = s + "Line \(i)\n"
		}
		theTextView.text = s

	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		// odd quirk - UITextView does not start with text scrolled to top
		//	so disable scrolling in viewDidLoad, re-enable scrolling in viewDidAppear
		theTextView.isScrollEnabled = true

	}
	
	// just to show we can interact with a button contained in the "Overlay" view
	@IBAction func btnTapped(_ sender: Any) {
		if let btn = sender as? UIButton {
			tapCount += 1
			btn.setTitle("Tap \(tapCount)", for: .normal)
		}
	}
	
	
}
