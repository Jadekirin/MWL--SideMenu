//
//  UIView+MWLframe.h
//  MWL_侧滑抽屉
//
//  Created by maweilong-PC on 16/9/21.
//  Copyright © 2016年 maweilong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MWLframe)

@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;



@property(nonatomic,assign)CGFloat ttx;
@property(nonatomic,assign)CGFloat tty;



-(void)setX:(CGFloat)x;
-(void)setY:(CGFloat)y;
-(void)setWidth:(CGFloat)width;
-(void)setHeight:(CGFloat)height;

@end
