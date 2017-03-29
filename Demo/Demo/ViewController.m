//
//  ViewController.m
//  Demo
//
//  Created by Trance on 2017/3/30.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import "ViewController.h"
#import "WZPageView.h"
#import "WZPageStyle.h"
#import "UIView+WZFrame.h"
@interface ViewController ()<WZPageViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: 设置UI
- (void)setupUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    // titles
    //    NSArray *titles = @[@"测试",@"小名",@"小红",@"小黄"];
    // titles
    NSArray *titles = @[@"测试",@"小名",@"小红",@"小黄",@"测试",@"魔兽世界",@"守望先锋",@"小黄",@"测试",@"魔兽世界",@"守望先锋"];
    // contollers
    NSMutableArray *childVC = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        
        if (i % 2 == 0) {
            vc.view.backgroundColor = [UIColor redColor];
        }else{
            vc.view.backgroundColor = [UIColor blueColor];
        }
        
        [childVC addObject:vc];
    }
    
    // style
    WZPageStyle *style = [[WZPageStyle alloc] init];
    CGRect frame = CGRectMake(0, 64, self.view.wz_width, self.view.wz_height);
    WZPageView *pageView = [[WZPageView alloc] initWithFrame:frame currentVc:self childVcs:childVC titles:titles style:style];
    pageView.delegate = self;
    
    [self.view addSubview:pageView];
    
}

- (void)pageView:(WZPageView *)pageView scrollIndex:(NSInteger)index{
    NSLog(@"^^^%zd",index);
}


@end
