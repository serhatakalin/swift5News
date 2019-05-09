import UIKit

//Enhancing String Literals Delimiters to Support Raw Text
//Pure string

let val = 5.0
let sentence  = #"Hello, i am "Serhat"."#
let sentence2 = #"Swift \#(val) version."#
let sentence3 = ##"i love #swift"##
print(sentence)
print(sentence2)
print(sentence3)

//Standart Result Type
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

//Dynamic Callable
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

//Transforming and unwrapping dictionary values with compactMapValues()
let people = [
    "Paul": 38,
    "Sophie": 8,
    "Charlotte": 5,
    "William": nil
]
let knownAges = people.compactMapValues { $0 }
print(knownAges)

//isMultiple
let num = 34
if num.isMultiple(of: 2) {
    print("num is even")
} else {
    print("num is odd")
}

