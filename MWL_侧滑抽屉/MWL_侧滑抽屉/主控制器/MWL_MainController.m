//
//  MWL_MainController.m
//  MWL_侧滑抽屉
//
//  Created by maweilong-PC on 16/9/21.
//  Copyright © 2016年 maweilong. All rights reserved.
//

#import "MWL_MainController.h"
#import "MWL_NewsController.h"
#import "MWL_DynamicController.h"
#import "MWL_ContacterController.h"
#import "MWL_MainView.h"
#import "UIView+MWLframe.h"
#import "TestViewController.h"
@interface MWL_MainController ()
@property (nonatomic) NSInteger index;
@end

@implementation MWL_MainController


- (NSString *)name{
    if (!_name) {
        _name = @"消息";
    }
    return _name;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ///注册通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PushVC:) name:@"StartPush" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selector:) name:@"Selectindex" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Slide:) name:@"ClickSlide" object:nil];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPanEvent:)];
    [self.view addGestureRecognizer:pan];
    //   加载子控制器
    [self loadSubController];
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 手势滑动
- (void)didPanEvent:(UIPanGestureRecognizer *)recognizer{
    
    //1 获取手指拖拽时候平移的值
    CGPoint translation = [recognizer translationInView:recognizer.view];
    
    //2 让当前控件平移
    recognizer.view.transform = CGAffineTransformTranslate(recognizer.view.transform,translation.x,0);
    [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
    //3 每次平移手势识别后，让平移的值不再增加
    [recognizer setTranslation:CGPointZero inView:recognizer.view];
    
    //获取最右边范围
    CGAffineTransform rightScopeTransform = CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform, [UIScreen mainScreen].bounds.size.width * 0.75, 0);
    
    //当移动到右边极限时
    if (recognizer.view.transform.tx > rightScopeTransform.tx) {
        //限制最右边的范围
        recognizer.view.transform = rightScopeTransform;
        
        [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
        
    }else if (recognizer.view.transform.tx < 0.0){
        recognizer.view.transform = CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform, 0, 0);
        [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
    }
    
    //当手势结束时
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.2 animations:^{
           
            if (recognizer.view.transform.tx > [UIScreen mainScreen].bounds.size.width*0.5) {
                recognizer.view.transform = rightScopeTransform;
                [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
            }else{
                recognizer.view.transform = CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform, 0, 0);
                [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
            }
            
        }];
    }
    
}

//加载子控制器
-(void)loadSubController{
    
    //    消息控制器
    MWL_NewsController *news=[[MWL_NewsController alloc]init];
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:news];
    nav1.tabBarItem.title=@"消息";
    nav1.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];
    
    
    
    
    //联系人控制器
    MWL_ContacterController *contacter=[[MWL_ContacterController alloc]init];
    
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:contacter];
    
    nav2.tabBarItem.title=@"联系人";
    
    nav2.tabBarItem.image=[UIImage imageNamed:@"tab_buddy_nor"];
    
    
    
    //    动态控制器
    MWL_DynamicController *dynamic=[[MWL_DynamicController alloc]init];
    
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:dynamic];
    
    nav3.tabBarItem.title=@"动态";
    
    nav3.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];
    
    
    
    self.viewControllers=@[nav1,nav2,nav3];
    
    
    
}



#pragma mark - 通知回调
- (void)Slide:(NSNotification *)info{
    if ([info.userInfo[@"IsOpen"] isEqualToString:@"YES"]) {
        
        [UIView animateWithDuration:0.2 animations:^{
            self.view.transform = CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform, [UIScreen mainScreen].bounds.size.width * 0.75, 0);
        }];
        
        

    }else{
        [UIView animateWithDuration:0.2 animations:^{
            self.view.transform = CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform, 0, 0);
        }];
    
    }
}
- (void)selector:(NSNotification *)info{
    //self.index = [info[@"index"] integerValue];
    self.index = [info.userInfo[@"index"] integerValue];
}
- (void)PushVC:(NSNotification *)info{
    self.view.transform=CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform,0, 0);
    //    限制透明view最左边的范围
    TestViewController *VC = [[TestViewController alloc] init];
    [self.viewControllers[self.index]  pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
