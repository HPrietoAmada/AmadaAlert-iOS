//
//  Button.swift
//  AmadaAlert
//
//  Created by IT Support on 12/16/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit
public protocol ButtonDelegate {
    func button(_ button: Button, buttonClicked tag: Int)
}

public class Button: UIButton {

    var activeColor: UIColor?

    var delegate: ButtonDelegate?

    fileprivate var heightLayoutConstraint: NSLayoutConstraint?
    fileprivate var widthLayoutConstraint: NSLayoutConstraint?

    var _height: CGFloat = 40 {
        didSet {
            guard let heightLayoutConstraint = heightLayoutConstraint else {
                return
            }

            let buttonIsHidden = heightLayoutConstraint.constant == 0

            heightLayoutConstraint.constant = buttonIsHidden ? 0 : _height
        }
    }

    var _width: CGFloat = 60 {
        didSet {
            guard let widthLayoutConstraint = widthLayoutConstraint else {
                return
            }
            widthLayoutConstraint.constant = _width
        }
    }

    var _fontSize: CGFloat = 16 {
        didSet {
            titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: _fontSize)
        }
    }

    var _font: UIFont = UIFont(name: "HelveticaNeue-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16) {
        didSet {
            titleLabel?.font = _font
        }
    }

    var _title: String = "Button" {
        didSet {
            setTitle(_title, for: .normal)
        }
    }

    var _titleColor: UIColor = UIColor.white {
        didSet {
            setTitleColor(_titleColor, for: .normal)
        }
    }

    var _tintColor: UIColor = UIColor.black {
        didSet {
            tintColor = _tintColor
        }
    }

    var _unselectedTintColor: UIColor? {
        didSet {
            if isSelected == true { return }
            guard let unselectedTintColor = _unselectedTintColor else {
                return
            }
            tintColor = unselectedTintColor
        }
    }

    var _borderColor: UIColor = UIColor.MainColors.mainColor {
        didSet {
            layer.borderColor = _borderColor.cgColor
        }
    }

    var _cornerRadius: CGFloat = 3 {
        didSet {
            layer.cornerRadius = _cornerRadius
        }
    }

    var _borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = _borderWidth
        }
    }

    var _color: UIColor = UIColor.MainColors.mainColor {
        didSet {
            backgroundColor = _color
        }
    }

    var _unselectedColor: UIColor? {
        didSet {
            if isSelected == true { return }
            guard let _unselectedColor = _unselectedColor else {
                return
            }
            backgroundColor = _unselectedColor
        }
    }

    var _image: UIImage = UIImage() {
        didSet {
            let tintedImage = _image.withRenderingMode(.alwaysTemplate)
            setImage(tintedImage, for: .normal)
        }
    }

    var imagePadding: CGFloat = 0 {
        didSet {
            imageEdgeInsets = UIEdgeInsets(top: imagePadding, left: imagePadding, bottom: imagePadding, right: imagePadding)
        }
    }

    init(_ backgroundImage: UIImage,
         title: String = "") {
        super.init(frame: CGRect.zero)
        self.setBackgroundImage(backgroundImage, for: .normal)
        self._title = title
        setTitle(title, for: .normal)
        self.activeColor = backgroundColor
        self.initialize()
    }

    init(_ title: String) {
        super.init(frame: CGRect.zero)
        self._title = title
        setTitle(title, for: .normal)
        self.initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.initialize()
        self.activeColor = UIColor.black
    }

    func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        layer.cornerRadius = 3
        titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        backgroundColor = _color
        addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)

        if #available(iOS 9.0, *) {
            heightLayoutConstraint = heightAnchor.constraint(equalToConstant: _height)
            heightLayoutConstraint?.isActive = true
            widthLayoutConstraint = widthAnchor.constraint(equalToConstant: _width)
            widthLayoutConstraint?.isActive = true
            display()
        }
    }

    func display(_ display: Bool = true) {
        alpha = display ? 1 : 0
        heightLayoutConstraint?.constant = display ? _height : 0
    }

    func activate(_ active: Bool = true) {
        self.backgroundColor = active ? self.activeColor : UIColor.lightGray
        self.isEnabled = active
    }

    @objc func buttonClicked() {
        guard let delegate = delegate else {
            return
        }
        isSelected = !isSelected
        if let _unselectedTintColor = _unselectedTintColor {
            tintColor = isSelected ? tintColor : _unselectedTintColor
        }
        if let _unselectedColor = _unselectedColor {
            backgroundColor = isSelected ? _color : _unselectedColor
        }
        delegate.button(self, buttonClicked: tag)
    }

    func setState(_ title: String, active: Bool = false) {
        setTitle(title, for: .normal)
        setTitleColor(active ? UIColor.MainColors.lightColor : UIColor.white, for: .normal)
        backgroundColor = active ? UIColor.white : UIColor.MainColors.green
        layer.borderColor = active ? UIColor.MainColors.lightColor.cgColor : UIColor.MainColors.green.cgColor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
