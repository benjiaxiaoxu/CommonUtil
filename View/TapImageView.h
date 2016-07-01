//
//  TapImageView.h
//  Common
//
//  Created by 许芝光 on 16/2/22.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TapImageView;
typedef void (^TapImageViewBlock)(TapImageView *returnView);

@interface TapImageView : UIImageView
{
    TapImageViewBlock tapAction;
}
- (void)canTap:(TapImageViewBlock)tap;
@end
