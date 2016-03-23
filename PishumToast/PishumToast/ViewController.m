//
//  ViewController.m
//  PishumToast
//
//  Created by Pishum on 16/1/26.
//  Copyright © 2016年 Pishum. All rights reserved.
//

#import "ViewController.h"
#import "PishumToast.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [PishumToast showToastWithMessage:@"启动了。。。" Length:TOAST_MIDDLE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)OnClicked:(UIButton *)sender {
    
    [PishumToast showToastWithMessage:@"显示的内容" Length:TOAST_MIDDLE ];
}

@end
