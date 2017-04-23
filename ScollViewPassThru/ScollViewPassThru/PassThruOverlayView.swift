//
//  PassThruOverlayView.swift
//  ScollViewPassThru
//
//  Created by Don Mini on 4/23/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class PassThruOverlayView: UIView {

	override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
		
		for v in subviews {
			
			let ptInSub = v.convert(point, from: v.superview)
			if v.bounds.contains(ptInSub) {
				return true
			}
			
		}
		
		return false
		
	}

}
