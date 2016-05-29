//
//  ViewController.m
//  CharkTest
//
//  Created by CharkZhang on 16/5/20.
//  Copyright © 2016年 Chark. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "PushTransition.h"
#import "PresentTransition.h"
#import "DrawRectTestView.h"

@interface ViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic,strong) DrawRectTestView *drawView;

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect rt = CGRectMake(0, 65, 100, 100);
    self.sourceImageView.frame = rt;
    [self.view addSubview:self.sourceImageView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    rt = CGRectMake(100, 200, 100, 40);
    btn.frame = rt;

    SEL action = nil;
    
//    self.transitioningDelegate = self;
//    action = @selector(presentClick);
    action = @selector(buttonTouchAction:);

    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    
    rt = CGRectMake(20, 260, self.view.frame.size.width - 40, self.view.frame.size.height - 300);
    self.drawView.frame = rt;
    self.drawView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.drawView];
}

- (void)buttonTouchAction:(id)sender{
    
    SecondViewController *ctl = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:ctl animated:YES];

}

-(void)presentClick{
    SecondViewController * secondVC = [[SecondViewController alloc] init];
    secondVC.transitioningDelegate = self; // 必须second同样设置delegate才有动画
    [self presentViewController:secondVC animated:YES completion:^{
    }];
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        return [[PushTransition alloc] init];
    }else{
        return nil;
    }
    
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[PresentTransition alloc] init];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImageView *)sourceImageView{
    
    if (_sourceImageView) {
        return _sourceImageView;
    }
    
    _sourceImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _sourceImageView.image = [UIImage imageNamed:@"kaifu"];
    
    return _sourceImageView;
}

-(DrawRectTestView *)drawView{
    if (_drawView) {
        return _drawView;
    }
    
    _drawView = [[DrawRectTestView alloc] initWithFrame:CGRectZero];

    return _drawView;
}

@end
