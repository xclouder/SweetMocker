//
//  XCStringPrinter.m
//  SweetMocker
//
//  Created by 云轩 on 14-1-7.
//  Copyright (c) 2014年 xClouder. All rights reserved.
//

#import "XCStringDemoPrinter.h"

@implementation XCStringDemoPrinter

+ (NSString *)stringFromData:(id)data
{
    if ([data isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"@\"%@\"", data];
    }
    else
    {
        NSLog(@"data is not a string");
        return nil;
    }
}

@end
