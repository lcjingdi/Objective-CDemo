TableViewCell

动态计算高度

使用条件：iOS8以上

使用方法：

1. 为原型单元格定义Auto Layout约束
2. 指定表视图的estimatedRowHeight （也可以使用代理方法）
   tableView.estimatedRowHeight = 44.0
3. 将表视图的rowHeight属性设置为UITableViewAutomaticDimension
   tableView.rowHeight = UITableViewAutomaticDimension

可能出现的问题

第一次展现的时候不能正常显示

    在viewDidAppear方法里面调用tableView.reloadData()

点击顶部无法回到最上面

    用一个字典做容器，在cell将要显示的时候在字典中保存这行cell的高度。然后在调用estimatedHeightForRowAtIndexPath方法时，先去字典查看有没有缓存高度，有就返回，没有就返回一个大概高度。
    
    @property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度所用字典
    -(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
        NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
        if(height) {
            return height.floatValue;
        } else {
            return 100;
        }
    }
    - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
        NSNumber *height = @(cell.frame.size.height);
        [self.heightAtIndexPath setObject:height forKey:indexPath];
    }
