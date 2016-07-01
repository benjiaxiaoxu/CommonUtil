//
//  TextTitleCell.h
//  Common
//
//  Created by 许芝光 on 16/2/19.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseLabel.h"

@protocol TextTitleCellDelegate;

@interface TextTitleCell : UIView
{
    BaseLabel *titleLabel;
}
@property(nonatomic, weak) id<TextTitleCellDelegate>   delegate;
@property(nonatomic, strong, readonly) id userInfo;

- (instancetype)initWithPrompt:(NSString *)prompt title:(NSString *)title userInfo:(id)userInfo isTap:(BOOL)isTap end:(BOOL)end;
- (void)setTitleValue:(NSString *)titleStr;
@end

@protocol TextTitleCellDelegate <NSObject>

@optional

- (void)didSelectTextTitleCell:(TextTitleCell *)textTitleCell userInfo:(id)userInfo;

@end
