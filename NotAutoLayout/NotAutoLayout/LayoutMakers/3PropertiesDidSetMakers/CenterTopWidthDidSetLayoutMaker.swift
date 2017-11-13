//
//  CenterTopWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterTopWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let top: LayoutElement.Line
	
	let width: LayoutElement.Length
	
}

extension CenterTopWidthDidSetLayoutMaker: LayoutMakerCanSetHeightToMakeLayoutEditorType {

    public typealias WillSetHeightMaker = LayoutEditor
    
    public func makeFrame(height: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
        
        let width = self.width.evaluated(from: parameter, theOtherAxis: .height(0), fittingCalculation: fittingCalculation)
        let height = height.evaluated(from: parameter, theOtherAxis: .width(width), fittingCalculation: fittingCalculation)
        let x = self.center.evaluated(from: parameter) - width.half
        let y = self.top.evaluated(from: parameter)
        return CGRect(x: x, y: y, width: width, height: height)
        
    }

}
