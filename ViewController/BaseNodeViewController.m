//
//  BaseNodeViewController.m
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "BaseNodeViewController.h"

@interface BaseNodeViewController ()

@end

@implementation BaseNodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view
     setBackgroundColor:whiteCr];
    UIButton *returnButton = [[UIButton alloc] initWithFrame:CGRectMake(-10, 0, 44,44)];
    [returnButton setImage:[UIImage imageNamed:@"icon---Back"]
                  forState:UIControlStateNormal];
    [returnButton addTarget:self
                     action:@selector(returnMain)
           forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:returnButton];
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
- (void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar
     setHidden:YES];
    self.hidesBottomBarWhenPushed = YES;
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.tabBarController.tabBar
     setHidden:NO];
    [super viewWillDisappear:animated];
}

- (void)returnMain
{
    [self.navigationController
     popViewControllerAnimated:YES];
}

@end
