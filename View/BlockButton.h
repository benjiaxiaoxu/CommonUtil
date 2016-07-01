//
//  BlockButton.h
//  Common
//
//  Created by 许芝光 on 16/2/23.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlockButton;
typedef void (^ButtonBlock)(BlockButton *returnView);
@interface BlockButton : UIButton
{
    ButtonBlock tapblock;
}
- (void)tapAction:(ButtonBlock)tap;
@end
