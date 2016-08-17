//
//  UIView+HDCore.m
//  HDCore
//
//  Created by zhangdadi on 15/3/31.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "UIView+HDCore.h"
#import "HDUtilsMacro.h"

@implementation UIView (HDCore)

// Retrieve and set the origin
- (CGPoint)HDOrigin
{
    return self.frame.origin;
}

- (void)setHDOrigin:(CGPoint)aPoint
{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame      = newframe;
}

// Retrieve and set the size
- (CGSize)HDSize
{
    return self.frame.size;
}

- (void)setHDSize:(CGSize)aSize
{
    CGRect newframe = self.frame;
    newframe.size   = aSize;
    self.frame      = newframe;
}

- (CGFloat)HDWidth {
    return self.HDSize.width;
}

- (void)setHDWidth:(CGFloat)width {
    self.HDSize = CGSizeMake(width, self.HDHeight);
}

- (CGFloat)HDHeight {
    return self.HDSize.height;
}

- (void)setHDHeight:(CGFloat)height {
    self.HDSize = CGSizeMake(self.HDWidth, height);

}

- (void)setHDCenterX:(CGFloat)HDCenterX
{
    CGPoint center = self.center;
    center.x = HDCenterX;
    self.center = center;
}

- (CGFloat)HDCenterX
{
    return self.center.x;
}
- (void)setHDCenterY:(CGFloat)HDCenterY
{
    CGPoint center = self.center;
    center.y = HDCenterY;
    self.center = center;
}

- (CGFloat)HDCenterY
{
    return self.center.y;
}

+ (instancetype)HDViewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}


//位置

- (CGFloat)HDLeft {
    return self.frame.origin.x;
}

- (void)setHDLeft:(CGFloat)vLeft {
    CGRect newframe   = self.frame;
    newframe.origin.x = vLeft;
    self.frame        = newframe;
}

- (CGFloat)HDRight {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setHDRight:(CGFloat)vRight {
    CGFloat delta     = vRight - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe   = self.frame;
    newframe.origin.x += delta ;
    self.frame        = newframe;
}

- (CGFloat)HDTop {
    return self.frame.origin.y;

}

- (void)setHDTop:(CGFloat)vTop {
    CGRect newframe   = self.frame;
    newframe.origin.y = vTop;
    self.frame        = newframe;

}

- (CGFloat)HDBottom {
    return self.frame.origin.y + self.frame.size.height;

}

- (void)setHDBottom:(CGFloat)vBottom {
    CGRect newframe   = self.frame;
    newframe.origin.y = vBottom - self.frame.size.height;
    self.frame        = newframe;
}


// Move via offset
- (void)HDMoveBy:(CGPoint)delta {
    CGPoint newcenter = self.center;
    newcenter.x       += delta.x;
    newcenter.y       += delta.y;
    self.center       = newcenter;
}

// Scaling
- (void)HDScaleBy:(CGFloat)scaleFactor {
    CGRect newframe      = self.frame;
    newframe.size.width  *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame           = newframe;
}

- (void)setHDRadius:(CGFloat)HDRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = HDRadius;
}

- (CGFloat)HDRadius {
    return self.layer.cornerRadius;
}

- (void)setHDBordColor:(UIColor *)HDBordColor {
    self.layer.borderColor = HDBordColor.CGColor;
}

- (UIColor *)HDBordColor {
    return nil;
}

- (void)setHDBorderWidth:(CGFloat)HDBorderWidth {
    self.layer.borderWidth = .5;
}

- (CGFloat)HDBorderWidth {
    return self.layer.borderWidth;
}


- (UIViewController*)HDViewController {
    
    UIResponder *nextResponder =  self;
    
    do {
        nextResponder = [nextResponder nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
    } while (nextResponder != nil);
    
    return nil;
}

-(void)HDRemoveAllChildren{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}


@end
