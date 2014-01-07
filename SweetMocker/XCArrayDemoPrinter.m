//
//  XCArrayDemoPrinter.m
//  SweetMocker
//
//  Created by 云轩 on 14-1-7.
//  Copyright (c) 2014年 xClouder. All rights reserved.
//

#import "XCArrayDemoPrinter.h"

@implementation XCArrayDemoPrinter

+ (NSString *)stringFromData:(id)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        NSArray *arr = (NSArray *)data;
        
        NSMutableString *string = [NSMutableString stringWithString:@"@[\n"];
        
        for (id d in arr) {
            NSString *subDataStr = [super stringFromData:d];
            [string appendString:subDataStr];
            [string appendString:@",\n"];
        }
        
        [string appendString:@"]"];
        
        return string;
    }
    else
    {
        NSLog(@"data is not a string");
        return nil;
    }
}

@end
