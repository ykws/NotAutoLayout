//
//  MiddleLeftWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleLeftWidthDidSetLayoutMaker {
	
	let parentView: UIView
	
	let middleLeft: CGRect.Point
	
	let width: CGRect.Float
	
}

extension MiddleLeftWidthDidSetLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.half
		let size = CGSize(width: width, height: height)
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension MiddleLeftWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout.Individual {
		
		if let middleLeft = self.middleLeft.constantValue, let width = self.width.constantValue {
			let frame = self.makeFrame(middleLeft: middleLeft, width: width, height: height)
			let layout = Layout.Individual.makeAbsolute(from: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let middleLeft = self.middleLeft.closureValue(boundSize)
				let width = self.width.closureValue(boundSize)
				let frame = self.makeFrame(middleLeft: middleLeft, width: width, height: height)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func calculateHeight(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			let middleLeft = self.middleLeft.closureValue(boundSize)
			let width = self.width.closureValue(boundSize)
			let height = calculation(boundSize)
			let frame = self.makeFrame(middleLeft: middleLeft, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
