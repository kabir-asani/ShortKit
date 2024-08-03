//
//  AutoLayoutX.swift
//
//
//  Created by Kabir Asani on 03/08/24.
//

import UIKit

public extension UIView {
	/// Enables Auto Layout by setting `translatesAutoresizingMaskIntoConstraints = false` on `self`.
	func enableAutoLayout() {
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
	/// Enables Auto Layout and activates the `constraint` passed in as the argument.
	/// - Parameter constraint: The constraint that you want to activate.
	func activateConstraint(_ constraint: NSLayoutConstraint) {
		enableAutoLayout()
		
		constraint.isActive = true
	}
	
	/// Enables Auto Layout and activates all constraints passed in via the `constraints` argument.
	/// - Parameter constraints: The list of constraints that you want to activate.
	func activateAllConstraints(_ constraints: [NSLayoutConstraint]) {
		enableAutoLayout()
		
		NSLayoutConstraint.activate(constraints)
	}
}

// MARK: Pin
extension UIView {
	/// Pins the current view to the top edge of the specified `view`.
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: To pin outward, use a positive `inset` value. To pin inward, use a negative value.
	///
	/// - Parameters:
	///   - view: The ancestor view to which the current view should be pinned.
	///   - inset: The offset for pinning, where a positive value pins away and a negative value pins inward. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide`.
	/// - Returns: The activated constraint representing the pinning operation.
	@discardableResult
	func pin(
		toTopOf view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly. Ensure that the view hierarchy is properly established before calling this method.")
		
		let constraint = self.topAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
			constant: inset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Pins the current view to the bottom edge of the specified `view`.
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: To pin outward, use a positive `inset` value. To pin inward, use a negative value.
	///
	/// - Parameters:
	///   - view: The ancestor view to which the current view should be pinned.
	///   - inset: The offset for pinning, where a positive value pins away and a negative value pins inward. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide`.
	/// - Returns: The activated constraint representing the pinning operation.
	@discardableResult
	func pin(
		toBottomOf view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly. Ensure that the view hierarchy is properly established before calling this method.")
		
		let constraint = self.bottomAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
			constant: inset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Pins the current view to the left edge of the specified `view`.
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: To pin outward, use a positive `inset` value. To pin inward, use a negative value.
	///
	/// - Parameters:
	///   - view: The ancestor view to which the current view should be pinned.
	///   - inset: The offset for pinning, where a positive value pins away and a negative value pins inward. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide`.
	/// - Returns: The activated constraint representing the pinning operation.

	@discardableResult
	func pin(
		toLeftOf view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly. Ensure that the view hierarchy is properly established before calling this method.")
		
		let constraint = self.leadingAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor,
			constant: inset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Pins the current view to the right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For pinning away, use a postive value for `inset` and for pinning into, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to pin onto. It has to be an ancestor of current view.
	///   - inset: The inset with which you want to pin away (or into) by. Defaults to 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func pin(
		toRightOf view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly. Ensure that the view hierarchy is properly established before calling this method.")
		
		let constraint = self.trailingAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor,
			constant: inset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Pins the current view to symmetrically to the top and bottom of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For pinning away, use a postive value for `inset` and for pinning into, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to pin onto. It has to be an ancestor of current view.
	///   - inset: The inset with which you want to pin away (or into) by. Defaults to 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	/// - Returns: A tuple of top and bottom constraints that were created and activated.
	@discardableResult
	func pin(
		verticallySymmetricTo view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> (
		topConstraint: NSLayoutConstraint,
		bottomConstraint: NSLayoutConstraint
	) {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly. Ensure that the view hierarchy is properly established before calling this method.")
		
		let topConstraint = pin(
			toTopOf: view,
			withInset: inset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let bottomConstraint = pin(
			toBottomOf: view,
			withInset: -inset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		return (
			topConstraint: topConstraint,
			bottomConstraint: bottomConstraint
		)
	}
	
	/// Pins the current view to symmetrically to the left and right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For pinning away, use a postive value for `inset` and for pinning into, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to pin onto. It has to be an ancestor of current view.
	///   - inset: The inset with which you want to pin away (or into) by. Defaults to 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	/// - Returns: A tuple of left and right constraints that were created and activated.
	@discardableResult
	func pin(
		horizontallySymmetricTo view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> (
		leftConstraint: NSLayoutConstraint,
		rightConstraint: NSLayoutConstraint
	) {
		let leftConstraint = pin(
			toLeftOf: view,
			withInset: inset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let rightConstraint = pin(
			toBottomOf: view,
			withInset: -inset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		return (
			leftConstraint,
			rightConstraint
		)
	}
	
	/// Pins the current view to the top, bottom, left and right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For pinning away, use a postive value for `inset` and for pinning into, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to pin onto. It has to be an ancestor of current view.
	///   - insets: The insets with which you want to configure the constraints. Defaults to ``UIEdgeInsets.zero``.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	/// - Returns: A tuple of top, bottom, left and right constraints that were created and activated.
	@discardableResult
	func pin(
		to view: UIView,
		withInsets insets: UIEdgeInsets = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> (
		topConstraint: NSLayoutConstraint,
		bottomConstraint: NSLayoutConstraint,
		rightConstraint: NSLayoutConstraint,
		leftConstraint: NSLayoutConstraint
	) {
		let topConstraint = pin(
			toTopOf: view,
			withInset: insets.top,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let bottomConstraint = pin(
			toBottomOf: view,
			withInset: insets.bottom,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let leftConstraint = pin(
			toLeftOf: view,
			withInset: insets.left,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let rightConstraint = pin(
			toRightOf: view,
			withInset: insets.right,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		return (
			topConstraint,
			bottomConstraint,
			rightConstraint,
			leftConstraint
		)
	}
}

// MARK: Align
public extension UIView {
	/// Aligns the current view to the vertical center of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For aligning rightwards, use a postive value for `inset` and for aligning leftwards, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It has to be an ancestor of current view.
	///   - offset: The offset by which you want to align leftware or rightward. Defaults to 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func align(
		toVerticalCenterOf view: UIView,
		withOffset offset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly. Ensure that the view hierarchy is properly established before calling this method.")
		
		let constraint = self.centerYAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.centerYAnchor : view.centerYAnchor,
			constant: offset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Aligns the current view to the horizontal center of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For aligning upwards, use a negative value for `inset` and for aligning downwards, use a positive value.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It has to be an ancestor of current view.
	///   - offset: The offset by which you want to align updward or downward. Defaults to 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func align(
		toHorizontalCenterOf view: UIView,
		withOffset offset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.centerXAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.centerXAnchor : view.centerXAnchor,
			constant: offset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	
	/// Aligns the current view to the horizontal and vertical centers of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For aligning rightwards, use a positive value for `verticalOffset` and for aligning leftwards, use a negative value.
	///
	/// > Tip: For aligning upwards, use a negative value for `horizontalOffset` and for aligning downwards, use a positive value.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It has to be an ancestor of current view.
	///   - verticalOffset: The offset by which you want to align leftware or rightward. Defaults to 0.
	///   - horizontalOffset: The offset by which you want to align updward or downward. Defaults to 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	/// - Returns: A tuple of horizontal and vertical constraints that were created and activated.
	@discardableResult
	func align(
		toCenterOf view: UIView,
		withVerticalOffset verticalOffset: CGFloat = .zero,
		withHorizontalOffset horizontalOffset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> (
		verticalConstraint: NSLayoutConstraint,
		horizontalConstraint: NSLayoutConstraint
	) {
		let verticalConstraint = align(
			toVerticalCenterOf: view,
			withOffset: verticalOffset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		let horizontalConstraint = align(
			toHorizontalCenterOf: view,
			withOffset: horizontalOffset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		return (
			verticalConstraint,
			horizontalConstraint
		)
	}
}

// MARK: Attach
public extension UIView {
	/// Attaches the top of the current view to the bottom of the passed in `view` argument.
	///
	///> Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: A positive margin pushes the views apart and a negative margin causes them to overlap.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attachTop(
		toBottomOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.topAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the top of the current view to the top of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: A positive margin pushes the current view downwards and a negative margin pushes it upwards.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attach(
		toTopOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.topAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the bottom of the current view to the top of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the views apart and a negative margin causes them to overlap.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attachBottom(
		toTopOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.bottomAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the bottom of the current view to the bottom of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view downwards and a negative margin pushes it upwards.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attach(
		toBottomOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.bottomAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the left of the current view to the right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the views apart and a negative margin causes them to overlap.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attachLeft(
		toRightOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.leftAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.rightAnchor : view.rightAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the left of the current view to the left of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view leftwards and a negative margin pushes it rightwards.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attach(
		toLeftOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.leftAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.leftAnchor : view.leftAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the right of the current view to the left of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the views apart and a negative margin causes them to overlap.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attachRight(
		toLeftOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.rightAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.leftAnchor : view.leftAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the right of the current view to the right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view leftwards and a negative margin pushes it rightwards.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attach(
		toRightOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.rightAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.rightAnchor : view.rightAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
}

public extension UIView {
	/// Matches the vertical center of the current view to the vertical center of the passed `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view leftwards and a negative margin pushes it rightwards.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It at has to be a sibling (or ancestor) of the current view.
	///   - offset: The offset by which you want to move your view.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func match(
		toVerticalCenterOf view: UIView,
		withOffset offset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.centerYAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.centerYAnchor : view.centerYAnchor,
			constant: offset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the horizontal center of the current view to the horizontal center of the passed `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view downwards and a negative margin pushes it upwards.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It at has to be a sibling (or ancestor) of the current view.
	///   - offset: The offset by which you want to move your view.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func match(
		toHorizontalCenterOf view: UIView,
		withOffset offset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.centerXAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.centerXAnchor : view.centerXAnchor,
			constant: offset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
}

public extension UIView {
	
	/// Fixes the width of the current view to the passed in `width` argument.
	///
	///
	/// > Important: `width` has to be a non-negative value. A negative value may lead to undefined behaviour.
	///
	/// - Parameter width: The width you want this view to be of. It has be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func fixWidth(
		to width: CGFloat
	) -> NSLayoutConstraint {
		assert(width >= 0, "Width must be a non-negative value.")
		
		let constraint = self.widthAnchor.constraint(equalToConstant: width)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Fixes the height of the current view to the passed in `height` argument.
	///
	///
	/// > Important: `height` has to be a non-negative value. A negative value may lead to undefined behaviour.
	///
	/// - Parameter height: The height you want this view to be of. It has be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func fixHeight(
		to height: CGFloat
	) -> NSLayoutConstraint {
		assert(height >= 0, "Height must be a non-negative value.")
		
		let constraint = self.heightAnchor.constraint(equalToConstant: height)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the height of the current view to be equal to the height of the passed in `view` argument.
	///
	///
	/// > Tip: A negative value for `extra` will shrink the current view and a postiive portion will expand it.
	///
	/// - Parameters:
	///   - view: The view you want to match the height with.
	///   - extra: The additional amount by which the current view's width should exceed (or shrink) by. Default is 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func match(
		heightOf view: UIView,
		withExtraPortion extra: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.heightAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.heightAnchor : view.heightAnchor,
			constant: extra
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the width of the current view to be equal to the width of the passed in `view` argument.
	///
	///
	/// > Tip: A negative value for `extra` will shrink the current view and a postiive portion will expand it.
	///
	/// - Parameters:
	///   - view: The view you want to match the width with.
	///   - extra: The additional amount by which the current view's width should exceed (or shrink) by. Default is 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func match(
		widthOf view: UIView,
		withExtraPortion extra: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.widthAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.widthAnchor : view.widthAnchor,
			constant: extra
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the width of the current view to be equal to the height of the passed-in `view` argument.
	///
	///
	/// > Tip: A negative value for `extra` will shrink the current view and a postiive portion will expand it.
	///
	/// - Parameters:
	///   - view: The view you want to match the current view's height to its width.
	///   - extra: The additional amount by which the current view's height should exceed (or shrink) by. Default is 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func matchWidth(
		toHeightOf view: UIView,
		withExtraPortion extra: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.widthAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.heightAnchor : view.heightAnchor,
			constant: extra
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the width of the current view to be equal to the height of the passed in `view` argument.
	///
	///
	/// > Tip: A negative value for `extra` will shrink the current view and a postiive portion will expand it.
	///
	/// - Parameters:
	///   - view: The view you want to match the current view's height to its width.
	///   - extra: The additional amount by which the current view's width should exceed (or shrink) by. Default is 0.
	///   - safeAreaEnabled: Controls whether you want to pin onto `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	func matchHeight(
		toWidthOf view: UIView,
		withExtraPortion extra: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.heightAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.widthAnchor : view.widthAnchor,
			constant: extra
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches both the width and height of the current view to be equal to `side`.
	///
	///
	/// > Important: A negative value for `side` may cause undefined behavior.
	///
	/// - Parameters:
	///   - view: The view you want to match the current view's height to its width.
	///   - side: The height and width that you want for your current view. It has to be a non-negative value. Defaults to 0.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func squareOff(
		withSide side: CGFloat
	) -> (
		widthConstraint: NSLayoutConstraint,
		heightConstraint: NSLayoutConstraint
	) {
		assert(side >= 0, "Side has to be a non-negative value.")
		let widthConstraint = fixWidth(to: side)
		let heightConstraint = fixHeight(to: side)
		
		return (
			widthConstraint,
			heightConstraint
		)
	}
	
	/// Restricts the width of the current view to be above (inclusive) the given threshold `width`.
	///
	///
	/// > Important: A negative value for `width`may  cause undefined behaviour.
	///
	/// - Parameters:
	///   - width: The threshold width for the current view. It has to be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func restrictWidth(
		toAbove width: CGFloat
	) -> NSLayoutConstraint {
		let constraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: width)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Restricts the height of the current view to be above (inclusive) the given threshold `height`.
	///
	///
	/// > Important: A negative value for `height` may cause undefined behaviour.
	///
	/// - Parameters:
	///   - height: The threshold height for the current view. It has to be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func restrictHeight(
		toAbove height: CGFloat
	) -> NSLayoutConstraint {
		let constraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Restricts the width of the current view to be below (inclusive) the given threshold `width`.
	///
	///
	/// > Important: A negative value for `width` may cause undefined behaviour.
	///
	/// - Parameters:
	///   - width: The threshold width for the current view. It has to be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func restrictWidth(
		toWithin width: CGFloat
	) -> NSLayoutConstraint {
		let constraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: width)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Restricts the width of the current view to be below (inclusive) the given threshold `width`.
	///
	///
	/// > Important: A negative value for `height` may  cause undefined behaviour.
	///
	/// - Parameters:
	///   - height: The threshold height for the current view. It has to be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func restrictHeight(
		toWithin height: CGFloat
	) -> NSLayoutConstraint {
		let constraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: height)
		
		activateConstraint(constraint)
		
		return constraint
	}
}

