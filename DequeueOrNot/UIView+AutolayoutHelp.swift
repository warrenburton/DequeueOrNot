//DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//Version 2, December 2004
//
//Copyright (C) 2019 Warren Burton
//
//Everyone is permitted to copy and distribute verbatim or modified
//copies of this license document, and changing it is allowed as long
//as the name is changed.
//
//DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//0. You just DO WHAT THE FUCK YOU WANT TO.

import UIKit

extension UIView {
    func purgeSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }

    /// adds subview before pinning to inside
    func embed(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        pinToInside(subview)
    }

    func embedInsideSafeArea(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
            .isActive = true
        subview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
            .isActive = true
        subview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
            .isActive = true
        subview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            .isActive = true
    }

    /// pins subview to inside of parent
    func pinToInside(_ subview: UIView) {
        assert(subview.superview != nil, "child has no superview!")
        subview.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subview]|", options: [], metrics: nil, views: ["subview": subview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview]|", options: [], metrics: nil, views: ["subview": subview]))
        layoutIfNeeded()
    }

    /// pins subview to inside of parent
    func pinInsideSuperview() {
        guard let superview = superview else {
            return
        }
        superview.pinToInside(self)
    }

    func pinToHorizontalSides(_ subview: UIView) {
        assert(subview.superview != nil, "child has no superview!")
        subview.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subview]|", options: [], metrics: nil, views: ["subview": subview]))
        layoutIfNeeded()
    }

    func pinToVerticalSides(_ subview: UIView, inset: CGFloat = 0) {
        assert(subview.superview != nil, "child has no superview!")
        subview.translatesAutoresizingMaskIntoConstraints = false
        let metrics = ["inset": inset]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(inset)-[subview]-(inset)-|", options: [], metrics: metrics, views: ["subview": subview]))
        layoutIfNeeded()
    }

    @discardableResult func constrainToHeight(_ height: CGFloat) -> NSLayoutConstraint? {
        assert(superview != nil, "self has no superview!")
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: ["height": height], views: ["view": self])
        addConstraints(constraints)
        layoutIfNeeded()
        return constraints.first
    }

    @discardableResult func constrainToWidth(_ width: CGFloat) -> NSLayoutConstraint? {
        assert(superview != nil, "self has no superview!")
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: ["width": width], views: ["view": self])
        addConstraints(constraints)
        layoutIfNeeded()
        return constraints.first
    }

    func centerInParent() {
        assert(superview != nil, "self has no superview!")
        translatesAutoresizingMaskIntoConstraints = false
        let constraintX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0)
        let constraintY = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0)
        superview?.addConstraints([constraintX, constraintY])
        layoutIfNeeded()
    }
}
