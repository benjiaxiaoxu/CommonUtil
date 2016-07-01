//
//  SubImageTitleCell.m
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "SubImageTitleCell.h"
#import "HeaderImageView.h"
#import "OneLabel.h"
#import "BaseLabel.h"
#define padding 12.5
@implementation SubImageTitleCell

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
    // Drawing code
   }
 */
- (instancetype)initWithImage:(NSString *)image color:(UIColor *)imageColor WithTitle:(NSString *)title end:(BOOL)end isBig:(BOOL)isBig
{
    self = [super init];
    if (self)
    {
        [self setBackgroundColor:whiteCr];
        int hwh = 18;
        if (isBig)
        {
            hwh = 35;
        }
        UIView * backView = [[UIView alloc]init];
        [backView setBackgroundColor:imageColor];
        [self addSubview:backView];
        [backView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(padding);
            make.bottom.equalTo(self.mas_bottom).with.offset(-padding);
            make.left.equalTo(self.mas_left).with.offset(padding);
            make.width.height.equalTo(hwh+paddingX);
        }];
        
        UIImageView *headerImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:image]];
        [self addSubview:headerImage];
        [headerImage makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(backView);
            make.width.height.equalTo(hwh);
        }];
        BaseLabel *titleLabel = [[BaseLabel alloc]init];
        [titleLabel setTextColor:color6];
        [titleLabel setText:title];
        [self addSubview:titleLabel];
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(headerImage).with.offset(0);
            make.left.equalTo(headerImage.mas_right).with.offset(padding);
        }];
        UIImage *image     = [UIImage imageNamed:@"arrow"];
        UIImageView *arrow = [[UIImageView alloc]initWithImage:image];
        [self addSubview:arrow];
        [arrow makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(headerImage).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(-padding);
        }];

        if (!end)
        {
            OneLabel *one = [[OneLabel alloc]init];
            [self addSubview:one];
            [one makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(headerImage.mas_bottom).with.offset(padding);
                make.left.equalTo(headerImage.mas_left).with.offset(0);
                make.width.equalTo(self);
                make.height.equalTo(1);
            }];
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                             action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tap
{
    if (_delegate && [_delegate respondsToSelector:@selector(tap:tag:)])
    {
        [_delegate tap:self
                   tag:self.tag];
    }
}

@end
