//
//  ViewController.m
//  leetCode
//
//  Created by dingyl on 2019/4/7.
//  Copyright © 2019年 mountainhill. All rights reserved.
//

#import "ViewController.h"

/*!  2. Add Two Numbers */
#import "ListNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    1. Two Sum
//    NSArray *nums = @[@2, @7, @11, @15];
//    NSInteger target = 18;
//    NSArray *indies = [self twoSum:nums target:target];
//    NSLog(@"indies:%@",indies);
    
//    2. Add Two Numbers
//    ListNode *node0 = [[ListNode alloc] initWithVal:2];
//    node0.next = [[ListNode alloc] initWithVal:4];
//    node0.next.next = [[ListNode alloc] initWithVal:3];
//    ListNode *node1 = [[ListNode alloc] initWithVal:5];
//    node1.next = [[ListNode alloc] initWithVal:6];
//    node1.next.next = [[ListNode alloc] initWithVal:4];
//    ListNode *result = [self addTwoNumbers:node0 node1:node1];
//    NSLog(@"addTwoNumbers:%@",result);
    
//    3. Longest Substring Without Repeating Characters
}

- (NSArray<NSNumber *> *)twoSum:(NSArray<NSNumber *> *)nums
                         target:(NSInteger)target {
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:2];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:nums.count];
    for (NSInteger i = 0; i < nums.count; i++) {
        NSNumber *temp = nums[i];
        NSInteger minus = target - temp.integerValue;
        NSNumber *index = dict[@(minus)];
        if (index != nil) {
            [results addObject:index];
            [results addObject:@(i)];
            break;
        }
        dict[nums[i]] = @(i);
    }
    return results;
}

- (ListNode *)addTwoNumbers:(ListNode *)node0
                      node1:(ListNode *)node1 {
    ListNode *result = nil;
    ListNode *temp = nil;
    
    NSInteger add = 0;
    while (node0 != nil ||
           node1 != nil) {
        NSInteger total = node0.val + node1.val + add;
        ListNode *next = [[ListNode alloc] initWithVal:total % 10];
        add = total / 10;
        
        if (result == nil) {
            result = next;
        }
        if (temp == nil) {
            temp = result;
        }
        else {
            temp.next = next;
            temp = next;
        }
        
        node0 = node0.next;
        node1 = node1.next;
    }
    if (add > 0) {
        temp.next = [[ListNode alloc] initWithVal:add];
    }
    return result;
}

@end
