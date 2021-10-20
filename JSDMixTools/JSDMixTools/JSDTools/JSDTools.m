//
//  JSDTools.m
//  JSDMixTools
//
//  Created by 假设敌 on 2021/9/13.
//  Copyright © 2021 Jiashedi. All rights reserved.
//

#import "JSDTools.h"
#import "STPrivilegedTask.h"
@implementation JSDTools

+(BOOL)JSDisNull:(id)string{
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]]) {
        
        if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
            return YES;
        }
    }
    return NO;
}

//+(NSString *)commandTask:(NSArray *)params{
//    
//    NSTask *task = [[NSTask alloc] init];
//    task.launchPath = @"/bin/bash";
//    NSString *pyStr = [params componentsJoinedByString:@" "];
//    pyStr = [NSString stringWithFormat:@"python3 %@",pyStr];
//    [task setArguments:[NSArray arrayWithObjects:@"-c",pyStr, nil]];
//
//    task.currentDirectoryPath = [[NSBundle  mainBundle] resourcePath];
//    NSPipe *outputPipe = [NSPipe pipe];
//    [task setStandardOutput:outputPipe];
//    [task setStandardError:outputPipe];
//    NSFileHandle *readHandle = [outputPipe fileHandleForReading];
//    [task launch];
//    [task waitUntilExit];
//    
//    NSData *outputData = [readHandle readDataToEndOfFile];
//    NSString *outputString = [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding];
//    NSLog(@"python-Debug : \n%@",outputString);
//    [task terminate];
//    
//    return outputString;
//}

+ (NSString *)commandTask:(NSString *)cmd{
    STPrivilegedTask *privilegedTask = [[STPrivilegedTask alloc]init];
    [privilegedTask setLaunchPath:cmd];
//    [privilegedTask setArguments:@[@"-c",cmd]];
    
    OSStatus err = [privilegedTask launch];
      if (err != errAuthorizationSuccess) {
          if (err == errAuthorizationCanceled) {
              NSLog(@"User cancelled");
          } else {
              NSLog(@"Something went wrong:%d",(int)err);
          }
      } else {
          NSLog(@"Task successfully launched");
      }
    
    [privilegedTask waitUntilExit];
    
    NSFileHandle *readHandle = [privilegedTask outputFileHandle];
    NSData *outputData = [readHandle readDataToEndOfFile];
    NSString *outputString = [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",outputString);
    return outputString;
}
+ (NSString *)commandTask:(NSArray *)cmd launchPath:(NSString *)launchPath{
    STPrivilegedTask *privilegedTask = [[STPrivilegedTask alloc] init];
    [privilegedTask setLaunchPath:launchPath];
    [privilegedTask setArguments:cmd];

    OSStatus err = [privilegedTask launch];
    if (err != errAuthorizationSuccess) {
        if (err == errAuthorizationCanceled) {
            NSLog(@"User cancelled");
        } else {
            NSLog(@"Something went wrong");
        }
    } else {
        NSLog(@"Task successfully launched");
    }
    [privilegedTask waitUntilExit];
    NSFileHandle *readHandle = [privilegedTask outputFileHandle];
    NSData *outputData = [readHandle readDataToEndOfFile];
    NSString *outputString = [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",outputString);
    return outputString;
}
@end
