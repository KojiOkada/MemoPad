//
//  ExTextView.m
//  MemoBook
//
//  Created by システム管理者 on 13/05/23.
//  Copyright (c) 2013年 koji.Okada. All rights reserved.
//

#import "ExTextView.h"

@interface ExTextView ()

@end

@implementation ExTextView
-(void)drawRect:(CGRect)rect
{
    [self drawInContext:UIGraphicsGetCurrentContext()];
}
-(void)drawInContext:(CGContextRef)context
{
#warning どうしても線が文字についてこない
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 1.0, 1.0);//線の色。引数はcontext, R,G,B,アルファ。
    
    for(int i = 0;i < 28 ;i++){
        int y = 18 + i * 18;
    CGContextMoveToPoint(context, 0.0, y);//線の始点
    CGContextAddLineToPoint(context, 320.0,y );//線の終点から線を生成
    
    }
    
    
    CGContextStrokePath(context);//線を引く
}
@end
