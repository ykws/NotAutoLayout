//
//  Initial.Sequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension SequentialProperty {
	
	public struct Initial<ParentView: UIView> {
		
	}
	
}

// MARK: - Set A Point -
extension SequentialProperty.Initial: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = SequentialProperty.Middle
	
	public func storeMiddle(_ middle: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, SequentialProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, SequentialProperty.Middle<ParentView>> {
		
		let middle = SequentialProperty.Middle(middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middle)
		
		return maker
		
	}
	
}
