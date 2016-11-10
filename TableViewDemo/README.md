UITableViewCell

动态计算高度

使用条件：iOS8以上

使用方法：

1. 为原型单元格定义Auto Layout约束
2. 指定表视图的estimatedRowHeight （也可以使用代理方法）
   tableView.estimatedRowHeight = 44.0
3. 将表视图的rowHeight属性设置为UITableViewAutomaticDimension
   tableView.rowHeight = UITableViewAutomaticDimension

可能出现的问题

可能会出现第一次展现的时候不能正常显示

解决方法

在viewDidAppear方法里面调用tableView.reloadData()







