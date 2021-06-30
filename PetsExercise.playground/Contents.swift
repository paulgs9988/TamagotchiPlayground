import UIKit

class Pets {
    var name:String = ""
    
    init() {
        self.name = "Your pet has no name!"
    }
    
    init(_ name:String) {
        self.name = name
    }
    func feed() {
        print("\(name) has been fed")
    }
    
    func clean() {
        print("\(name) has taken a bath")
    }
    
    func play(){
        print("\(name) enjoyed playing with you")
    }
    
    func sleep(){
        print("\(name) went to sleep")
    }
}

class Tamagotchi:Pets {
    
    var properties = [String:Int]()

    var ageInDays:Double
    var age:Double?{
        return ageInDays/30
    }

    override init() {
        self.ageInDays = 0
        super.init()
        self.properties["Hunger"] = 0
        self.properties["Dirt"] = 0
        self.properties["Boredom"] = 60
        self.properties["Drowsiness"] = 0
    }
    
    override convenience init(_ name:String) {
        self.init()
        self.name = name
    }
    
    override func feed() {
        if(properties["Hunger"]! == 0){
            print("\(name) is already full!")
        }
        else{
            super.feed()
            self.properties["Hunger"]! = 0
            self.properties["Dirt"]! += 20
            self.properties["Boredom"]! += 20
            self.properties["Drowsiness"]! += 10
        }
    }
    
    override func clean() {
        if(properties["Dirt"]! == 0){
            print("\(name) is already clean!")
        }
        else{
            super.clean()
            self.properties["Hunger"]! += 20
            self.properties["Dirt"]! = 0
            self.properties["Boredom"]! += 20
            self.properties["Drowsiness"]! += 10
        }
    }
    
    override func play() {
        if(properties["Boredom"]! == 0){
            print("\(name) is already done playing!")
        }
        else{
            super.play()
            self.properties["Hunger"]! += 20
            self.properties["Dirt"]! += 20
            self.properties["Boredom"]! = 0
            self.properties["Drowsiness"]! += 10
        }
    }
    
    override func sleep() {
        if(properties["Drowsiness"]! == 0){
            print("\(name) has already slept!")
        }
        else{
            super.sleep()
            self.properties["Hunger"]! += 20
            self.properties["Dirt"]! += 10
            self.properties["Boredom"]! += 20
            self.properties["Drowsiness"]! = 0
            ageInDays += 1
        }
    }
    
    func check() {
        print("\(name)'s current status is:\nHunger: \(properties["Hunger"]!)\nBoredom: \(properties["Boredom"]!)\nDirt: \(properties["Dirt"]!)\nDrowsiness: \(properties["Drowsiness"]!)")
        
        if(properties["Hunger"]! >= 60){
            print("\(name) is hungry!")
        }
        if(properties["Dirt"]! >= 60){
            print("\(name) is dirty!")
        }
        if(properties["Boredom"]! >= 60){
            print("\(name) is bored!")
        }
        if(properties["Drowsiness"]! >= 60){
            print("\(name) is sleepy!")
        }
        
    }
    
    func getAge() {
        print("\(name) is \(age!) months old")
    }
}
var game = Tamagotchi("Jimmy")
for _ in 1...52{
game.play()
game.sleep()
game.clean()
game.feed()
}

game.check()
game.getAge()
