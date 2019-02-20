//
//  UIButton+HLClickRange.h
//  StructTest
//
//  Created by hhl on 2019/2/20.
//  Copyright © 2019 HL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct HLClickEdgeInsets {
    
    CGFloat top,left,bottom,right;
    
} HLClickEdgeInsets;

UIKIT_STATIC_INLINE HLClickEdgeInsets HLClickEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
    
    HLClickEdgeInsets clickEdgeInsets = {top, left, bottom, right};
    return clickEdgeInsets;
}

@interface UIButton (HLClickRange)

/**
 改变button的点击范围
 length:范围边缘距离（四个边缘同样距离）
 */
- (void)hlChangeButtonClickLength:(CGFloat)length;

/**
 改变button的点击范围
 edgeInsets:范围边缘距离
 */
- (void)hlChangeButtonClickRange:(HLClickEdgeInsets)edgeInsets;

@end

NS_ASSUME_NONNULL_END
