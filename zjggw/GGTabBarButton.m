//
//  GGTabBarButton.m
//  zjggw
//
//  Created by yzp on 14-2-10.
//  Copyright (c) 2014年 yzp. All rights reserved.
//

#import "GGTabBarButton.h"

@implementation GGTabBarButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height*0.6;
    return CGRectMake(0, 4, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY=contentRect.size.height*0.6;
    CGFloat titleW=contentRect.size.width;
    CGFloat titleH=contentRect.size.height-titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
