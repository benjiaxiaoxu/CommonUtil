//
//  BaseViewController.m
//  AnStudent
//
//  Created by 许芝光 on 16/2/17.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view
     setBackgroundColor:whiteCr];
    BOOL is7Version = [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0 ? YES : NO;
    if (is7Version)
    {
        self.edgesForExtendedLayout                                        = UIRectEdgeNone;
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
   
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   // Get the new view controller using [segue destinationViewController].
   // Pass the selected object to the new view controller.
   }
 */
- (void)push:(UIViewController *)vc
{
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController
     pushViewController:vc
               animated:YES];
}

- (UIBarButtonItem *)right:(NSString *)title target:(nullable id)target action:(nullable SEL)action
{
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:title
                                                           style:UIBarButtonItemStylePlain
                                                          target:target
                                                          action:action];

    [btn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TEXTFONTSIZE13, NSFontAttributeName,
                                 whiteCr, NSForegroundColorAttributeName,
                                 nil]
                       forState:UIControlStateNormal];
    return btn;
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.viewControllers.count == 1)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
