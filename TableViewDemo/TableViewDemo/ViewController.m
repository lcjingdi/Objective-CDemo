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
@property (weak, nonatomic) IBOutlet UILabel *label;

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



@end
