//
//  ViewController.m
//  WebViewDemo
//
//  Created by jingdi on 2017/3/16.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "ViewController.h"
#import "WebViewJavascriptBridge.h"


@interface ViewController ()
@property (nonatomic, strong) UIWebView *webView1;
//@property (nonatomic, strong) WKWebView *webView2;

@property WebViewJavascriptBridge *bridge1;
//@property WebViewJavascriptBridge *bridge2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self uiwebview];
//    [self wkwebView];
}

- (void)uiwebview {
    [self.view addSubview:self.webView1];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [self.webView1 loadHTMLString:html baseURL:nil];
    _bridge1 = [WebViewJavascriptBridge bridgeForWebView:self.webView1];
    [_bridge1 setWebViewDelegate:self];
    
    [self.bridge1 registerHandler:@"Greet" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"监听到了js greet回调 %@ uiwebview", data);
    }];
}
//- (void)wkwebView {
//    [self.view addSubview:self.webView2];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test2" ofType:@"html"];
//    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [self.webView2 loadHTMLString:html baseURL:nil];
//    _bridge2 = [WebViewJavascriptBridge bridgeForWebView:self.webView2];
//    [_bridge2 setWebViewDelegate:self];
//    
//    [self.bridge2 registerHandler:@"Greet" handler:^(id data, WVJBResponseCallback responseCallback) {
//        NSLog(@"监听到了js greet回调 %@ wkwebView", data);
//    }];
//}

- (UIWebView *)webView1 {
    if (_webView1 == nil) {
        _webView1 = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2.0)];
    }
    return _webView1;
}

//- (WKWebView *)webView2 {
//    if (_webView2 == nil) {
//        
//        _webView2 = [[WKWebView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2.0)];
//    }
//    return _webView2;
//}
@end
