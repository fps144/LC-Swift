//
//  0021_MergeTwoSortedLists.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/27.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */

class MergeTwoSortedListsSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 新建一个链表，遍历两个原链表，比较两个当前值的大小，用小值生成一个新节点并接在新链表后，同时当前链表进一，直到两个链表都到末尾为止。
    // 执行用时 : 20 ms, 在Merge Two Sorted Lists的Swift提交中击败了96.65% 的用户
    // 内存消耗 : 20.4 MB, 在Merge Two Sorted Lists的Swift提交中击败了5.22% 的用户
    private func mergeTwoLists(_ l1: ListNodeInSwift?, _ l2: ListNodeInSwift?) -> ListNodeInSwift? {
        guard l1 != nil && l2 != nil else {
            return l1 == nil ? l2 : l1
        }
        let head: ListNodeInSwift?
        var tmp1 = l1
        var tmp2 = l2
        if l1!.val >= l2!.val {
            head = ListNodeInSwift(l2!.val)
            tmp2 = tmp2?.next
        } else {
            head = ListNodeInSwift(l1!.val)
            tmp1 = tmp1?.next
        }
        var tmpHead = head
        while true {
            if tmp1 == nil {
                tmpHead?.next = tmp2
                break
            }
            if tmp2 == nil {
                tmpHead?.next = tmp1
                break
            }
            if tmp1!.val >= tmp2!.val {
                tmpHead?.next = ListNodeInSwift(tmp2!.val)
                tmpHead = tmpHead?.next
                tmp2 = tmp2?.next
            } else {
                tmpHead?.next = ListNodeInSwift(tmp1!.val)
                tmpHead = tmpHead?.next
                tmp1 = tmp1?.next
            }
        }
        return head
    }
    
    func test() {
        let listA = ListNodeInSwift(0)
        var currentA = listA
        for i in 1...10 {
            let tmp = ListNodeInSwift(i)
            currentA.next = tmp
            currentA = tmp
        }
        let listB = ListNodeInSwift(2)
        var currentB = listB
        for i in 2...10 {
            let tmp = ListNodeInSwift(i)
            currentB.next = tmp
            currentB = tmp
        }
        printLinkedList(mergeTwoLists(listA, listB))
    }
}
