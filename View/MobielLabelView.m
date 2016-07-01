//
//  MobielLabelView.m
//  ywy
//
//  Created by 许芝光 on 16/6/22.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "MobielLabelView.h"

@implementation MobielLabelView
-(void)setMobile:(NSString *)mobile
{
    _mobile = mobile;
    BaseLabel * mobileLabel = [[BaseLabel alloc]init];
    mobileLabel.text = mobile;
    [mobileLabel setTextAlignment:NSTextAlignmentCenter];
    [mobileLabel setTextColor:color6 textFont:TEXTFONTSIZE13];
    [self addSubview:mobileLabel];
    [mobileLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(paddingZero);
        make.bottom.equalTo(paddingZero);
        make.left.equalTo(paddingZero);
        make.right.equalTo(paddingZero);
    }];
    
    [self setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapgest = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                             action:@selector(tapAction)];
    [self addGestureRecognizer:tapgest];

}

-(void)tapAction
{
    NSString *num = [[NSString alloc] initWithFormat:@"telprompt://%@",_mobile]; //而这个方法则打电话前先弹框  是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
}
@end
