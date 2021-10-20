//
//  JSDImpurityCodeView.m
//  JSDMixTools
//
//  Created by 假设敌 on 2021/9/9.
//  Copyright © 2021 Jiashedi. All rights reserved.
//

#import "JSDImpurityCodeView.h"

@interface JSDImpurityCodeView ()
@property (weak) IBOutlet NSTextField *JSDPathText;
@property (nonatomic, copy) NSString *JSDImpurityCodePath;
@property (nonatomic, copy) NSString *JSDWordTxtPath;
@property (nonatomic, copy) NSString *JSDImpuritypyPath;
@end

@implementation JSDImpurityCodeView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)JSDSelectPathAction:(id)sender {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setPrompt:@"确定"];
    openPanel.directoryURL = nil;
    openPanel.allowsMultipleSelection = NO;
    openPanel.canChooseDirectories = YES;
    [openPanel beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse result) {
        if (result == NSModalResponseOK) {
                 NSString *pathString = [openPanel.URLs.firstObject path];
                 self.JSDPathText.stringValue = pathString;
             }
    }];
}
- (IBAction)JSDStartAction:(id)sender {
    
    if ([JSDTools JSDisNull:self.JSDPathText.stringValue]) {
        NSAlert *alert = [[NSAlert alloc]init];
        alert.alertStyle = NSAlertStyleWarning;
        [alert addButtonWithTitle:@"确定"];
        alert.messageText = @"温馨提示";
        alert.informativeText = @"请选择杂质生成地址";
        [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow completionHandler:^(NSModalResponse returnCode) {
            if (returnCode == NSAlertFirstButtonReturn) {
                return;
            }
        }];
        
    }else{
        self.JSDImpurityCodePath = [NSString stringWithFormat:@"%@/",self.JSDPathText.stringValue];
        NSLog(@"%@",self.JSDImpurityCodePath);
        self.JSDWordTxtPath = [[NSBundle mainBundle]pathForResource:@"resource.txt" ofType:nil];
        self.JSDImpuritypyPath = [[NSBundle mainBundle]URLForResource:@"JSDImpurityCode" withExtension:nil].path;
        NSMutableArray * paramsArr = [NSMutableArray arrayWithCapacity:0];
        [paramsArr addObject:self.JSDImpurityCodePath];
        [paramsArr addObject:self.JSDWordTxtPath];
        [JSDTools commandTask:paramsArr launchPath:self.JSDImpuritypyPath];

    }
}



@end
