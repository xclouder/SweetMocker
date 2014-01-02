//
//  XCMocker.m
//  LOLGame
//
//  Created by 云轩 on 13-10-21.
//
//

#import "XCMocker.h"
#import "XCMockConfig.h"
#import "XCMockData.h"

@interface XCMocker ()

@property (nonatomic, strong) XCMockConfig *mockConfig;

@end

@implementation XCMocker

- (id)init
{
    self = [super init];
    if (self) {
        self.mockConfig = [XCMockConfig configFromFile:@"XCMockConfig.json"];
    }
    return self;
}

+ (id)sharedInstance
{
    static XCMocker *mocker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mocker = [[XCMocker alloc] init];
    });
    
    return mocker;
}

- (BOOL)canMockForUrl:(NSString *)url
{
    BOOL isGlobalEnabled = self.mockConfig.isEnabled;
    if (!isGlobalEnabled) {
        return NO;
    }
    
    XCMockData *mock = [self.mockConfig mockDataForUrl:url];
    if (!mock || !mock.isEnabled) {
        return NO;
    }
    return YES;
}

- (NSString *)mockedDataForUrl:(NSString *)url
{
    XCMockData *mock = [self.mockConfig mockDataForUrl:url];
    return [mock mockValue];
}

@end
