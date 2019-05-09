import UIKit

//NEWS: Enhancing String Literals Delimiters to Support Raw Text

let val = 5.0
let sentence  = #"Hello, i am "Serhat"."#
let sentence2 = #"Swift \#(val) version."#
let sentence3 = ##"i love #swift"##
print(sentence)
print(sentence2)
print(sentence3)

//NEWS: Standart Result Type
enum gas: Error {
    case full
}
func gasLimit(count: Int) -> Result<Int, gas>{
    if count < 4 {
        return .failure(.full)
    } else {
    return .success(count)
    }
}
let result = gasLimit(count: 5)
let end = result.map({"Products \($0)"})
print(end)

//NEWS: Dynamic Callable
@dynamicCallable
struct RandomNumberGenerator {
    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, Int>) -> Double {
        let numberOfZeroes = Double(args.first?.value ?? 0)
        let maximum = pow(10, numberOfZeroes)
        return Double.random(in: 0...maximum)
    }
}
let random = RandomNumberGenerator()
let genNum = random(0)
print(genNum)

@dynamicCallable
class Customer {
    func getCustomerWithId(_ id:Int) -> Int {
        return id + 999
    }
    
    func dynamicallyCall(withArguments id: [Int]) -> Int {
        return getCustomerWithId(id[0])
    }
}

let customer = Customer()
let customerResult = customer(1) // 1000
print(customerResult)

//NEWS: Transforming and unwrapping dictionary values with compactMapValues()
let people = [
    "Paul": 38,
    "Sophie": 8,
    "Charlotte": 5,
    "William": nil
]
let knownAges = people.compactMapValues { $0 }
print(knownAges)

//NEWS: isMultiple
let num = 34
if num.isMultiple(of: 2) {
    print("num is even")
} else {
    print("num is odd")
}

//NEWS: String Interpolation
struct Product {
    var name:String
    var barcode:String
    var id:Int
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Product) {
        appendInterpolation("Product name -> \(value.name) & id -> \(value.id)")
    }
    
    mutating func appendInterpolation(_ number: Int, val: Int) {
        let result = String(number + val)
        appendLiteral(result)
    }
}

let productObject = Product(name: "Cap", barcode: "810573746552", id: 93023)
print("Product Details: \(productObject)")

let x = 60
print("\(x, val: 2)") // 62

//NEWS: @unknown default in Enums
enum animals {
    case cat
    case dog
    case lion
}

let animalsObj:animals = .cat

switch animalsObj {
case .cat: print("cat")
case .dog: print("dog")
@unknown default: print("unknown")
}

//NEWS: try? and Nested Optionals
enum UserError: Error {
    case loadFailed
}

struct User {
    
    var id: Int
    
    init?(id: Int) {
        if id < 1 { return nil }
        self.id = id
    }
    
    func getUserDetails() throws -> String {
        guard id != 1 else { throw UserError.loadFailed }
        return "User Details \(self.id)"
    }
}

let user = User(id: 10)

if let details = try? user?.getUserDetails() {
    print(details) //user details
} else {
    print("@Failed id")
}
