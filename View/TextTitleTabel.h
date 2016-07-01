//
//  TextTitleTabel.h
//  Common
//
//  Created by 许芝光 on 16/2/19.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextTitleCell.h"
@interface TextTitleTabel : UIView<TextTitleCellDelegate>
@property(nonatomic, strong) NSMutableArray *viewAry;
@property(nonatomic, weak) id<TextTitleCellDelegate>delegate;
- (instancetype)initWithAry:(NSMutableArray *)data;

@end
