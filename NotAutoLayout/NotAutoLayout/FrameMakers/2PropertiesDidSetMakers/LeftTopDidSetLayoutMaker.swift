//
//  LeftTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: CGRect.Float
	
	let top: CGRect.Float
	
}

extension LeftTopDidSetLayoutMaker {
	
	private func makeFrame(left: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension LeftTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LeftTopWidthDidSetLayoutMaker {
		
		let maker = LeftTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          top: self.top,
		                                          width: .constant(width))
		return maker
		
	}
	
	public func setWidth(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> LeftTopWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(calculation)
		
		let maker = LeftTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          top: self.top,
		                                          width: width)
		
		return maker
		
	}
	
}

extension LeftTopDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> Layout.Individual {
		
		if let left = self.left.constantValue, let top = self.top.constantValue {
			let frame = self.makeFrame(left: left, top: top, size: size)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let left = self.left.closureValue(boundSize)
				let top = self.top.closureValue(boundSize)
				let frame = self.makeFrame(left: left, top: top, size: size)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setSize(by calculation: @escaping (_ boundSize: CGSize) -> CGSize) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			
			let left = self.left.closureValue(boundSize)
			let top = self.top.closureValue(boundSize)
			let size = calculation(boundSize)
			let frame = self.makeFrame(left: left, top: top, size: size)

			return frame
			
		}
		
		return layout
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (fitting, boundSize) -> CGRect in
			
			let left = self.left.closureValue(boundSize)
			let top = self.top.closureValue(boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(left: left, top: top, size: size)

			return frame
			
		}
		
		return layout
		
	}
	
}
