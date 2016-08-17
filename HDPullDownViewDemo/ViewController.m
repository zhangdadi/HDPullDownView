//
//  ViewController.m
//  HDPullDownViewDemo
//
//  Created by 张达棣 on 16/8/17.
//  Copyright © 2016年 张达棣. All rights reserved.
//

#import "ViewController.h"
#import "YMPullView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YMPullView *pullView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"演示";
    
    NSMutableArray *pullItemArray = [NSMutableArray array];

    //初始化第一个view
    {
        YMPullViewModel *model = [[YMPullViewModel alloc] init];
        model.title = @"规格";
        model.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
        model.view.backgroundColor = [UIColor redColor];
        [pullItemArray addObject:model];
    }
    
    //初始化第二个view
    {
        YMPullViewModel *model = [[YMPullViewModel alloc] init];
        model.title = @"栽植方式";
        model.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        model.view.backgroundColor = [UIColor yellowColor];
        [pullItemArray addObject:model];
    }

    //初始化第三个view
    {
        YMPullViewModel *model = [[YMPullViewModel alloc] init];
        model.title = @"苗源地";
        model.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
        model.view.backgroundColor = [UIColor greenColor];
        [pullItemArray addObject:model];
    }
    
    //赋值
    _pullView.itemArray = (NSArray<YMPullViewModel> *)pullItemArray;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
