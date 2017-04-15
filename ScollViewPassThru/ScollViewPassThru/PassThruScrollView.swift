//
//  PassThruScrollView.swift
//  ScollViewPassThru
//
//  Created by DonMag on 4/15/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class PassThruScrollView: UIScrollView {
	
	var passThruViewRef: UIView?
	
	override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
	
		return point.y > passThruViewRef?.frame.height ?? 0

	}
	
}
