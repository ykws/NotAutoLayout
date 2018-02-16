//
//  TopLeftBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopLeftBottom<ParentView: UIView> {
		
		let topLeft: LayoutElement.Point<ParentView>
		
		let bottom: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.TopLeftBottom: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.TopLeftBottom {
	
	private func makeFrame(topLeft: CGPoint, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = topLeft.x
		let y = topLeft.y
		let height = bottom - y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopLeftBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = bottom - topLeft.y
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topLeft: topLeft, bottom: bottom, width: width)
		
	}
	
}
