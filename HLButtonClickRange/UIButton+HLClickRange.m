//
//  UIButton+HLClickRange.m
//  StructTest
//
//  Created by hhl on 2019/2/20.
//  Copyright © 2019 HL. All rights reserved.
//

#import "UIButton+HLClickRange.h"
#import <objc/runtime.h>

static char hlTopKey;
static char hlLeftKey;
static char hlBottomKey;
static char hlRightKey;

@implementation UIButton (HLClickRange)

- (void)hlChangeButtonClickLength:(CGFloat)length{
    
    [self hlChangeButtonClickRange:HLClickEdgeInsetsMake(length, length, length, length)];
}

- (void)hlChangeButtonClickRange:(HLClickEdgeInsets)edgeInsets{
    
    objc_setAssociatedObject(self, &hlTopKey, [NSNumber numberWithFloat:edgeInsets.top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &hlLeftKey, [NSNumber numberWithFloat:edgeInsets.left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &hlBottomKey, [NSNumber numberWithFloat:edgeInsets.bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &hlRightKey, [NSNumber numberWithFloat:edgeInsets.right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{

    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

- (CGRect)enlargedRect
{
    NSNumber *topEdge = objc_getAssociatedObject(self, &hlTopKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &hlLeftKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &hlBottomKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &hlRightKey);
   
    if (topEdge && rightEdge && bottomEdge && leftEdge){
        
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }else{
        
        return self.bounds;
    }
}

@end
