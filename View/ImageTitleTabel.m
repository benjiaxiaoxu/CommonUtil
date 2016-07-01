//
//  ImageTitleTabel.m
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "ImageTitleTabel.h"
#import "OneLabel.h"

@implementation ImageTitleTabel

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
    // Drawing code
   }
 */
- (instancetype)initWithAry:(NSMutableArray *)data
{
    return [self initWithAry:data
                       isBig:NO];
}

- (instancetype)initWithAry:(NSMutableArray *)data isBig:(BOOL)isBig
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
                    SubImageTitleCell *view = [[SubImageTitleCell alloc]initWithImage:dic[@"image"] color:dic[@"color"]
                                                                            WithTitle:dic[@"title"]
                                                                                  end:YES
                                                                                isBig:isBig];
                    view.tag = [dic[@"tag"] intValue];
                    [view setDelegate:self];
                    [arr addObject:view];
                    [self addSubview:view];
                }
                else
                {
                    SubImageTitleCell *view = [[SubImageTitleCell alloc]initWithImage:dic[@"image"] color:dic[@"color"]
                                                                            WithTitle:dic[@"title"]
                                                                                  end:NO
                                                                                isBig:isBig];
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
            NSDictionary *dic       = data[0];
            SubImageTitleCell *view = [[SubImageTitleCell alloc]initWithImage:dic[@"image"] color:dic[@"color"]
                                                                    WithTitle:dic[@"title"]
                                                                          end:YES
                                                                        isBig:isBig];
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

- (void)tap:(SubImageTitleCell *)imageTitle tag:(NSInteger)tag
{
    if (_delegate && [_delegate respondsToSelector:@selector(tap:tag:)])
    {
        [_delegate tap:imageTitle
                   tag:tag];
    }
}

@end
