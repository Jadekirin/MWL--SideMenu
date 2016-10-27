//
//  MWL_NewsController.m
//  MWL_侧滑抽屉
//
//  Created by maweilong-PC on 16/9/21.
//  Copyright © 2016年 maweilong. All rights reserved.
//

#import "MWL_NewsController.h"
#import "UIView+MWLframe.h"
@interface MWL_NewsController ()
@end

@implementation MWL_NewsController

- (void)viewWillAppear:(BOOL)animated{
    NSDictionary *info = @{@"index":@"0"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Selectindex" object:nil userInfo:info];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubViews];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置基本控件
-(void)setSubViews{
    self.navigationItem.title=@"消息";
    //    分段控件
    UISegmentedControl *segmentC=[[UISegmentedControl alloc]initWithItems:@[@"消息",@"电话"]];
    segmentC.width=120;
    segmentC.selectedSegmentIndex=0;
    
    self.navigationItem.titleView=segmentC;
    //搜索栏
    UISearchBar *sB=[[UISearchBar alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,44)];
    [sB setPlaceholder:@"搜索"];
    
    [self.tableView addSubview:sB];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

@end
