//
//  PishumToastViewController.m
//  PishumToast
//
//  Created by Pishum on 16/1/26.
//  Copyright © 2016年 Pishum. All rights reserved.
//

#import "PishumToast.h"
#define animateTimerLong 0.3
@interface PishumToast ()

@end

@implementation PishumToast

static UIView *toastView = nil;
static UIView *parentView = nil;

+ (UIView*)ToastView{
    return toastView;
}


+ (void)showToastWithMessage:(NSString*)mesage Length:(TOAST_LENGTH)length
{
    
    CGRect rect = [UIApplication sharedApplication].keyWindow.bounds;
    rect.size.width = rect.size.width * (3.0/4.0);
    rect.size.height = 40;
    rect.origin.x = rect.size.width * (1.0/4.0);
    
    UILabel *label = [[UILabel alloc]init];
    label.text = mesage;
    label.numberOfLines = 0;
    label.adjustsFontSizeToFitWidth =YES;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor darkGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    CGPoint centerPoint =  [UIApplication sharedApplication].keyWindow.center;
    centerPoint.y = [UIApplication sharedApplication].keyWindow.bounds.size.height - 50.0f;
    
    label.layer.cornerRadius = 5;
    label.layer.borderWidth = 4;
    
    [label setFrame:rect];
    [label setCenter:centerPoint];
    
    label.layer.masksToBounds=YES;
    label.layer.cornerRadius=12.0f; //设置为图片宽度的一半出来为圆形
    label.layer.borderWidth=1.0f; //边框宽度
    label.layer.borderColor=[[UIColor grayColor] CGColor];//
    [label setAlpha:0.3];
//    [view addSubview:label];
    [[UIApplication sharedApplication].keyWindow addSubview:label];
    
    [UIView animateWithDuration:animateTimerLong animations:^{
        [label setAlpha:1.0];
    }];
    
    CGFloat timerLong = 2.5f;
    
    switch (length) {
        case 1:
            timerLong = 2.5f;
            break;
        case 2:
            timerLong = 3.5f;
            break;
        case 3:
            timerLong = 5.5f;
            break;
        default:
            break;
    }
    
    
    [NSTimer scheduledTimerWithTimeInterval:timerLong target:self selector:@selector(TimerOver:) userInfo:label repeats:NO];

}

+ (void)TimerOver:(NSTimer*)sender{
    UILabel *view = (UILabel*)[sender userInfo];
    
    [UIView animateWithDuration:animateTimerLong animations:^{
        [view setAlpha:0.0];
        
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:animateTimerLong target:self selector:@selector(RemoveSubView:) userInfo:view repeats:NO];
}

+ (void)RemoveSubView:(NSTimer*)sender{
    UILabel *view = (UILabel*)[sender userInfo];
    [view removeFromSuperview];
}
@end
