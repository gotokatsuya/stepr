//
//  Stepr.swift
//  stepr
//
//  Created by Onur Ersel on 25/01/16.
//  Copyright © 2016 Onur Ersel. All rights reserved.
//

import UIKit

public class Stepr : UIView {
    
    public enum ButtonAlignment {
        case Horizontal, Vertical
    }
    
    
    private var number : SteprNumber?
    private var buttonAdd : UIButton?
    private var buttonRemove : UIButton?
    private var buttonAlignment : ButtonAlignment = .Vertical
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepare()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        prepare()
    }
    
    
    
    convenience init (alignment : ButtonAlignment) {
        self.init(frame: CGRect.zero)
        buttonAlignment = alignment
    }
    
    private func prepare () {
        
        //number
        number = SteprNumber()
        self.addSubview(number!)
        
        //button add
        buttonAdd = UIButton()
        self.addSubview(buttonAdd!)
        buttonAdd?.setImage(UIImage(named: "arrow-up"), forState: .Normal)
        buttonAdd?.sizeToFit()
        buttonAdd?.addTarget(self, action: "addHandler", forControlEvents: .TouchUpInside)
        
        //button remove
        buttonRemove = UIButton()
        self.addSubview(buttonRemove!)
        buttonRemove?.setImage(UIImage(named: "arrow-down"), forState: .Normal)
        buttonRemove?.sizeToFit()
        buttonRemove?.addTarget(self, action: "removeHandler", forControlEvents: .TouchUpInside)
    }
    
    
    
    override public func layoutSubviews() {
        number?.frame.size.width = self.frame.size.width
        number?.frame.size.height = self.frame.size.height
        
        switch buttonAlignment {
        case .Vertical:
            buttonAdd?.frame.origin.x = self.frame.size.width/2.0 - buttonAdd!.frame.size.width/2.0
            buttonAdd?.frame.origin.y = 0
            buttonRemove?.frame.origin.x = self.frame.size.width/2.0 - buttonRemove!.frame.size.width/2.0
            buttonRemove?.frame.origin.y = self.frame.size.height - buttonRemove!.frame.size.height
            
        case .Horizontal:
            buttonAdd?.frame.origin.x = 0
            buttonAdd?.frame.origin.y = self.frame.size.height/2.0 - buttonAdd!.frame.size.height/2.0
            buttonRemove?.frame.origin.x = self.frame.size.width - buttonRemove!.frame.size.width
            buttonRemove?.frame.origin.y = self.frame.size.height/2.0 - buttonRemove!.frame.size.height/2.0
        }
        

        
        super.layoutSubviews()
    }
    
    
    /*****************************
    */
    //MARK: handlers
    /*
    *****************************/
    
    @objc func addHandler () {
        number?.addNumber()
    }
    
    @objc func removeHandler () {
        number?.removeNumber()
    }
    
    
    
}
