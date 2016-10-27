//
//  MWL_DynamicController.m
//  MWL_侧滑抽屉
//
//  Created by maweilong-PC on 16/9/21.
//  Copyright © 2016年 maweilong. All rights reserved.
//

#import "MWL_DynamicController.h"

@interface MWL_DynamicController ()

@end

@implementation MWL_DynamicController

- (void)viewWillAppear:(BOOL)animated{
    NSDictionary *info = @{@"index":@"2"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Selectindex" object:nil userInfo:info];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"动态";
    
    //搜索栏
    UISearchBar *sB=[[UISearchBar alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,44)];
    [sB setPlaceholder:@"搜索电影/音乐/商品..."];
    
    [self.tableView addSubview:sB];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row==1) {
        cell.imageView.image=[UIImage imageNamed:@"tab_qworld_nor"];
        cell.textLabel.text=@"空间";
    }
    
    return cell;
}

@end
