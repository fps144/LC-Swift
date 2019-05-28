//
//  0083_RemoveDuplicatesFromSortedList.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/28.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 
 示例 1:
 
 输入: 1->1->2
 输出: 1->2
 
 示例 2:
 
 输入: 1->1->2->3->3
 输出: 1->2->3
 */

class RemoveDuplicatesFromSortedListSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 遍历链表，若当前节点的值和下个节点的值相等，则将当前节点的下一个节点指向其下下一个，再判是否相等；否则移动至下个节点。直到表尾。
    // 执行用时 : 40 ms, 在Remove Duplicates from Sorted List的Swift提交中击败了96.59% 的用户
    // 内存消耗 : 20.5 MB, 在Remove Duplicates from Sorted List的Swift提交中击败了6.25% 的用户
    private func deleteDuplicates(_ head: ListNodeInSwift?) -> ListNodeInSwift? {
        guard head != nil else {
            return nil
        }
        var tmp = head
        while tmp?.next != nil {
            if tmp!.val == tmp!.next!.val {
                tmp?.next = tmp?.next?.next
            } else {
                tmp = tmp?.next
            }
        }
        return head
    }
    
    func test() {
        var head: ListNodeInSwift? = ListNodeInSwift(0)
        var tmp = head
        for i in 0...10 {
            for _ in 0...2 {
                tmp?.next = ListNodeInSwift(i)
                tmp = tmp?.next
            }
        }
        head = deleteDuplicates(head)
        printLinkedList(head)
    }
}
