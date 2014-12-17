//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Krzysztof Kula on 17/12/14.
//  Copyright (c) 2014 Krzysztof Kula. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubLionCubsBelly(){
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar(){
        super.roar()
        println("LionCub: Growl Growl")
    }
    
    override func randomFact() -> String{
        var randomFact:String
        
        if isAlphaMale {
            randomFact = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }else{
            randomFact = "Cubs begin eating meat at about the age of six weeks."
        }
        
        return randomFact
    }
}