////func digitalRoot(number: Int) -> Int {
////    let a = String(number)
////    var total = 0
////    for chara in a {
////        if let aa = Int(String(chara)) {
////            total += aa
////        }
////    }
////    return total > 10 ? digitalRoot(number: total) : total
////}
////
////digitalRoot(number: 456)
////
////func thirt(_ n: Int) -> Int {
////
////    func addNumber(number: Int) -> Int {
////        let ruleArr = [1, 10, 9, 12, 3, 4]
////        var ruleArrIndex = 0
////        var result = 0
////        let stringNumber = String(String(number).reversed())
////        for chara in stringNumber {
////            if ruleArrIndex == ruleArr.count {
////                ruleArrIndex = 0
////            }
////            result += Int(String(chara))! * ruleArr[ruleArrIndex]
////            ruleArrIndex += 1
////        }
////        return result
////    }
////
////    let tempResult = addNumber(number: n)
////    let finalResult = addNumber(number: tempResult)
////    return finalResult == tempResult ? finalResult : thirt(finalResult)
////}
////
////thirt(1234567)
//
////func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
////    // Timeout！！！！！
////    var indexs: [Int] = []
////    for num in nums {
////        let firstIndex = nums.firstIndex(of: num)!
////        let anotherNum = target - num
////        let anotherIndex = nums.firstIndex(of: anotherNum)
////        if anotherIndex != nil && anotherIndex! != firstIndex {
////            indexs = [firstIndex, anotherIndex!]
////            break
////        }
////    }
////    return indexs
////}
//
////func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
////    var indexs = [Int]()
////    var numOfIndex = [Int : Int]()
////    for (lastIndex, num) in nums.enumerated() {
////        if let firstIndex = numOfIndex[target - num] {
////            indexs = [firstIndex, lastIndex]
////            break
////        }
////        numOfIndex[num] = lastIndex //不能应用同一个元素，所以放后面赋值
////    }
////    return indexs //不匹配则返回空数组
////}
////
////twoSum([3, 2, 4], 6)
//
//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}
//
////func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
////    var l1Number: Int
////    var l2Number: Int
////
////    func convertListToInt(_ list: ListNode) -> Int {
////        var result = 0
////        var listValArr = [Int]()
////        repeat {
////            listValArr.append(list.val)
////        } while list.next != nil
////
////        let numberOfVal = listValArr.count
////        for index in 0..<numberOfVal {
////            result += listValArr[index] * Int(pow(Double(10), Double(numberOfVal - index - 1)))
////        }
////        return result
////    }
////
////    func convertResultToList() -> ListNode {
////        let mixNum = convertListToInt(l1!) + convertListToInt(l2!)
////        var numStrArr = [String]()
////        for chara in String(mixNum) {
////            numStrArr.append(String(chara))
////        }
////        var headNode = ListNode(Int(numStrArr.first!)!)
////        for index in 1..<numStrArr.count {
////            let tmpNode = ListNode(Int(numStrArr[index])!)
////            headNode.next = tmpNode
////            headNode = tmpNode
////        }
////        return headNode
////    }
////
////    return convertResultToList()
////}
//
//func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//    // Overflow!!!
//
//    func convertListToInt(_ list: ListNode) -> CLong {
//        var tmpStr: String = ""
//        var workNode: ListNode? = list
//        repeat {
//            tmpStr.append(String(workNode!.val))
//            workNode = workNode!.next
//        } while workNode != nil
//        return CLong(tmpStr)!
//    }
//
//    func converIntToList(_ intVal: CLong) -> ListNode {
//        var strVal = String(String(intVal).reversed())
//        let headNode = ListNode(Int(String(strVal.first!))!)
//        strVal.removeFirst()
//        if strVal.count > 0 {
//            var workNode = headNode
//            for chara in strVal {
//                let tmpNode = ListNode(Int(String(chara))!)
//                workNode.next = tmpNode
//                workNode = tmpNode
//            }
//        }
//        return headNode
//    }
//
//    return converIntToList(convertListToInt(l1!) + convertListToInt(l2!))
//}
//
//let a = ListNode(1)
//var workNode = a
//for _ in 0..<32 {
//    let tmpNode = ListNode(0)
//    workNode.next = tmpNode
//    workNode = tmpNode
//}
//
////let b = ListNode(2)
////let t1 = ListNode(3)
//let c = ListNode(3)
//let d = ListNode(5)
//let p = ListNode(7)
//
////a.next = b
////b.next = t1
//c.next = d
//
//let e = addTwoNumbers(a, c)
//
