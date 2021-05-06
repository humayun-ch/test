//
//  Utility.swift
//  Movie_List_Humayun
//
//  Created by Humayun Kabir on 6/5/21.
//

import UIKit

class Utility {

    public static func convertHeightMultiplier(constant : CGFloat) -> CGFloat{

        let value = constant/896

        return value*view_height

    }

    

    public static func convertWidthMultiplier(constant : CGFloat) -> CGFloat{

        let value = constant/414

        return value*view_width

    }

}
