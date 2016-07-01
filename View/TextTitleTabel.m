//
//  TextTitleTabel.m
//  Common
//
//  Created by 许芝光 on 16/2/19.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "TextTitleTabel.h"

@implementation TextTitleTabel

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
    // Drawing code
   }
 */
- (instancetype)initWithAry:(NSMutableArray *)data
{
    self = [super init];
    if (self)
    {
        if (data.count > 1)
        {
            NSMutableArray *arr = @[].mutableCopy;
            for (int i = 0; i < data.count; i++)
            {
                NSDictionary *dic = data[i];
                if (i == data.count - 1)
                {
                    TextTitleCell *view = [[TextTitleCell alloc]initWithPrompt:dic[@"prompt"]
                                                                         title:dic[@"title"]
                                                                      userInfo:dic[@"userinfo"]
                                                                         isTap:[dic[@"isTap"] boolValue]
                                                                           end:YES];
                    view.tag = [dic[@"tag"] intValue];
                    [view setDelegate:self];
                    [arr addObject:view];
                    [self addSubview:view];
                }
                else
                {
                    TextTitleCell *view = [[TextTitleCell alloc]initWithPrompt:dic[@"prompt"]
                                                                         title:dic[@"title"]
                                                                      userInfo:dic[@"userinfo"]
                                                                         isTap:[dic[@"isTap"] boolValue]
                                                                           end:NO];
                    view.tag = [dic[@"tag"] intValue];
                    [view setDelegate:self];
                    [arr addObject:view];
                    [self addSubview:view];
                }
            }
            _viewAry = [NSMutableArray arrayWithArray:arr];
            [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical
                             withFixedSpacing:0
                                  leadSpacing:0
                                  tailSpacing:0];
            [arr makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(0);
                make.right.equalTo(0);
            }];
        }
        else
        {
            NSDictionary *dic   = data[0];
            TextTitleCell *view = [[TextTitleCell alloc]initWithPrompt:dic[@"prompt"]
                                                                 title:dic[@"title"]
                                                              userInfo:dic[@"userinfo"]
                                                                 isTap:[dic[@"isTap"] boolValue]
                                                                   end:YES];
            view.tag = [dic[@"tag"] intValue];
            [view setDelegate:self];
            [self addSubview:view];
            _viewAry = [NSMutableArray arrayWithObject:view];
            [view makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        }
    }
    return self;
}

- (void)didSelectTextTitleCell:(TextTitleCell *)textTitleCell userInfo:(id)userInfo
{
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectTextTitleCell:userInfo:)])
    {
        [_delegate didSelectTextTitleCell:textTitleCell
                                 userInfo:userInfo];
    }
}

@end
