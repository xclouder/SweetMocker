//
//  XCMocker.h
//  LOLGame
//
//  Created by 云轩 on 13-10-21.
//
//

#import <Foundation/Foundation.h>

@interface XCMocker : NSObject

+ (id)sharedInstance;

- (BOOL)canMockForUrl:(NSString *)url;

- (NSString *)mockedDataForUrl:(NSString *)url;

@end
