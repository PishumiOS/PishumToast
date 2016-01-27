//
//  PishumToastViewController.h
//  PishumToast
//
//  Created by Pishum on 16/1/26.
//  Copyright © 2016年 Pishum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PishumToast : UIView


typedef enum {
    TOAST_SHORT = 1,
    TOAST_MIDDLE = 2,
    TOAST_LONG = 3
}TOAST_LENGTH;

typedef struct{
    int name;
    int age;
}STU;

+ (void)showToastWithMessage:(NSString*)mesage Length:(TOAST_LENGTH)length ParentView:(UIView*)view;

+ (UIView*)ToastView;

+ (void)TimerOver:(NSTimer*)sender;
@end
