//
//  EKWWebView.m
//  EKWWebViewDemo
//
//  Created by jingdi on 2017/3/14.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "EKWWebView.h"
#import "WebViewJavascriptBridge.h"
#import <WebKit/WebKit.h>

#if !__has_feature(objc_arc)
#error EKWWebView is ARC only. Either turn on ARC for the project or use -fobjc-arc flag
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_8_0
#define kCFCoreFoundationVersionNumber_iPhoneOS_8_0 1140
#endif

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
#define IF_IOS8_OR_GREATER(...) if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_8_0) { __VA_ARGS__ }
#else
#define IF_IOS8_OR_GREATER(...)
#endif

#define IF_PRE_IOS8(...) if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_8_0) {__VA_ARGS__}


@interface EKWWebView()
@property WebViewJavascriptBridge* bridge;

@property (nonatomic, strong) id webView;
@property (nonatomic, strong) NSDictionary *dict;
@end

@implementation EKWWebView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [WebViewJavascriptBridge enableLogging];
        
        [self addSubview:self.webView];
        
        
        
    }
    return self;
}
- (void)setDataSource:(id<EKWWebViewDataSource>)dataSource {
    _dataSource = dataSource;
    
    _bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    [_bridge setWebViewDelegate:self];
    self.dict = [dataSource registerHandlerMethods];
    for (NSString *key in self.dict) {
        NSString *registerName = key;
        NSString *responseName = self.dict[registerName];
        __weak __typeof(self) weakSelf = self ;
        [self.bridge registerHandler:registerName handler:^(id data, WVJBResponseCallback responseCallback) {

            if (weakSelf.dataSource && [weakSelf.dataSource respondsToSelector:NSSelectorFromString(responseName)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [weakSelf.dataSource performSelector:NSSelectorFromString(responseName) withObject:data];
#pragma clang diagnostic pop
            }
        }];
    }
}
- (void)callHandlerMethod:(NSString *)method {
    [self callHandlerMethod:method data:nil];
}
- (void)callHandlerMethod:(NSString *)method data:(nullable NSDictionary *)data {
    if (!data) {
        [self.bridge callHandler:@"method"];
    } else {
        [self.bridge callHandler:method data:data];
    }
}
- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL {
    IF_IOS8_OR_GREATER([((WKWebView *)self.webView) loadData:data MIMEType:MIMEType characterEncodingName:textEncodingName baseURL:baseURL];);
    IF_PRE_IOS8([((UIWebView *)self.webView) loadData:data MIMEType:MIMEType textEncodingName:textEncodingName baseURL:baseURL];);
}
- (void)loadRequest:(NSURLRequest *)request {
    
    IF_IOS8_OR_GREATER([((WKWebView *)self.webView) loadRequest:request];);
    IF_PRE_IOS8([((UIWebView *)self.webView) loadRequest:request];);
}
- (void)loadHTMLString:(NSString *)string baseURL:(nullable NSURL *)baseURL {
    IF_IOS8_OR_GREATER([((WKWebView *)self.webView) loadHTMLString:string baseURL:baseURL];);
    IF_PRE_IOS8([((UIWebView *)self.webView) loadHTMLString:string baseURL:baseURL];);
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
- (id)webView {
    if (_webView == nil) {
        IF_IOS8_OR_GREATER(
                    _webView = [[WKWebView alloc] initWithFrame:self.bounds];
        );
        IF_PRE_IOS8(
                    _webView = [[UIWebView alloc] initWithFrame:self.bounds];
        );
    }
    return _webView;
}
#endif

@end
