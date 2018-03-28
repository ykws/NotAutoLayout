//
//  CenterBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterBottom {
		
		let center: LayoutElement.Horizontal
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterBottom {
	
	private func makeFrame(center: Float, bottom: Float, size: Size) -> Rect {
		
		let left = center - size.width.half
		let top = bottom - size.height
		let origin = Point(x: left, y: top)
		let size = size
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.CenterBottom: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterBottom: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.CenterBottomWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.CenterBottom>) -> LayoutMaker<IndividualProperty.CenterBottomWidth> {
		
		let centerBottomWidth = IndividualProperty.CenterBottomWidth(center: self.center,
																		bottom: self.bottom,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerBottomWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.CenterBottom: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.CenterBottomHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.CenterBottom>) -> LayoutMaker<IndividualProperty.CenterBottomHeight> {
		
		let centerBottomHeight = IndividualProperty.CenterBottomHeight(center: self.center,
																		  bottom: self.bottom,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerBottomHeight)
		
		return maker
		
	}
	
}