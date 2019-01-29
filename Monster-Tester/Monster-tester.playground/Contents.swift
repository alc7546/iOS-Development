import UIKit

var str = "Hello, playground"

class Monster{
    var species:String
    var hitPoints:Int{
        didSet{
            checkHitPoints()
        }
    }
    
    init(species: String, hitPoints: Int){
        self.species = species
        self.hitPoints = hitPoints
        checkHitPoints()
    }
    
    convenience init(species: String){
        self.init(species:species, hitPoints:10)
    }
    
    convenience init(){
        self.init(species: "Orc", hitPoints:10)
    }
    
    func Slay(){
        hitPoints = 0
    }
    
    var isAlive:Bool{
        return hitPoints > 0
    }
    
    func checkHitPoints(){
        if(hitPoints > 250)
        {
            hitPoints = 250
        }
        else if(hitPoints < 0)
        {
            hitPoints = 0
        }
    }
}

// Standard Initializer
var monsterTest1 = Monster(species: "Alien", hitPoints: 50)

// Convenience Initalizer with Species
var monsterTest2 = Monster(species: "Elf")

// Convenience Intializer with no params
var monsterTest3 = Monster()

// Slay the first monster
monsterTest1.Slay()

// Check if first monster is alive
monsterTest1.isAlive

// Check hitpoints property observer for second monster
monsterTest2.hitPoints = 5000 // should set to 250
print("Monster 2 Hitpoints: \(monsterTest2.hitPoints)")

// Check hitpoints on init
var monsterTestObserver = Monster(species: "Bob", hitPoints:-5)

