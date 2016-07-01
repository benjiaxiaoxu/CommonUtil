//
//  NavView.m
//  jms
//
//  Created by 许芝光 on 16/6/20.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "NavView.h"
#import "SearchTextField.h"
#define logoWidth 97
#define logoHight 20
#define TextFWidth 150
#define TextFHight 35
@implementation NavView

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
        UIView * view = [[UIView alloc]init];
        [self addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.left.equalTo(paddingZero);
            make.width.equalTo(SCREEN_WIDTH);
            make.height.equalTo(paddingY+TextFHight);
        }];
        
        UIImageView * logoImage = [[UIImageView alloc]initWithImage:UIImagePath(@"logo")];
        [view addSubview:logoImage];
        [logoImage makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view);
            make.left.equalTo(view.mas_left).with.offset(paddingX);
            make.width.equalTo(logoWidth);
            make.height.equalTo(logoHight);
        }];
        
        SearchTextField * search = [[SearchTextField alloc]init];
        [view addSubview:search];
        [search makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view);
            make.left.equalTo(logoImage.mas_right).with.offset(paddingX);
            make.width.equalTo(TextFWidth);
            make.height.equalTo(TextFHight);
        }];
        
        
    }
    return self;
}
@end
