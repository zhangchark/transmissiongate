//
//  SecondViewController.m
//  CharkTest
//
//  Created by CharkZhang on 16/5/20.
//  Copyright © 2016年 Chark. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect rt = CGRectMake(0, 65, self.view.frame.size.width, 480);
    self.avatarImageView.frame = rt;
    [self.view addSubview:self.avatarImageView];
    

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    rt = CGRectMake(100, self.view.frame.size.height - 80, 100, 50);
    btn.frame = rt;
    
    SEL action = nil;
//    self.transitioningDelegate = self;
//    action = @selector(presentClick);
    action = @selector(buttonTouchAction:);
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)buttonTouchAction:(id)sender{

    [self dismissViewControllerAnimated:YES completion:NULL];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIImageView *)avatarImageView{
    
    if (_avatarImageView) {
        return _avatarImageView;
    }
    
    _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _avatarImageView.image = [UIImage imageNamed:@"sence"];
    
    return _avatarImageView;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
