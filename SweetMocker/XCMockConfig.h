//
//  XCMockConfig.h
//  LOLGame
//
//  Created by 云轩 on 13-10-21.
//
//

#import <Foundation/Foundation.h>
@class XCMockData;

@interface XCMockConfig : NSObject

@property (nonatomic, assign) BOOL isEnabled;

@property (nonatomic, strong) NSDictionary *mocks;
@property (nonatomic, strong) NSMutableArray *mocksArrayForEdit;
@property (nonatomic, strong) NSString *memo;

+ (XCMockConfig *)parseFromDictionary:(NSDictionary *)data;
+ (XCMockConfig *)configFromFile:(NSString *)fileName;
- (XCMockData *)mockDataForUrl:(NSString *)url;

- (NSDictionary *)dataDictionary;
@end
