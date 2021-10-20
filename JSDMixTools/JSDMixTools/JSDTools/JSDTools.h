//
//  JSDTools.h
//  JSDMixTools
//
//  Created by 假设敌 on 2021/9/13.
//  Copyright © 2021 Jiashedi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSDTools : NSObject

+(BOOL)JSDisNull:(id)string;

//+(NSString *)commandTask:(NSArray *)params;

+ (NSString *)commandTask:(NSString *)cmd;

+ (NSString *)commandTask:(NSArray *)cmd launchPath:(NSString *)launchPath;
@end

NS_ASSUME_NONNULL_END
