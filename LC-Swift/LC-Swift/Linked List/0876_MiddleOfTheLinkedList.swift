//
//  0876_MiddleOfTheLinkedList.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/25.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个带有头结点 head 的非空单链表，返回链表的中间结点。
 
 如果有两个中间结点，则返回第二个中间结点。
 
 
 示例 1：
 
 输入：[1,2,3,4,5]
 输出：此列表中的结点 3 (序列化形式：[3,4,5])
 返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
 注意，我们返回了一个 ListNode 类型的对象 ans，这样：
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.
 
 示例 2：
 
 输入：[1,2,3,4,5,6]
 输出：此列表中的结点 4 (序列化形式：[4,5,6])
 由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。
 
 
 提示：
 
 给定链表的结点数介于 1 和 100 之间。
 */


class MiddleOfTheLinkedListSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 从表头开始遍历，两个锚点，oneMulNode 一次进一个，twoMulNode 一次进两个。
    //            当 twoMulNode.next == nil 时，说明是奇数个，当 twoMulNode.next?.next == nil 时，说明是偶数，此时需要取 oneMulNode.next，返回即可。
    // 执行用时 : 8 ms, 在Middle of the Linked List的Swift提交中击败了95.92% 的用户
    // 内存消耗 : 20.3 MB, 在Middle of the Linked List的Swift提交中击败了5.00% 的用户
    private func middleNode(_ head: ListNodeInSwift?) -> ListNodeInSwift? {
        guard head != nil else {
            return head
        }
        var oneMulNode = head
        var twoMulNode = head
        while twoMulNode != nil {
            if twoMulNode?.next == nil {
                break
            } else if twoMulNode?.next?.next == nil {
                oneMulNode = oneMulNode?.next
                break
            }
            oneMulNode = oneMulNode?.next
            twoMulNode = twoMulNode?.next?.next
        }
        return oneMulNode
    }
    
    func test() {
        var head = ListNodeInSwift(0)
        var current = head
        for i in 1...10 {
            let tmp = ListNodeInSwift(i)
            current.next = tmp
            current = tmp
        }
        head = middleNode(head)!
        printLinkedList(head)
    }
}
