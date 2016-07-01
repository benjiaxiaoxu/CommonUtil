//
//  SubImageTitleCell.h
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//
@class SubImageTitleCell;
@protocol SubImageTitleCellDelegate <NSObject>

- (void)tap:(SubImageTitleCell *)imageTitle tag:(NSInteger)tag;

@end

#import <UIKit/UIKit.h>

@interface SubImageTitleCell : UIView
@property(nonatomic, weak) id<SubImageTitleCellDelegate>delegate;
- (instancetype)initWithImage:(NSString *)image color:(UIColor *)imageColor WithTitle:(NSString *)title end:(BOOL)end isBig:(BOOL)isBig;
@end
