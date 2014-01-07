//
//  XCNumberDemoPrinter.m
//  SweetMocker
//
//  Created by 云轩 on 14-1-7.
//  Copyright (c) 2014年 xClouder. All rights reserved.
//

#import "XCNumberDemoPrinter.h"

@implementation XCNumberDemoPrinter

+ (NSString *)stringFromData:(id)data
{
    if ([data isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"@(%d)", [data intValue]];
    }
    else
    {
        NSLog(@"data is not a string");
        return nil;
    }
}

@end
