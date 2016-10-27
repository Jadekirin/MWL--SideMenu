//
//  MWL_ContacterController.m
//  MWL_侧滑抽屉
//
//  Created by maweilong-PC on 16/9/21.
//  Copyright © 2016年 maweilong. All rights reserved.
//

#import "MWL_ContacterController.h"

@interface MWL_ContacterController ()

@end

@implementation MWL_ContacterController

- (void)viewWillAppear:(BOOL)animated{
    NSDictionary *info = @{@"index":@"1"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Selectindex" object:nil userInfo:info];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"联系人";
    //搜索栏
    UISearchBar *sB=[[UISearchBar alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,44)];
    [sB setPlaceholder:@"搜索"];
    
    [self.tableView addSubview:sB];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

@end
