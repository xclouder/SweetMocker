//
//  XCMockData.h
//  LOLGame
//
//  Created by 云轩 on 13-10-21.
//
//

#import <Foundation/Foundation.h>

@interface XCMockData : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) BOOL isEnabled;
@property (nonatomic, strong) NSString *valueKey;

@property (nonatomic, strong) NSDictionary *candidateValues;

@property (nonatomic, strong) NSMutableArray *oneMocksForEdit;

+ (XCMockData *)parseFromDictionary:(NSDictionary *)dict;

- (NSString *)mockValue;

@end
