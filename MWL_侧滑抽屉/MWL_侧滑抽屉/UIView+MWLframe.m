//
//  UIView+MWLframe.m
//  MWL_侧滑抽屉
//
//  Created by maweilong-PC on 16/9/21.
//  Copyright © 2016年 maweilong. All rights reserved.
//

#import "UIView+MWLframe.h"

@implementation UIView (MWLframe)
-(CGFloat)x{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x{
    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;
}



-(CGFloat)y{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)y{
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;
}


-(CGFloat)width{
    return self.frame.size.width;
}
-(void)setWidth:(CGFloat)width{
    CGRect frame=self.frame;
    frame.size.width=width;
    self.frame=frame;
}



-(CGFloat)height{
    return self.frame.size.height;
}
-(void)setHeight:(CGFloat)height{
    CGRect frame=self.frame;
    frame.size.height=height;
    self.frame=frame;
}








-(CGFloat)ttx{
    return self.transform.tx;
}
-(void)setTtx:(CGFloat)ttx{
    CGAffineTransform  transform=self.transform;
    transform.tx=ttx;
    self.transform=transform;
    
    
}




-(CGFloat)tty{
    return self.transform.ty;
}
-(void)setTty:(CGFloat)tty{
    CGAffineTransform  transform=self.transform;
    transform.ty=tty;
    self.transform=transform;
    
    
}
@end
