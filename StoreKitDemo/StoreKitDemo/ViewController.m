//
//  ViewController.m
//  StoreKitDemo
//
//  Created by jingdi on 2016/11/4.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/StoreKit.h>

@interface ViewController ()<SKStoreProductViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self openAppStoreWithIdentifier:@"911325680"];
}

/** 通过appID打开商店 */
- (void)openAppStoreWithIdentifier:(NSString *)identifier {
    SKStoreProductViewController *vc = [[SKStoreProductViewController alloc] init];
    vc.delegate = self;
    
    // 此方法放在前面防止appstore打开过慢
    [self presentViewController:vc animated:YES completion:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:identifier forKey:SKStoreProductParameterITunesItemIdentifier];
    [vc loadProductWithParameters:dict completionBlock:^(BOOL result, NSError * _Nullable error) {
        // 没有错误
        if (result) {
//            [self presentViewController:vc animated:YES completion:nil];
        } else {
            NSLog(@"error->%@",error);
        }
    }];
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"123123123");
    }];
}

@end
