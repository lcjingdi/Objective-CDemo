//
//  ViewController.m
//  TableViewDemo
//
//  Created by jingdi on 2016/11/10.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "ViewController.h"
#import "jingdi.h"

@interface ViewController ()
//缓存高度所用字典
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:@"jingdi" bundle:nil] forCellReuseIdentifier:@"jingdi"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // 使用此方法或者使用代理方法estimatedHeightForRowAtIndexPath替代
    self.tableView.estimatedRowHeight = 100;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    jingdi *cell = [tableView dequeueReusableCellWithIdentifier:@"jingdi"];
    
    if (indexPath.row == 0) {
        cell.label.text = @"阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景";
    } else if (indexPath.row == 1) {
        cell.label.text = @"阿贾克斯队了风景拉开撒的风景";
    } else if (indexPath.row == 12) {
        cell.label.text = @"阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景";
    } else {
            cell.label.text = @"阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景阿贾克斯队了风景拉开撒的风景";
    }

    
    return cell;
}

#pragma mark - UITableViewDelegate
// 然后在调用estimatedHeightForRowAtIndexPath方法时，先去字典查看有没有缓存高度，有就返回，没有就返回一个大概高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    if (height) {
        return height.floatValue;
    } else {
        return 100;
    }
}
// cell将要显示的时候在字典中保存这行cell的高度
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *height = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:height forKey:indexPath];
}
@end
