//
//  BaseViewController.m
//  MWL_侧滑抽屉
//
//  Created by maweilong-PC on 16/9/21.
//  Copyright © 2016年 maweilong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button setImage:[UIImage imageNamed:@"123"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(GoinSide:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self SetTableView];
}

- (void)SetTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}


- (void)GoinSide:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ClickSlide" object:nil userInfo:@{@"IsOpen":@"YES"}];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ClickSlide" object:nil userInfo:@{@"IsOpen":@"NO"}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
