//
//  LinkedListCommon.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/25.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

// List node
public class ListNodeInSwift {
    public var val: Int
    public var next: ListNodeInSwift?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// Print linked list
public func printLinkedList(_ head: ListNodeInSwift?) {
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
