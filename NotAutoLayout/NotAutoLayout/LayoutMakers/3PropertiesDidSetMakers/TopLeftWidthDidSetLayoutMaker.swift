//
//  TopLeftWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopLeftWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: CGRect.Point
	
	let width: CGRect.Float
	
}

extension TopLeftWidthDidSetLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: topLeft.x,
		                   y: topLeft.y,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension TopLeftWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let topLeft = self.topLeft.closureValue(parameter)
			let width = self.width.closureValue(parameter)
			let height = height(parameter)
			let frame = self.makeFrame(topLeft: topLeft, width: width, height: height)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let topLeft = self.topLeft.closureValue(boundSize)
			let width = self.width.closureValue(boundSize)
			let height = fitting(CGSize(width: width, height: fittingHeight)).height
			let frame = self.makeFrame(topLeft: topLeft, width: width, height: height)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}