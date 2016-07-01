//
//  BorderButton.m
//  ttky
//
//  Created by 许芝光 on 16/1/14.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "BorderButton.h"

@implementation BorderButton

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
    // Drawing code
   }
 */
- (void)setTextColor:(UIColor *)textColor
{
    [self setBackgroundColor:whiteCr
       selectBackgroundColor:whiteCr
                   textColor:textColor
                        font:TEXTFONTSIZE15
                 borderColor:color9];
}

- (void)setBgColor:(UIColor *)backgroundColor selectBackgroundColor:(UIColor *)selectbackgroundColor
{
    [self setBackgroundColor:backgroundColor
       selectBackgroundColor:selectbackgroundColor
                   textColor:whiteCr
                        font:TEXTFONTSIZE15
                 borderColor:whiteCr];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)color font:(UIFont *)font borderColor:(UIColor *)borderColor
{
    [self setBackgroundColor:backgroundColor
       selectBackgroundColor:backgroundColor
                   textColor:color
                        font:font
                 borderColor:borderColor];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor selectBackgroundColor:(UIColor *)selectbackgroundColor textColor:(UIColor *)color font:(UIFont *)font borderColor:(UIColor *)borderColor
{
    [self setBackgroundColor:backgroundColor
       selectBackgroundColor:selectbackgroundColor
                   textColor:color
             selectTextColor:color
                        font:font
                 borderColor:borderColor];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor selectBackgroundColor:(UIColor *)selectbackgroundColor textColor:(UIColor *)color selectTextColor:(UIColor *)selectcolor font:(UIFont *)font borderColor:(UIColor *)borderColor
{
    [self setBackgroundImage:[self imageWithColor:backgroundColor]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[self imageWithColor:selectbackgroundColor]
                    forState:UIControlStateSelected];
    [self setTitleColor:color
               forState:UIControlStateNormal];
    textColor            = color;
    selectTextColor      = selectcolor;
    self.titleLabel.font = font;
    [self.layer
     setMasksToBounds:YES];
    [self.layer
     setCornerRadius:0.0];            //设置矩形四个圆角半径
    [self.layer
     setBorderWidth:0.5];            //边框宽度
    CGColorRef colorref = borderColor.CGColor;
    [self.layer
     setBorderColor:colorref];           //边框颜色
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected)
    {
        [self setTitleColor:selectTextColor
                   forState:UIControlStateNormal];
    }
    else
    {
        [self setTitleColor:textColor
                   forState:UIControlStateNormal];
    }
}

- (void)addTarget:(id)target action:(SEL)action
{
    [self addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
}

//  颜色转换为背景图片
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
