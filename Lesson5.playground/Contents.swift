import UIKit

//MARK: Direct dispatch
// быстрый, нет полиморфизма, нет наследования


// 1:
struct MyStruct {
    func myMetod() {
        print("Direct dispatch")
    }
}

MyStruct().myMetod()


// 2:
protocol MyProtocol {
    func myMetod()
}

extension MyProtocol {
    func myMetod() {
        print("Direct dispatch")
    }
}

class MyClass: MyProtocol { }

MyClass().myMetod()


// 3:
class MyClass2 { }

extension MyClass2 {
    func myMetod() {
        print("Direct dispatch")
    }
}

MyClass2().myMetod()


// 4:
final class MyFinalClass {
    func myMetod() {
        print("Direct dispatch")
    }
}

MyFinalClass().myMetod()


//---------
//MARK: Witness table
// медленне direct, есть полиморфизм, нет наследования

protocol MyProtocol1 {
    func myMetod()
}

class MyClass1: MyProtocol1 {
    func myMetod() {
        print("Witness table")
    }
}

MyClass1().myMetod()


//---------
//MARK: Virtual table
// скорость как у Witness Table, есть полиморфизм, есть наследования

class MyClass3 {
    func myMetod() { }
}

class MyClass4: MyClass3 {
    override func myMetod() {
        print("Virtual table")
    }
}

MyClass4().myMetod()


//---------
//MARK: Message dispatch
// самый медленный

@objcMembers
class MyClass5: NSObject {
    dynamic func myMetod() {
        print("Message dispatch")
    }
}

@objcMembers
class MyClass6: MyClass5 {
    override dynamic func myMetod() {
        print("Message dispatch")
    }
}

