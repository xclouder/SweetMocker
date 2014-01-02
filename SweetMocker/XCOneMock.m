//
//  XCOneMock.m
//  LOLGame
//
//  Created by 云轩 on 13-12-12.
//
//

#import "XCOneMock.h"

@implementation XCOneMock

- (void)setValue:(NSString *)value
{
    NSLog(@"set key:%@, to val:%@; obj:%@", _key, value, self);
    _value = value;
}

@end
