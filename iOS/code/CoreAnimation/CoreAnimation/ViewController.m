//
//  ViewController.m
//  CoreAnimation
//
//  Created by wtw on 2019/1/7.
//  Copyright © 2019 wtw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 320, 568)];
    v.backgroundColor = [UIColor greenColor];
    [self.view addSubview:v];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [v addSubview:redView];
    
//    redView.layer.borderColor = [UIColor yellowColor].CGColor;
//    redView.layer.borderWidth = 20;
    
//    redView.layer.shadowOffset = CGSizeMake(20, 20);
    redView.layer.shadowColor = [UIColor whiteColor].CGColor;
    redView.layer.shadowRadius = 20;
    redView.layer.shadowOpacity = 1;
    
    CGMutablePathRef refPath = CGPathCreateMutable();
    CGPathAddRect(refPath, NULL, CGRectMake(0, 0, 150, 150));
    redView.layer.shadowPath = refPath;
    CGPathRelease(refPath);

    
    CALayer *masklayer = [CALayer layer];
    masklayer.frame = CGRectMake(0, 0, 80, 80);
    
    
    v.layer.cornerRadius  = 20;
    v.layer.masksToBounds = YES;
    
    
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    NSLog(@"\n scale == %f \n nativeScale == %f \n bounds == %@  \n nativeBounds == %@", [UIScreen mainScreen].scale,[UIScreen mainScreen].nativeScale , NSStringFromCGRect([UIScreen mainScreen].bounds), NSStringFromCGRect([UIScreen mainScreen].nativeBounds));
    
    
    
    
    //x max 414 896
    /*
     scale == 3.000000
     nativeScale == 3.000000
     bounds == {{0, 0}, {414, 896}}
     nativeBounds == {{0, 0}, {1242, 2688}}
     */
    
    //se 320 568
    /*
     scale == 2.000000
     nativeScale == 2.000000
     bounds == {{0, 0}, {320, 568}}
     nativeBounds == {{0, 0}, {640, 1136}}
     */
    
}


@end
