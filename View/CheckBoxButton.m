//
//  CheckBoxButton.m
//  Common
//
//  Created by 许芝光 on 16/2/19.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "CheckBoxButton.h"
#define Q_CHECK_ICON_WH                    (15.0)
#define Q_ICON_TITLE_MARGIN                (5.0)
@implementation CheckBoxButton

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
    // Drawing code
   }
 */
- (id)initWithDelegate:(id)delegate
{
    self = [super init];
    if (self)
    {
        _delegate = delegate;

        self.exclusiveTouch = YES;
        UIImage *image2 = UIImagePath(@"tuoyuanhui");
        UIImage *image1 = UIImagePath(@"tuoyuanlan");

        [self setImage:image2
              forState:UIControlStateNormal];
        [self setImage:image1
              forState:UIControlStateSelected];

        [self setTitleColor:appcolor
                   forState:UIControlStateSelected];
        [self setTitleColor:color6
                   forState:UIControlStateNormal];
        self.titleLabel.font = TEXTFONTSIZE15;
        [self.titleLabel
         setNumberOfLines:0];
        [self addTarget:self
                   action:@selector(checkboxBtnChecked)
         forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setChecked:(BOOL)checked
{
    if (_checked == checked)
    {
        return;
    }

    _checked      = checked;
    self.selected = checked;
}

- (void)checkboxBtnChecked
{
    self.selected = !self.selected;
    _checked      = self.selected;

    if (_delegate && [_delegate respondsToSelector:@selector(didSelectedCheckBox:userInfo:checked:)])
    {
        [_delegate didSelectedCheckBox:self
                              userInfo:_userInfo
                               checked:self.selected];
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, (CGRectGetHeight(contentRect) - Q_CHECK_ICON_WH) / 2.0, Q_CHECK_ICON_WH, Q_CHECK_ICON_WH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(Q_CHECK_ICON_WH + Q_ICON_TITLE_MARGIN, 0,
                      CGRectGetWidth(contentRect) - Q_CHECK_ICON_WH - Q_ICON_TITLE_MARGIN,
                      CGRectGetHeight(contentRect));
}

- (void)dealloc
{
    _delegate = nil;
}

@end
