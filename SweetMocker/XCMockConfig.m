//
//  XCMockConfig.m
//  LOLGame
//
//  Created by 云轩 on 13-10-21.
//
//

#import "XCMockConfig.h"
#import "XCMockData.h"
#import "XCOneMock.h"

@implementation XCMockConfig

+ (XCMockConfig *)configFromFile:(NSString *)fileName
{
    
    NSString *filePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:fileName];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (!data) {
        NSLog(@"get config data from file error");
        return nil;
    }
    
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];

    XCMockConfig *config = [self parseFromDictionary:dict];
    return config;
}

+ (XCMockConfig *)parseFromDictionary:(NSDictionary *)data
{
    if (!data) {
        NSLog(@"parse mock config error, dict is nil");
        return nil;
    }
    
    XCMockConfig *config = [[XCMockConfig alloc] init];
    config.isEnabled = [data[@"enabled"] boolValue];
    
    NSArray *rawMocksArray = data[@"mocks"];
    NSMutableDictionary *mocks = [NSMutableDictionary dictionary];
    config.mocksArrayForEdit = [NSMutableArray array];
    
    for (NSDictionary *rawMock in rawMocksArray) {
        XCMockData *aMock = [XCMockData parseFromDictionary:rawMock];
        [mocks setObject:aMock forKey:aMock.url];
        
        [config.mocksArrayForEdit addObject:aMock];
    }
    config.mocks = mocks;
    
    return config;
}

- (XCMockData *)mockDataForUrl:(NSString *)url
{
    return self.mocks[url];
}

- (NSDictionary *)dataDictionary
{
    NSMutableArray *mocksArr = [NSMutableArray array];
    for (XCMockData *mockData in self.mocksArrayForEdit) {
        NSMutableArray *oneMocksArr = [NSMutableArray array];
        
        for (XCOneMock *oneMock in mockData.oneMocksForEdit) {
            NSDictionary *oneM = @{
                                   oneMock.key : oneMock.value
                                   };
            [oneMocksArr addObject:oneM];
        }
        
        NSDictionary *mockDict = @{
                                   @"url": mockData.url,
                                   @"enabled" : @(mockData.isEnabled),
                                   @"valueKey" : mockData.valueKey,
                                   @"values" : oneMocksArr
                                   };
        
        [mocksArr addObject:mockDict];
    }
    
    NSDictionary *result = nil;
    if (self.memo) {
        result = @{
                                 @"enabled":@(self.isEnabled),
                                 @"mocks": mocksArr,
                                 @"memo" : self.memo,
                                 };
    }
    else
    {
        result = @{
                   @"enabled":@(self.isEnabled),
                   @"mocks": mocksArr,
                   };
    }

    
    return result;
}

@end
