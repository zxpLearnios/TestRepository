//
//  ViewController.m
//  test_UIWindow
//
//  Created by Jingnan Zhang on 16/1/12.
//  Copyright © 2016年 Jingnan Zhang. All rights reserved.
// 1. 创建一个errorLab加到keyWindow（代理里设置过的窗口\主窗口）上,控制keyWindow的层级水平即可
// 2.xib\SB 直接加的话，无法调节navbar和errorLab的层级关系

#import "ViewController.h"
#import "QKErrorLabel.h"

@interface ViewController (){
    QKErrorLabel *errorLab;
    __weak IBOutlet QKErrorLabel *eLab;
}

@end

#define kheight [UIScreen mainScreen].bounds.size.height
#define kwidth [UIScreen mainScreen].bounds.size.width
#define kwindow  [UIApplication sharedApplication].keyWindow

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
     // 加errorLab
    errorLab = [[QKErrorLabel alloc]initWithFrame:CGRectMake(0, -18, kwidth, 18)];
    
}

- (IBAction)btnAction:(id)sender {
    [kwindow addSubview:errorLab];
    kwindow.windowLevel = UIWindowLevelAlert;
    errorLab.errorMessage = @"规定如果hi苏";

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        kwindow.windowLevel = UIWindowLevelNormal;
        [errorLab removeFromSuperview];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
