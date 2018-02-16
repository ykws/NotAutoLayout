//
//  BottomLeftRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomLeftRight<ParentView: UIView> {
		
		let bottomLeft: LayoutElement.Point<ParentView>
		
		let right: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.BottomLeftRight: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomLeftRight {
	
	private func makeFrame(bottomLeft: CGPoint, right: CGFloat, top: CGFloat) -> CGRect {
		
		let height = bottomLeft.y - top
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, height: height)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, right: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (bottomLeft.y - middle).doubled
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, height: height)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let width = right - bottomLeft.x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.BottomLeftRight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.BottomLeftRight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.BottomLeftRight: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = right - bottomLeft.x
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, height: height)
		
	}
	
}

