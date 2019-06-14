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
//    NSString *str = [self longestUnRepeatingStringInString:@"abcabcbb"];
//    str = [self longestUnRepeatingStringInString:@"bbbbb"];
//    str = [self longestUnRepeatingStringInString:@"pwwkew"];
    
//    4.Jewels and Stones
//    NSInteger count = [self numberOfStones:@"aAAbbbb" inJewels:@"aA"];
//    count = [self numberOfStones:@"ZZ" inJewels:@"z"];
    
//    5.Longest Palindromic Substring
//    NSString *str = [self longestPalindromicSubstring:@[@"b",@"a",@"b",@"a",@"d"]];
//    str = [self longestPalindromicSubstring:@[@"c",@"b",@"b",@"d"]];
}

- (NSString *)longestPalindromicSubstring:(NSArray<NSString *> *)list {
    __block NSInteger count = 0;
    __block NSInteger startIndex = 0;
    
    NSMutableDictionary<NSString *, NSNumber *> *map = [NSMutableDictionary dictionaryWithCapacity:list.count];
    [list enumerateObjectsUsingBlock:^(NSString * _Nonnull str, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *val = map[str];
        if (val == nil) {
            map[str] = @(idx);
        }
        else {
            NSInteger start = val.integerValue;
            NSInteger len = idx - start + 1;
            if (len > count) {
                startIndex = start;
                count = len;
                map[str] = @(idx);
            }
        }
    }];
    
    if (count > 0) {
        NSArray<NSString *> *subList = [list subarrayWithRange:NSMakeRange(startIndex, count)];
        return [subList componentsJoinedByString:@""];
    }
    return nil;
}

- (NSInteger)numberOfStones:(NSString *)stones inJewels:(NSString *)jewels {
    NSInteger count = 0;
    char A = 'A';
    char z = 'z';
    
    //初始化值
    NSInteger length = z - A + 1;
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:length];
    for (NSUInteger i = 0; i < length; i++) {
        [numbers addObject:@0];
    }
    
    //遍历stones
    for (NSUInteger i = 0; i < stones.length; i++) {
        unichar index = [stones characterAtIndex:i] - A;
        NSInteger val = numbers[index].integerValue;
        val += 1;
        numbers[index] = @(val);
    }
    
    //遍历jewels
    for (NSUInteger i = 0; i < jewels.length; i++) {
        unichar index = [jewels characterAtIndex:i] - A;
        NSInteger val = numbers[index].integerValue;
        count += val;
    }
    
    return count;
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

- (NSString *)longestUnRepeatingStringInString:(NSString *)str {
    NSInteger i = 0;
    NSInteger j = 0;
    NSUInteger len = str.length;
    
    const char *children = str.UTF8String;
    
    NSMutableDictionary<NSString *, NSString *> *container = [NSMutableDictionary dictionaryWithCapacity:len];
    
    NSInteger start = i;
    NSInteger end = j;
    
    for (; i < len && j < len;) {
        char jCahr = children[j];
        NSString *jStr = [NSString stringWithFormat:@"%c",jCahr];
        NSString *val = container[jStr];
        if (val == nil) {
            container[jStr] = jStr;
            j++;
        }
        else {
            if ((end - start) < (j-1 - i)) {
                start = i;
                end = j - 1;
            }
            
            char iCahr = children[i];
            NSString *iStr = [NSString stringWithFormat:@"%c",iCahr];
            container[iStr] = nil;
            i++;
        }
    }
    
    if ((end - start) < (j-1 - i)) {
        start = i;
        end = j - 1;
    }
    
    return [str substringWithRange:NSMakeRange(start, (end-start) + 1)];
}

@end
