//
//  EKWWebView.h
//  EKWWebViewDemo
//
//  Created by jingdi on 2017/3/14.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol EKWWebViewDelegate;
@protocol EKWWebViewDataSource;

@interface EKWWebView : UIView

@property (nullable, nonatomic, assign) id <EKWWebViewDelegate> delegate;
@property (nullable, nonatomic, assign) id <EKWWebViewDataSource> dataSource;

- (void)loadRequest:(NSURLRequest *)request;
- (void)loadHTMLString:(NSString *)string baseURL:(nullable NSURL *)baseURL;
- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL;

@property (nullable, nonatomic, readonly, strong) NSURLRequest *request;

- (void)callHandlerMethod:(NSString *)method;
- (void)callHandlerMethod:(NSString *)method data:(nullable NSDictionary *)data;

@end

@protocol EKWWebViewDelegate <NSObject>

@optional

- (void)webViewDidStartLoad:(EKWWebView *)webView;
- (void)webViewDidFinishLoad:(EKWWebView *)webView;
- (void)webView:(EKWWebView *)webView didFailLoadWithError:(NSError *)error;

@end

@protocol EKWWebViewDataSource <NSObject>

- (NSDictionary *)registerHandlerMethods;

@end

NS_ASSUME_NONNULL_END
