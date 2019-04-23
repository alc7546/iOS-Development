import UIKit

var str = "Hello, playground"


var fruits = ["watermelon","bananas","kiwis","apples","honeydew"]

// the .sort() function of array expects a "sorting" closure to be passed in
// closures are unnamed functions

func sortFruit(a:String, b:String)->Bool{
    return a < b
}
// 1 - long way, explicit typing, closure passed as a parameter
fruits.sort(by:  {
    (a:String, b:String)->Bool in
    return a < b
})

// 2 - long way, type inference, closure passed as a parameter
fruits.sort(by: {
    (a,b) in
    return a > b
})


// 3 - long way, "trailing closure" syntax
fruits.sort(){
    (a,b) in
    return a > b
}

// 4 - shorter way, get ride of `return` statement, "trailing closure" syntax
// Exam
fruits.sort(){
    (a,b) in
    a < b
}

// 5 - an even shorter way, by utilizing $0 and $1, "trailing closure" syntax
fruits.sort(){
    $0 < $1
}

// 6 - the shortest way
fruits.sort(by: <)
