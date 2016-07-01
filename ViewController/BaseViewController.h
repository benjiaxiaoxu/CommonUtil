//
//  BaseViewController.h
//  AnStudent
//
//  Created by 许芝光 on 16/2/17.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate>

- (void)push:(UIViewController *)vc;
- (UIBarButtonItem *)right:(NSString *)title target:(nullable id)target action:(nullable SEL)action;
@end
