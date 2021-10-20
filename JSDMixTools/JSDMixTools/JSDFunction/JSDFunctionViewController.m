//
//  JSDFunctionViewController.m
//  JSDMixTools
//
//  Created by 假设敌 on 2021/9/9.
//  Copyright © 2021 Jiashedi. All rights reserved.
//

#import "JSDFunctionViewController.h"
#import "JSDImpurityCodeView.h"
@interface JSDFunctionViewController ()
@property (nonatomic, strong) NSButton *JSDSelectBtn;
@property (nonatomic, strong) NSViewController *JSDSelectVC;
@property (weak) IBOutlet NSView *JSDFunctionView;
@property (weak) IBOutlet NSView *JSDShowUIView;

@property (weak) IBOutlet NSButton *JSDImpurityCodeBtn;

@end

@implementation JSDFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self JSDCreateUI];
    
}

-(void)JSDCreateUI{
    self.JSDFunctionView.wantsLayer = YES;
    self.JSDFunctionView.layer.backgroundColor = [NSColor colorWithRed:219/255.0 green:223/255.0 blue:232/255.0 alpha:1.0].CGColor;
    
    //恢复设置
    [self JSDDefaultBtnSet:self.JSDImpurityCodeBtn];
    
    
    self.JSDSelectBtn = self.JSDImpurityCodeBtn;
    self.JSDSelectBtn.layer.backgroundColor = [NSColor systemIndigoColor].CGColor;
    JSDImpurityCodeView *impuritycodeView = [[JSDImpurityCodeView alloc]init];
    [self.JSDShowUIView addSubview:impuritycodeView.view];
    self.JSDSelectVC = impuritycodeView;
    

}

- (void)JSDDefaultBtnSet:(NSButton *)sender{
    sender.wantsLayer = YES;
    sender.layer.backgroundColor = [NSColor colorWithRed:210/256. green:210/256. blue:210/256. alpha:1].CGColor;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:sender.title];
    [attr addAttributes:@{NSForegroundColorAttributeName:[NSColor blackColor] } range:NSMakeRange(0, sender.title.length)];
    sender.attributedTitle = attr;
}

- (void)JSDChangeLeftStatus:(NSButton*)sender{
    self.JSDSelectBtn.layer.backgroundColor = [NSColor colorWithRed:210/256. green:210/256. blue:210/256. alpha:1].CGColor;;
    sender.layer.backgroundColor = [NSColor systemIndigoColor].CGColor;
    self.JSDSelectBtn = sender;
}

- (void)JSDChangRightStatus:(NSViewController *)vc{
    
    [self.JSDSelectVC.view removeFromSuperview];
    [self.JSDSelectVC removeFromParentViewController];
    vc.view.frame = self.JSDShowUIView.bounds;
    [self.JSDShowUIView addSubview:vc.view];
    [self addChildViewController:vc];
    
    self.JSDSelectVC.view = vc.view;
    self.JSDSelectVC = vc;

}

- (IBAction)JSDImpurityCodeBtnAction:(id)sender {
    [self JSDChangeLeftStatus:sender];
    JSDImpurityCodeView *impuritycodeView = [[JSDImpurityCodeView alloc]init];
    [self JSDChangRightStatus:impuritycodeView];
}


@end
