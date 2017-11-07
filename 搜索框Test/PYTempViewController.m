//
//  代码地址: https://github.com/iphone5solo/PYSearch
//  代码地址: http://www.code4app.com/thread-11175-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//
#define KscreenW [UIScreen mainScreen].bounds.size.width
#define KscreenH [UIScreen mainScreen].bounds.size.height

#import "PYTempViewController.h"
#import "PYSearchConst.h"
#import "CustomNavigationBar.h"

@interface PYTempViewController ()<CustomNavigationBarDelegate>
{
    CustomNavigationBar *customBar;;
}

@end

@implementation PYTempViewController

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [customBar removeFromSuperview];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    
    customBar = [[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, KscreenW, 64) withTitle:@"搜索结果" withLeftBtnHidden:NO withRightBtn:YES];
    customBar.delegate = self;
    [self.view addSubview:customBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

-(void)leftBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
