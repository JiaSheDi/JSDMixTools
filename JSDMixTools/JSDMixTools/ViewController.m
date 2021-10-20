//
//  ViewController.m
//  JSDMixTools
//
//  Created by 假设敌 on 2021/9/9.
//

#import "ViewController.h"
#import "JSDFunctionViewController.h"
@interface ViewController ()<NSViewControllerPresentationAnimator>
@property (weak) IBOutlet NSTextField *JSDAccountText;
@property (weak) IBOutlet NSTextField *JSDPasswdText;
@property (weak) IBOutlet NSTextField *JSDVersionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];


}
- (IBAction)JSDLoginAction:(id)sender {
   
    JSDFunctionViewController *functionVC = [[JSDFunctionViewController alloc]initWithNibName:@"JSDFunctionViewController" bundle:[NSBundle mainBundle]];
    self.view.window.contentViewController = functionVC;
    
}

-(void)animatePresentationOfViewController:(NSViewController *)viewController fromViewController:(NSViewController *)fromViewController{

}

-(void)animateDismissalOfViewController:(NSViewController *)viewController fromViewController:(NSViewController *)fromViewController{

}


@end
