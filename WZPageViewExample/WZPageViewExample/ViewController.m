//
//  ViewController.m
//  WZPageViewExample
//
//  Created by Trance on 2017/3/30.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import "ViewController.h"
#import "WZPageView.h"
@interface ViewController ()<WZPageContainerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
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
    WZPageContainerView *pageContaioner = [[WZPageContainerView alloc] initWithFrame:frame currentVc:self childVcs:childVC titles:titles style:style];
    pageContaioner.delegate = self;
    
    [self.view addSubview:pageContaioner];
    
}

- (void)containerView:(WZPageContainerView *)containerView didScrollIndex:(NSInteger)index{
    NSLog(@"%zd",index);
}


@end
