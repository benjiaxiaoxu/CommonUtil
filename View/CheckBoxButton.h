//
//  CheckBoxButton.h
//  Common
//
//  Created by 许芝光 on 16/2/19.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CheckBoxDelegate;

@interface CheckBoxButton : UIButton
@property(nonatomic, assign) id<CheckBoxDelegate> delegate;
@property(nonatomic, assign) BOOL checked;
@property(nonatomic, strong) id userInfo;

- (id)initWithDelegate:(id)delegate;

@end

@protocol CheckBoxDelegate <NSObject>

@optional

- (void)didSelectedCheckBox:(CheckBoxButton *)checkbox userInfo:(id)userInfo checked:(BOOL)checked;

@end
