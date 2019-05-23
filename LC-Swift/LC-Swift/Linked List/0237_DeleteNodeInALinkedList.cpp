//
//  0237_DeleteNodeInALinkedList.cpp
//  LC-Swift
//
//  Created by 南门 on 2019/5/23.
//  Copyright © 2019 Songyu. All rights reserved.
//

#include "0237_DeleteNodeInALinkedList.hpp"
#include <iostream>
using namespace std;

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

// Time Complexity: O(1) | Space Complexity: O(1)
// Thought: 这个题重在理解。题目意思是你删除的就是当前这个链表的一部分，所以即使没有 head，也可以完成删除操作，即将下个节点的 val 和 value 复制到当前这个节点来，形成替换即可。
// 执行用时 : 20 ms, 在Delete Node in a Linked List的C++提交中击败了96.24% 的用户
// 内存消耗 : 9.1 MB, 在Delete Node in a Linked List的C++提交中击败了68.94% 的用户
void deleteNode(ListNode* node) {
    node->val = node->next->val;
    node->next = node->next->next;
}

void printLinkedList(ListNode *head) {
    if (head == NULL) {
        cout<<"Linked list is empty!\n";
    }
    ListNode *tmp;
    tmp = head;
    while (tmp) {
        cout<<tmp->val;
        if (tmp->next) {
           cout<<" -> ";
        }
        tmp = tmp->next;
    }
    cout<<endl;
}

void DeleteNodeInALinkedListSolution::testDeleteNodeInALinkedList() {
    ListNode *head = new ListNode(0), *current;
    ListNode *deletedNode = NULL;
    current = head;
    for (int i = 1; i < 6; ++i) {
        ListNode *node = new ListNode(i);
        current->next = node;
        current = node;
        if (i == 4) {
            deletedNode = node;
        }
    }
    deleteNode(deletedNode);
    printLinkedList(head);
}

