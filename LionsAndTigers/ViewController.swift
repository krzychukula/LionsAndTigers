//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Krzysztof Kula on 14/12/14.
//  Copyright (c) 2014 Krzysztof Kula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    var lions:[Lion] = []
    
    var lionCubs:[LionCub] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuffANumberOfTimes(3, isLoud: false)
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var forthTiger = Tiger()
        forthTiger.name = "Spar"
        forthTiger.breed = "Siberian Tiger"
        forthTiger.age = 5
        forthTiger.image = UIImage(named: "SiberianTiger.jpg")
        forthTiger.age = forthTiger.ageInTigerYearsFromAge(forthTiger.age)
        
        myTigers.append(myTiger)
        myTigers += [secondTiger, thirdTiger, forthTiger]
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Serabi"
        lioness.subspecies = "Barbary"
        
        lion.roar()
        lioness.roar()
        
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        self.lions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvall"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        
        updateAnimal()
        updateView()
        
    }
    
    func updateAnimal(){
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
        
    }
    
    func updateView(){
        
        UIView.transitionWithView(self.view,
            duration: 1,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                
                if self.currentAnimal.species == "Tiger" {
                    let tiger = self.myTigers[self.currentAnimal.index]
                    self.nameLabel.text = tiger.name
                    self.myImageView.image = tiger.image
                    self.breedLabel.text = tiger.breed
                    self.ageLabel.text = "\(tiger.age)"
                    self.randomFactLabel.text = tiger.randomFact()
                    
                }else if self.currentAnimal.species == "Lion" {
                    let lion = self.lions[self.currentAnimal.index]
                    self.nameLabel.text = lion.name
                    self.myImageView.image = lion.image
                    self.breedLabel.text = lion.subspecies
                    self.ageLabel.text = "\(lion.age)"
                    self.randomFactLabel.text = lion.randomFact()
                }else if self.currentAnimal.species == "LionCub" {
                    let cub = self.lionCubs[self.currentAnimal.index]
                    self.nameLabel.text = cub.name
                    self.myImageView.image = cub.image
                    self.breedLabel.text = cub.subspecies
                    self.ageLabel.text = "\(cub.age)"
                    self.randomFactLabel.text = cub.randomFact()
                }
                
                self.randomFactLabel.hidden = false
                
            }, {
                (finished: Bool) -> () in
        })

    }

}

