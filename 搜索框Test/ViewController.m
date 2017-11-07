//
//  ViewController.m
//  搜索框Test
//
//  Created by 伯驹网络 on 2017/11/6.
//  Copyright © 2017年 Nicholas. All rights reserved.
//
#define KscreenW [UIScreen mainScreen].bounds.size.width
#define KscreenH [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "PYSearch.h"
#import "PYTempViewController.h"
#import "CustomNavigationBar.h"

@interface ViewController ()<PYSearchViewControllerDelegate,CustomNavigationBarDelegate>

@end

@implementation ViewController
- (IBAction)searchAction:(id)sender {
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBarHidden = YES;
    
    CustomNavigationBar *nav = [[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, KscreenW, 64) withTitle:@"首页" withLeftBtnHidden:NO withRightBtn:NO];
    nav.delegate = self;
    nav.rightBtnType = BtnTypeSearch;
    [self.view addSubview:nav];
}

-(void)leftBtnAction:(id)sender
{
    
}

-(void)rightBtnAction:(id)sender
{
    // 1. 创建热门搜索
    NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    // 2. 创建控制器
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"搜索" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        // 开始搜索执行以下代码
        // 如：跳转到指定控制器
        [searchViewController.navigationController pushViewController:[[PYTempViewController alloc] init] animated:YES];
    }];
    // 3. 设置风格
    //        searchViewController.hotSearchStyle = PYHotSearchStyleNormalTag; // 热门搜索风格根据选择
    searchViewController.searchHistoryStyle = PYHotSearchStyleDefault; // 搜索历史风格为default
    // 5. 跳转到搜索控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav  animated:NO completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
