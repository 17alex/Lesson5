import UIKit

func summ(lhs: String, rhs: String) -> String {
    var lArr: [Character] = Array(lhs)
    var rArr: [Character] = Array(rhs)
    var total = ""
    let count = max(lhs.count, rhs.count)
    var overflow = 0
    for _ in 0..<count {
        let lValue = Int(String(!lArr.isEmpty ? lArr.removeLast() : "0")) ?? 0
        let rValue = Int(String(!rArr.isEmpty ? rArr.removeLast() : "0")) ?? 0
        let sum = lValue + rValue + overflow
        overflow = sum / 10
        total.append(String(sum % 10))
    }
    if overflow != 0 { total.append(String(overflow)) }
    let totalStr = String(total.reversed())
    return totalStr
}
     
               
summ(lhs: "1203", rhs: "4") // "1207"
summ(lhs: "123456789", rhs: "987656789") // "1111113578"
summ(lhs: "666666666666666666666666666666666666666666666666666666666666",
     rhs: "555555555555555555555555555555555555555555555555555555555555")
      // "1222222222222222222222222222222222222222222222222222222222221"
