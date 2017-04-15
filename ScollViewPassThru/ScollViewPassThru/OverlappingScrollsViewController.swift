//
//  OverlappingScrollsViewController.swift
//  ScollViewPassThru
//
//  Created by DonMag on 4/15/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class OverlappingScrollsViewController: UIViewController {

	@IBOutlet weak var redScrollView: UIScrollView!
	
	@IBOutlet weak var blueScrollView: PassThruScrollView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		var prevView: UIView?
		
		let padding: CGFloat = 8
		
		// add some labels as prototype views to the "red" scrollview
		for i in 1...9 {
			
			let myView = UILabel()
			
			myView.text = "Horizontal Scroll image \(i)"
			myView.textAlignment = .center
			myView.backgroundColor = .yellow
			myView.layer.cornerRadius = 16
			myView.layer.borderWidth = 1
			myView.layer.borderColor = UIColor.blue.cgColor
			myView.layer.masksToBounds = true
			
			redScrollView.addSubview(myView)
			
			myView.translatesAutoresizingMaskIntoConstraints = false

			myView.widthAnchor.constraint(equalTo: redScrollView.widthAnchor, constant: -(padding * 2.0)).isActive = true
			myView.heightAnchor.constraint(equalTo: redScrollView.heightAnchor, constant: -(padding * 2.0)).isActive = true

			myView.centerYAnchor.constraint(equalTo: redScrollView.centerYAnchor, constant: 0).isActive = true
			
			if let pv = prevView {
				
				// constrain to right edge of previous image
				myView.leftAnchor.constraint(equalTo: pv.rightAnchor, constant: padding).isActive = true
				
			} else {
				
				// constrain to left of scrollview
				myView.leadingAnchor.constraint(equalTo: redScrollView.leadingAnchor, constant: padding).isActive = true
				
			}
			
			prevView = myView
			
		}
		
		// constraint right edge of last view to right edge of scrollview (sets the .contentSize)
		prevView?.rightAnchor.constraint(equalTo: redScrollView.rightAnchor, constant: padding).isActive = true
		
		//----------------
		
		prevView = nil

		// add a view to use as a "top spaceer" where we want to pass gestures through to the underlying view
		let topSpacerView = UIView()
		
		topSpacerView.backgroundColor = .clear
		
		blueScrollView.addSubview(topSpacerView)
		
		topSpacerView.translatesAutoresizingMaskIntoConstraints = false

		topSpacerView.widthAnchor.constraint(equalTo: blueScrollView.widthAnchor, constant: 0).isActive = true
		topSpacerView.centerXAnchor.constraint(equalTo: blueScrollView.centerXAnchor).isActive = true
		
		topSpacerView.topAnchor.constraint(equalTo: blueScrollView.topAnchor, constant: 0).isActive = true
		
		topSpacerView.heightAnchor.constraint(equalTo: redScrollView.heightAnchor, multiplier: 1).isActive = true
		
		blueScrollView.passThruViewRef = topSpacerView
		
		prevView = topSpacerView
		
		// add some labels as prototype views to the "blue" scrollview
		for i in 1...8 {
			
			let myView = UILabel()
			myView.translatesAutoresizingMaskIntoConstraints = false

			myView.text = "Vertical Scroll image \(i)"
			myView.textAlignment = .center
			myView.backgroundColor = .cyan
			myView.layer.cornerRadius = 16
			myView.layer.borderWidth = 1
			myView.layer.borderColor = UIColor.blue.cgColor
			myView.layer.masksToBounds = true
			
			blueScrollView.addSubview(myView)
			
			myView.widthAnchor.constraint(equalTo: blueScrollView.widthAnchor, constant: -(padding * 2.0)).isActive = true
			myView.heightAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
			
			myView.centerXAnchor.constraint(equalTo: blueScrollView.centerXAnchor).isActive = true
			
			if let pv = prevView {
				
				// constrain to bottom edge of previous image
				myView.topAnchor.constraint(equalTo: pv.bottomAnchor, constant: padding).isActive = true
				
			}
			
			prevView = myView
			
		}
		
		// constraint bottom edge of last view to bottom edge of scrollview (sets the .contentSize)
		prevView?.bottomAnchor.constraint(equalTo: blueScrollView.bottomAnchor, constant: padding).isActive = true
	
		// the "overlying" scrollview is actually in the back in the storyboard, so we can see the "underlying" scrollview during dev
		self.view.bringSubview(toFront: blueScrollView)
		
		redScrollView.backgroundColor = .clear
		blueScrollView.backgroundColor = .clear
		
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
