//
//  TextTitleCell.m
//  Common
//
//  Created by 许芝光 on 16/2/19.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "TextTitleCell.h"
#import "OneLabel.h"
#define padding 12.5
#define arrowWH 22
#define MYBUNDLE_NAME @"CommonBundle.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:MYBUNDLE_NAME]
#define MYBUNDLE [NSBundle bundleWithPath:MYBUNDLE_PATH]
@implementation TextTitleCell

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
    // Drawing code
   }
 */

- (instancetype)initWithPrompt:(NSString *)prompt title:(NSString *)title userInfo:(id)userInfo isTap:(BOOL)isTap end:(BOOL)end
{
    if (self == [super init])
    {
        [self setBackgroundColor:whiteCr];
        _userInfo = userInfo;
        BaseLabel *promptLabel = [[BaseLabel alloc]init];
        [promptLabel setTextColor:color3];
        [promptLabel setText:prompt];
        [self addSubview:promptLabel];
        [promptLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(padding);
            make.left.equalTo(self.mas_left).with.offset(padding);
        }];

        titleLabel = [[BaseLabel alloc]init];
        titleLabel.numberOfLines = 0;
        titleLabel.textAlignment = NSTextAlignmentRight;
        [titleLabel setTextColor:color6];
        [titleLabel setText:title];
        [self addSubview:titleLabel];
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(promptLabel).with.offset(0);
            if (isTap) {
                make.right.equalTo(self.mas_right).with.offset(-1 * padding - arrowWH);
            }else{
                make.right.equalTo(self.mas_right).with.offset(-1 * padding);
            }
            make.width.equalTo(200);
            make.bottom.equalTo(self.mas_bottom).with.offset(-padding);
        }];

        if (isTap)
        {
            UIImage *image     = [UIImage imageNamed:@"arrow"];
            UIImageView *arrow = [[UIImageView alloc]initWithImage:image];
            [self addSubview:arrow];
            [arrow makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(promptLabel).with.offset(0);
                make.right.equalTo(self.mas_right).with.offset(-padding);
            }];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                 action:@selector(tap)];
            [self addGestureRecognizer:tap];
        }
        if (!end)
        {
            OneLabel *one = [[OneLabel alloc]init];
            [self addSubview:one];
            [one makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(promptLabel.mas_bottom).with.offset(padding);
                make.left.equalTo(promptLabel.mas_left).with.offset(0);
                make.width.equalTo(self);
                make.height.equalTo(1);
            }];
        }
    }
    return self;
}

- (void)setTitleValue:(NSString *)titleStr
{
    [titleLabel setText:titleStr];
}

- (void)tap
{
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectTextTitleCell:userInfo:)])
    {
        [_delegate didSelectTextTitleCell:self
                                 userInfo:_userInfo];
    }
}

@end
