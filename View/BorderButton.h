//
//  BorderButton.h
//  ttky
//
//  Created by 许芝光 on 16/1/14.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockButton.h"
@interface BorderButton : BlockButton
{
    UIColor *textColor;
    UIColor *selectTextColor;
}
- (void)setTextColor:(UIColor *)textColor;
- (void)setBackgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)color font:(UIFont *)font borderColor:(UIColor *)borderColor;

- (void)setBgColor:(UIColor *)backgroundColor selectBackgroundColor:(UIColor *)selectbackgroundColor;
- (void)setBackgroundColor:(UIColor *)backgroundColor selectBackgroundColor:(UIColor *)selectbackgroundColo textColor:(UIColor *)color font:(UIFont *)font borderColor:(UIColor *)borderColor;
- (void)setBackgroundColor:(UIColor *)backgroundColor selectBackgroundColor:(UIColor *)selectbackgroundColor textColor:(UIColor *)color selectTextColor:(UIColor *)selectcolor font:(UIFont *)font borderColor:(UIColor *)borderColor;
- (void)addTarget:(id)target action:(SEL)action;
@end
