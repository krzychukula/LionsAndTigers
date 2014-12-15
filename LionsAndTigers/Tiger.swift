//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Krzysztof Kula on 14/12/14.
//  Copyright (c) 2014 Krzysztof Kula. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff(){
        println("Tiger: Chuff Chuff")
    }
    
    func chuffANumberOfTimes(numberOfTimes:Int){
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
    }
}