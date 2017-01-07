//
//  ViewController.m
//  TouchIdDemo
//
//  Created by jingdi on 2016/12/19.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = @"输入密码";
    NSError *error = nil;
}


@end
