//
//  Extensions.swift
//  Movie_List_Humayun
//
//  Created by Humayun Kabir on 6/5/21.
//

import UIKit
import AVFoundation

extension UIView {

    func anchor (top : NSLayoutYAxisAnchor? , left: NSLayoutXAxisAnchor? , bottom : NSLayoutYAxisAnchor? , right : NSLayoutXAxisAnchor? , paddingTop : CGFloat , paddingLeft : CGFloat , paddingBottom : CGFloat , paddingRight : CGFloat , width : CGFloat , height : CGFloat){

            

            translatesAutoresizingMaskIntoConstraints = false

            

            if let top = top {

                self.topAnchor.constraint(equalTo: top , constant: paddingTop).isActive = true

            }

            if let left = left {

                self.leftAnchor.constraint(equalTo: left , constant: paddingLeft).isActive = true

            }

            if let bottom = bottom {

                self.bottomAnchor.constraint(equalTo: bottom , constant: -paddingBottom).isActive = true

            }

            if let right = right {

                self.rightAnchor.constraint(equalTo: right , constant: -paddingRight).isActive = true

            }

            if  width != 0 {

                widthAnchor.constraint(equalToConstant: width).isActive = true

            }

            if height != 0 {

                heightAnchor.constraint(equalToConstant: height).isActive = true

            }

        }

    

    func centerAnchor(centerX : NSLayoutXAxisAnchor? = nil , centerY : NSLayoutYAxisAnchor? = nil, xConstant : CGFloat = 0, yConstant : CGFloat = 0){

        translatesAutoresizingMaskIntoConstraints = false

        

        if let centerX = centerX{

            self.centerXAnchor.constraint(equalTo: centerX, constant: xConstant).isActive = true

        }

        

        if let centerY = centerY{

            self.centerYAnchor.constraint(equalTo: centerY, constant: yConstant).isActive = true

        }

    }

}
