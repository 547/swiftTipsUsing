//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()




//MARK: #55 Dropping suffixes from method names to support multiple arguments == 就是...
extension String{
    mutating func add(_ chars:String...) -> () {
        chars.forEach { (char) in
            self += char
        }
    }
}
extension UIView{
    func add(subViews:UIView...) -> () {
        subViews.forEach(addSubview)
    }
}
//MARK: #48 Extending optionals (optionals：可选的，任意的，就是带？的，wrapped:包装的)
extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        switch self {
        case let string?:
            return string.isEmpty
        case nil:
            return true
        }
    }
}
//MARK: #47 Using where with for-loops (for循环加上where就是相当于在for循环里面加上if判断)
extension String {
    func contains(_ char:Character) -> Bool {
        for char in self.sorted() where char == char {
            print(char)
            return true
        }
        return false
    }
}
//MARK: autoclosure
extension String {
    static func test(block:@autoclosure () -> Bool) -> () {
        if block() {
            print("it is true")
        }else {
            print("it is flase")
        }
    }
}










//MARK: = using
//MARK:use #55 Dropping suffixes from method names to support multiple arguments
var str = "test"
str.add("add", "chars")

let testString1:String? = nil
let result1 = testString1.isNilOrEmpty

//MARK:use #48 Extending optionals
let testString2:String? = ""
let result2 = testString2.isNilOrEmpty

//MARK:use #47 Using where with for-loops
let whereStr = "whereStr"
let result3 = whereStr.contains("str")

//MARK:use #21 Using DispatchWorkItem(使用DispatchWorkItem，可以简单地取消一个延迟执行的任务，如果已经不需要的话)
let workItem = DispatchWorkItem.init {
    print("这里面调用延迟执行的内容")
}
DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1, execute: workItem)
//取消执行workItem
workItem.cancel()


//MARK:use #8 Passing functions & operators as closures (数组排序（sorted） + 运算符)
let numbers = [2, 3, 9, 8, 25, 3, 15, 3]
//let sorted = numbers.sorted(by: >)
var count = 0





//MARK:use autoclosure
String.test(block: 1 >  3)

var newNumbers = [Int]()
for (index,item) in numbers.enumerated() where item == 3 {
    newNumbers.append(index)
}
print(newNumbers)

//MARK:使用 关键字defer
/* 延缓推迟,相当于把操作放入栈中，后加入的先执行
 *
 * 并不是函数结束时开始执行defer栈推出操作，而是每当一个作用域结束就进行该作用域defer执行
 *
 * 同一作用域中执行栈中的defer操作，按后进先出的执行顺序
 */
func deferTest(name:String) {
    
    //作用域1整个函数是作用域
    print("1-1")
    if name == "" {
        //作用域2 if作用域
        print("2-1")
        defer {print("2-2")}
        print("2-3")
    }
    print("1-2")
    defer {print("1-3")}
    print("1-4")
    if name == "hello" {
        //作用域3
        print("3-1")
        defer {print("3-2")}
        print("3-3")
        defer {print("3-4")}
    }
    print("1-5")
    defer {print("1-6")}
    
}
deferTest(name: "")

















