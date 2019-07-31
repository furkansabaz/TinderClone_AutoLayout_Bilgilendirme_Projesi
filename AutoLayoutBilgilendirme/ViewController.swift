//
//  ViewController.swift
//  AutoLayoutBilgilendirme
//
//  Created by Furkan Sabaz on 31.07.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let maviView = UIView()
        maviView.backgroundColor = .blue
        
        let sariView = UIView()
        sariView.backgroundColor = .yellow
        
        let griView = UIView()
        griView.backgroundColor = .darkGray
        
        [maviView,sariView , griView].forEach {  view.addSubview($0) }
        
        
        
        maviView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                        bottom: nil,
                        leading: nil,
                        trailing: view.safeAreaLayoutGuide.trailingAnchor,
                        padding: .init(top: 0, left: 10, bottom: 0, right: 10),
                        size: .init(width: 160, height: 0))
        maviView.heightAnchor.constraint(equalTo: maviView.widthAnchor).isActive = true
        sariView.anchor(top: maviView.bottomAnchor, bottom: nil, leading: nil, trailing: maviView.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        //sariView.widthAnchor.constraint(equalTo: maviView.widthAnchor).isActive = true
        //sariView.heightAnchor.constraint(equalTo: maviView.heightAnchor).isActive = true
        sariView.anchorSize(view: maviView)
        griView.anchor(top: maviView.topAnchor, bottom: sariView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: maviView.leadingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        let kahveView = UIView()
        kahveView.backgroundColor = .brown
        view.addSubview(kahveView)
        kahveView.fillSuperView()
        
        
    }


}


extension UIView {
    
    func anchor(top : NSLayoutYAxisAnchor?, bottom : NSLayoutYAxisAnchor?, leading : NSLayoutXAxisAnchor?, trailing : NSLayoutXAxisAnchor?,padding : UIEdgeInsets = .zero, size : CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
           topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom,constant: -padding.bottom).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading,constant: padding.left).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing,constant: -padding.right).isActive = true
        }
        
        
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        
    }
    
    func anchorSize(view : UIView) {
        
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    func fillSuperView() {
        anchor(top: superview?.topAnchor, bottom: superview?.bottomAnchor, leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor)
        
    }
    
    
}

