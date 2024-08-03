//
//  LayerX.swift
//
//
//  Created by Kabir Asani on 03/08/24.
//

import UIKit


public extension UIView {
	func enableClipToBounds() {
		self.clipsToBounds = true
	}
	
	func disableClipToBounds() {
		self.clipsToBounds = false
	}
}

public extension UIView {
	/// Rounds all corners of the view to the specified radius.
	///
	/// This method applies a uniform corner radius to all four corners of the view,
	/// giving it a rounded appearance.
	///
	/// - Important: Ensure that the view's bounds are set correctly before calling this method,
	/// as the corner radius is applied based on the view's current bounds.
	///
	/// - Parameter radius: The radius to use when rounding the corners of the view. A larger value will result in more pronounced rounding.
	func roundAll(
		withRadius radius: CGFloat
	) {
		enableClipToBounds()
		
		self.layer.cornerRadius = radius
	}
	
	/// Rounds only the top corners of the view to the specified radius.
	///
	/// This method applies a corner radius to the top-left and top-right corners of the view,
	/// creating a rounded appearance only at the top.
	///
	/// - Important: Ensure that the view's bounds are set correctly before calling this method,
	/// as the corner radius is applied based on the view's current bounds.
	///
	/// - Parameter radius: The radius to use when rounding the top corners of the view. A larger value will result in more pronounced rounding.
	func roundOnlyTop(
		toRadius radius: CGFloat
	) {
		enableClipToBounds()
		
		self.layer.cornerRadius = radius
		self.layer.maskedCorners = [
			.layerMinXMinYCorner,
			.layerMaxXMinYCorner
		]
	}
	
	/// Rounds only the bottom corners of the view to the specified radius.
	///
	/// This method applies a corner radius to the bottom-left and bottom-right corners of the view,
	/// creating a rounded appearance only at the bottom.
	///
	/// - Important: Ensure that the view's bounds are set correctly before calling this method,
	/// as the corner radius is applied based on the view's current bounds.
	///
	/// - Parameter radius: The radius to use when rounding the bottom corners of the view. A larger value will result in more pronounced rounding.
	func roundOnlyBottom(
		toRadius radius: CGFloat
	) {
		enableClipToBounds()
		
		self.layer.cornerRadius = radius
		self.layer.maskedCorners = [
			.layerMaxXMinYCorner,
			.layerMaxXMaxYCorner
		]
	}
}

public extension UIView {
	/// Adds a shadow to the view with the specified properties.
	///
	/// This method configures the view's `layer` to display a shadow with the given color, opacity, offset, radius, and optional path.
	///
	/// - Parameters:
	///   - color: The color of the shadow. Defaults to ``UIColor.black``.
	///   - opacity: The opacity of the shadow, specified as a value from 0.0 (transparent) to 1.0 (opaque). Defauls to 0.5.
	///   - offset: The offset of the shadow from the view, specified as a CGSize. Defaults to (0, -3).
	///   - radius: The blur radius used to create the shadow. Defaults to 3.
	///   - path: An optional bezier path that specifies the outline of the shadow. If nil, the view’s bounds will be used. Defaults to nil.
	func addShadow(
		color: UIColor = .black,
		opacity: Float = 0.5,
		offset: CGSize = CGSize(width: 0, height: -3),
		radius: CGFloat = 3,
		path: UIBezierPath? = nil
	) {
		self.layer.shadowColor = color.cgColor
		self.layer.shadowOpacity = opacity
		self.layer.shadowOffset = offset
		self.layer.shadowRadius = radius
		
		// If a path is provided, use it; otherwise, default to the view's bounds.
		if let shadowPath = path {
			self.layer.shadowPath = shadowPath.cgPath
		} else {
			self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
		}
	}
	
	/// Removes the shadow from the view.
	///
	/// This method resets the view's `layer` shadow properties, effectively removing any shadow applied to it.
	func removeShadow() {
		self.layer.shadowColor = nil
		self.layer.shadowOpacity = 0
		self.layer.shadowOffset = CGSize.zero
		self.layer.shadowRadius = 0
		self.layer.shadowPath = nil
	}
}

public extension UIView {
	/// Adds a border to the current view with the specified color and width.
	///
	/// This method configures the view's `layer` to display a border.
	///
	/// - Parameters:
	///   - color: The color of the border. Defaults to ``UIColor.black``.
	///   - width: The width of the border. Defaults to 1.
	func addBorder(
		color: UIColor = .black,
		width: CGFloat = 1.0
	) {
		self.layer.borderColor = color.cgColor
		self.layer.borderWidth = width
	}
	
	/// Removes the border from the view.
	///
	/// This method resets the view's `layer` border properties, effectively removing any border applied to it.
	func removeBorder() {
		self.layer.borderColor = nil
		self.layer.borderWidth = 0
	}
}
