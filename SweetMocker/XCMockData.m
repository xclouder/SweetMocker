//
//  XCMockData.m
//  LOLGame
//
//  Created by 云轩 on 13-10-21.
//
//

#import "XCMockData.h"
#import "XCOneMock.h"

@implementation XCMockData

+ (XCMockData *)parseFromDictionary:(NSDictionary *)dict
{
    if (!dict) {
        NSLog(@"parse mock data error, dict is nil");
        return nil;
    }
    
    XCMockData *data = [[XCMockData alloc] init];
    data.isEnabled = [dict[@"enabled"] boolValue];
    data.valueKey = [dict[@"valueKey"] description];
    data.candidateValues = [self mocksWithArray:dict[@"values"]];

    data.oneMocksForEdit = [NSMutableArray array];
    [data.candidateValues enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [data.oneMocksForEdit addObject:obj];
    }];
    
    data.url = dict[@"url"];
    
    return data;
}

+ (NSDictionary *)mocksWithArray:(NSArray *)arr
{
    
    NSMutableDictionary *mocksDict = [NSMutableDictionary dictionary];
    for (NSDictionary *dict in arr) {
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            XCOneMock *oneMock = [[XCOneMock alloc] init];
            oneMock.key = [key description];
            oneMock.value = [obj description];
            
            mocksDict[oneMock.key] = oneMock;
            
            *stop = YES;
        }];

    }
    return mocksDict;
}

//- (XCOneMock *)oneMockWithDict:(NSDictionary *)dict
//{
//    XCOneMock *oneMock = [[XCOneMock alloc] init];
//    oneMock.key = dict[@"key"];
//    oneMock.value = dict[@"value"];
//    
//    return oneMock;
//}

- (NSString *)mockValue
{
    XCOneMock *oneMock = [self.candidateValues objectForKey:self.valueKey];
    return oneMock.value;
}



@end
