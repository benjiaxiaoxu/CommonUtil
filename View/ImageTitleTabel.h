//
//  ImageTitleTabel.h
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//
@class SubImageTitleCell;
@protocol ImageTitleTabelDelegate <NSObject>

- (void)tap:(SubImageTitleCell *)imageTitle tag:(NSInteger)tag;

@end
#import <UIKit/UIKit.h>
#import "SubImageTitleCell.h"

@interface ImageTitleTabel : UIView<SubImageTitleCellDelegate>
@property(nonatomic, strong) NSMutableArray *viewAry;
@property(nonatomic, weak) id<ImageTitleTabelDelegate>delegate;
- (instancetype)initWithAry:(NSMutableArray *)data;
- (instancetype)initWithAry:(NSMutableArray *)data isBig:(BOOL)isBig;
@end
