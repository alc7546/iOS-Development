import UIKit


class Person{
    var age:Float
    var name:String
    
    // designated initializer
    init(name:String,age:Float){
        self.name = name
        self.age = age
    }
    
    // convenience initializer
    convenience init(name:String){
        self.init(name: name, age: 1)
    }
    
    convenience init(){
        self.init(name: "Joe", age: 1)
    }
    
    func sayHello()->String{
        return "My name is \(name)"
    }
    
    func doubleIt(num:Float)->Float{
        return num * 2
    }
    
    // computed property
    var isOldEnoughToDrink:Bool{
        return age >= 21
    }
    
}

var p0 = Person(name: "Bob", age: 28)
print(p0.sayHello())
p0.isOldEnoughToDrink


var p1 = Person(name:"Jimmy")
var anomPerson = Person()
anomPerson.isOldEnoughToDrink
