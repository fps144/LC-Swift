//
//  0002 - AddTwoNumbers.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/16.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

/// 链表节点
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class AddTwoNumbersSolution {
    // Overflow when calculating int value!!!
    // Time Complexity: O(n) Space Complexity: O(n)
    // Thought: 遍历给定链表 -> 取出其中 val 值 -> 组成 Int 值 -> 相加得 mixNum -> 将 mixNum 转为 String -> 反转 mixNum -> 取出每一位 -> 存入新链表 -> 返回链表头
    // Reason: 32位平台 (Int = Int32 -2^31 -- 2^31-1 ) 64位平台 (Int = Int64 -2^63 -- 2^63-1) 如果给定链表的节点数 ≥Int 最大范围中2的最大次方值，则相加运算很可能会溢出。
    // Proposals：不进行数值转化和运算，直接进行链表操作，利用十进制的特性，只针对链表当前操作节点的值进行计算，并把结果存入目标链表。
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        func convertListToInt(_ list: ListNode) -> Int {
            var tmpStr: String = ""
            var workNode: ListNode? = list
            repeat {
                tmpStr.append(String(workNode!.val))
                workNode = workNode!.next
            } while workNode != nil
            return Int(tmpStr)!
        }
        
        func converIntToList(_ intVal: Int) -> ListNode {
            var strVal = String(String(intVal).reversed())
            let headNode = ListNode(Int(String(strVal.first!))!)
            strVal.removeFirst()
            if strVal.count > 0 {
                var workNode = headNode
                for chara in strVal {
                    let tmpNode = ListNode(Int(String(chara))!)
                    workNode.next = tmpNode
                    workNode = tmpNode
                }
            }
            return headNode
        }
        
        return converIntToList(convertListToInt(l1!) + convertListToInt(l2!))
    }
}
