//
//  SearchTextField.m
//  jms
//
//  Created by 许芝光 on 16/6/20.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "SearchTextField.h"
#define BUTTON_SIZE CGSizeMake(15, 15)

@implementation SearchTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImageView *image = [[UIImageView alloc] initWithImage:UIImagePath(@"main_fangdajing")];
        image.frame = CGRectMake(0, 0, BUTTON_SIZE.width, BUTTON_SIZE.height);
        self.layer.cornerRadius = 5.0;
        self.leftView = image;
        self.leftViewMode = UITextFieldViewModeAlways;

    }
    return self;
}
//  重写占位符的x值
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect placeholderRect = [super placeholderRectForBounds:bounds];
    return placeholderRect;
}
//  重写文字输入时的X值
- (CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect editingRect = [super editingRectForBounds:bounds];
    return editingRect;
}
//让文字居中显示
- (void)drawPlaceholderInRect:(CGRect)rect {
    [super drawPlaceholderInRect:CGRectMake(0, self.bounds.size.height * 0.5 - 1, 0, 0)];
}

@end
