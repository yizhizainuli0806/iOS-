//
//  ViewController.m
//  清楚缓存
//
//  Created by 高国辉 on 16/4/7.
//  Copyright © 2016年 🈳♌️♻️➤🎄一直在努力. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    self.imageView.backgroundColor=[UIColor redColor];
    [self.view addSubview:self.imageView];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.backgroundColor=[UIColor greenColor];
    btn.frame=CGRectMake(100, 70, 100, 30);
    [btn setTitle:@"下载" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.backgroundColor=[UIColor greenColor];
    btn1.frame=CGRectMake(220, 70, 100, 30);
    [btn1 setTitle:@"清楚缓存" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clickMemory) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    

    

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)click{
    NSURL *image1=[NSURL URLWithString:@"http://s15.sinaimg.cn/middle/9914f9fdhbc6170891ebe&690"];
   // NSURL *image2=[NSURL URLWithString:@"http://s14.sinaimg.cn/middle/9914f9fdhbc611c219f3d&690"];
    //[self.imageView sd_setImageWithURL:image1];
    [self.imageView sd_setImageWithURL:image1 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"图片加载完" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        [alert show];
        
    }];
    SDWebImageManager *manager=[SDWebImageManager sharedManager];
    [manager downloadImageWithURL:image1 options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"显示当前下载进度");
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
       
   
        NSLog(@"下载完成");
        
    }];
    
}
-(void)clickMemory{
    [[SDImageCache sharedImageCache]clearDisk];
    [[SDImageCache sharedImageCache]clearMemory];
    NSLog(@"清楚缓存");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
