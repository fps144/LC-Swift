//
//  0206_ReverseLinkedList.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/24.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 反转一个单链表。
 
 示例:
 
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */

public class ListNode1 {
    public var val: Int
    public var next: ListNode1?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class ReverseLinkedListSolution {
    
//    // Time Complexity: O(n) | Space Complexity: O(1)
//    // Thought: 遍历法，记录工作节点的前后节点，翻转即可。
//    // 执行用时 : 24 ms, 在Reverse Linked List的Swift提交中击败了97.56% 的用户
//    // 内存消耗 : 21.4 MB, 在Reverse Linked List的Swift提交中击败了5.69% 的用户
//    private func reverseList(_ head: ListNode1?) -> ListNode1? {
//        guard head != nil && head?.next != nil else {
//            return head
//        }
//        var workNode = head?.next!
//        head?.next = nil
//        var beforeNode = head
//        while workNode != nil {
//            let tmp = workNode?.next ?? nil
//            workNode?.next = beforeNode
//            beforeNode = workNode
//            workNode = tmp
//        }
//        return beforeNode
//    }
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 递归
    // 执行用时 : 28 ms, 在Reverse Linked List的Swift提交中击败了97.07% 的用户
    // 内存消耗 : 22.4 MB, 在Reverse Linked List的Swift提交中击败了5.69% 的用户
    private func reverseList(_ head: ListNode1?) -> ListNode1? {
        guard head != nil && head?.next != nil else {
            return head
        }
        let nextNode = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return nextNode
    }
    
    private func printLinkedList(_ head: ListNode1?) {
        var head = head
        guard head != nil else {
            print("NULL")
            return
        }
        while head != nil {
            print("\(head!.val) -> ", terminator: "")
            head = head?.next
            if head == nil { print("NULL") }
        }
    }
    
    func test() {
        var head = ListNode1(0)
        var current = head
        for i in 1...5 {
            let tmp = ListNode1(i)
            current.next = tmp
            current = tmp
        }
        head = reverseList(head)!
        printLinkedList(head)
    }
}
