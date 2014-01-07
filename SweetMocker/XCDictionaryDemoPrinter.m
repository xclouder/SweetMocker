//
//  XCDictionaryDemoPrinter.m
//  SweetMocker
//
//  Created by 云轩 on 14-1-7.
//  Copyright (c) 2014年 xClouder. All rights reserved.
//

#import "XCDictionaryDemoPrinter.h"

@implementation XCDictionaryDemoPrinter

+ (NSString *)stringFromData:(id)data
{
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)data;
        
        NSMutableString *string = [NSMutableString stringWithString:@"@{\n"];
        
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSString *subDataKeyStr = [super stringFromData:key];
            NSString *subDataValStr = [super stringFromData:obj];
            
            [string appendString:subDataKeyStr];
            [string appendString:@" : "];
            [string appendString:subDataValStr];
            
            [string appendString:@",\n"];
        }];
        
        [string appendString:@"}"];
        
        return string;
    }
    else
    {
        NSLog(@"data is not a string");
        return nil;
    }
}

@end
