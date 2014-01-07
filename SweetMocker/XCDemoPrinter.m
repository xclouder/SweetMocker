//
//  XCDemoPrinter.m
//  SweetMocker
//
//  Created by 云轩 on 14-1-7.
//  Copyright (c) 2014年 xClouder. All rights reserved.
//

#import "XCDemoPrinter.h"
#import "XCStringDemoPrinter.h"
#import "XCNumberDemoPrinter.h"
#import "XCArrayDemoPrinter.h"
#import "XCDictionaryDemoPrinter.h"

@implementation XCDemoPrinter

+ (NSString *)stringFromData:(id)data
{
    if ([data isKindOfClass:[NSString class]]) {
        return [XCStringDemoPrinter stringFromData:data];
    }
    if ([data isKindOfClass:[NSNumber class]]) {
        return [XCNumberDemoPrinter stringFromData:data];
    }
    if ([data isKindOfClass:[NSArray class]]) {
        return [XCArrayDemoPrinter stringFromData:data];
    }
    if ([data isKindOfClass:[NSDictionary class]]) {
        return [XCDictionaryDemoPrinter stringFromData:data];
    }
    
    return nil;
}

@end
