//
//  CropImageViewControlloer.m
//  CharkTest
//
//  Created by CharkZhang on 16/5/21.
//  Copyright © 2016年 Chark. All rights reserved.
//

#import "CropImageViewControlloer.h"

@interface CropImageViewControlloer ()

@property (nonatomic, retain) UIImageView * sourceImageView;
@property (nonatomic, retain) UIImageView * cropImageView;

@end

@implementation CropImageViewControlloer

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    CGRect rt = CGRectMake(0, 65, 100, 100);
//    self.sourceImageView.frame = rt;
    [self.view addSubview:self.sourceImageView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    CGRect rt = CGRectMake(self.sourceImageView.frame.size.width + 20 , 200, 100, 40);
    btn.frame = rt;
    
    SEL action = nil;
    action = @selector(buttonTouchAction:);
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];


}

- (void)buttonTouchAction:(id)sender{
    
    UIImage *cropImg  = [self cropImg];
    CGRect rt = CGRectMake(50, self.sourceImageView.frame.origin.y + self.sourceImageView.frame.size.height + 5, cropImg.size.width, cropImg.size.height);
    self.cropImageView.image = cropImg;
    self.cropImageView.frame = rt;

}

- (UIImage *)cropImg{
    UIImage *img = nil;
    
    UIImage *srcimg = [UIImage imageNamed:@"kaifu"];
    NSLog(@"image width = %f,height = %f",srcimg.size.width,srcimg.size.height);

    CGRect rect =  CGRectMake(0, 0, 150, 150);
    CGImageRef cgimg = CGImageCreateWithImageInRect([srcimg CGImage], rect);
    img = [UIImage imageWithCGImage:cgimg];
    CGImageRelease(cgimg);//用完一定要释放，否则内存泄露

    return img;
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
    UIImage *img = [UIImage imageNamed:@"kaifu"];
    _sourceImageView.image = img;
    _sourceImageView.frame = CGRectMake(0, 5, img.size.width, img.size.height);

    return _sourceImageView;
}

-(UIImageView *)cropImageView{
    
    if (_cropImageView) {
        return _cropImageView;
    }
    
    _cropImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
//    UIImage *img = [UIImage imageNamed:@"kaifu"];
//    _crop ImageView.image = img;
//    _crop ImageView.frame = CGRectMake(0, 64, img.size.width, img.size.height);
    [self.view addSubview:_cropImageView];

    return _cropImageView;
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
