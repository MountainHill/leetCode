//
//  ListNode.h
//  leetCode
//
//  Created by dingyl on 2019/4/7.
//  Copyright © 2019年 mountainhill. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject

@property (nonatomic) NSInteger val;

@property (nonatomic, strong) ListNode *next;

- (instancetype)initWithVal:(NSInteger)val;

@end

NS_ASSUME_NONNULL_END
