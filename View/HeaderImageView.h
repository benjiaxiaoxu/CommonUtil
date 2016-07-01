//
//  HeaderImageView.h
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeaderImageView;
typedef void (^HeaderImageViewBlock)(HeaderImageView *returnView);
@interface HeaderImageView : UIImageView
{
    HeaderImageViewBlock tapAction;
}
- (void)canTap:(HeaderImageViewBlock)tap;

@end
