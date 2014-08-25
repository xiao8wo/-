//
//  RootViewController.m
//  点名程序
//
//  Created by apple on 14-7-6.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    NSMutableArray *_studentArray;//定义一个存名字的数组
    NSTimer *_timer;//定义一个定时器，用来控制滚动名字
}
@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)prepareStudentName
{
    //将空的数组分配空间并且将名字存入数组中
    _studentArray = [[NSMutableArray alloc]initWithObjects:@"付宝明",@"何哲",@"陈喜",@"何亚超",@"翁闻宇",@"曾龙",@"郭睿",@"张年",@"刘观磊",@"姜国喜",@"徐志斌",@"柳玉峰",@"王银",@"王青青",@"刘一才",@"黄泽金", @"李富旭",nil];
}
-(void)uiconfig
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(ChangeStudentName) userInfo:nil repeats:YES];//设置定时器
    [_timer setFireDate:[NSDate distantFuture]];//获取一个未来时间，暂停功能
    //设置当前viewController的背景颜色为浅灰色
    self.view.backgroundColor = [UIColor cyanColor];
    //设置一个label
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 300, 50)];
    lable.text = @"谁是幸运儿？";
    lable.textColor = [UIColor darkGrayColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.tag = 100;
    [self.view addSubview:lable];
    //设置一个button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 300, 300, 50);
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:button];
}
-(void)buttonClicked:(UIButton *)button
{
    //判断按钮此时是否开始，未开始的话，点击按钮将按钮上的title改变成暂停
    if ([button.titleLabel.text isEqualToString:@"开始"]) {
        [button setTitle:@"暂停" forState:UIControlStateNormal];
        //当点击开始时，获取一个过去时间，定时器开始
        [_timer setFireDate:[NSDate distantPast]];
    }else{
        //如果按钮已经开始，再次点击按钮实现暂停功能，title改成开始
        [button setTitle:@"开始" forState:UIControlStateNormal];
        //点击暂停时，获取一个未来时间，定时器暂停
        [_timer setFireDate:[NSDate distantFuture]];
    }
}
-(void)ChangeStudentName
{
    //获取数组元素个数
    NSInteger cnt = [_studentArray count];
    //设置一个index等于数组中随机的数的索引
    NSInteger index = arc4random()%cnt;
    //定义一个label来获取上面定义的label
    UILabel *label = (UILabel *)[self.view viewWithTag:100];
    //将屏幕要显示的文本改成由定时器随机生成的数组中的元素
    label.text = [_studentArray objectAtIndex:index];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self prepareStudentName];
    [self uiconfig];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
