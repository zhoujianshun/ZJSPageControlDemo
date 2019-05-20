//
//  ViewController.m
//  ZJSPageControlDemo
//
//  Created by 周建顺 on 2019/5/20.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import "ViewController.h"

#import "ZJSBarPageControl.h"

@interface ViewController ()

@property (nonatomic, strong) ZJSBarPageControl *pageControl1;

@property (nonatomic, strong) ZJSBarPageControl *pageControl2;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZJSBarPageControl *pageControl1 = [[ZJSBarPageControl alloc] init];
    pageControl1.frame = CGRectMake(20, 200, 200, 20);
    pageControl1.numberOfPages = 6;
    pageControl1.currentPage = 4;
    pageControl1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pageControl1];

    ZJSBarPageControl *pageControl2 = [[ZJSBarPageControl alloc] init];
    pageControl2.numberOfPages = 7;
    pageControl2.hidesForSinglePage = YES;
    pageControl2.backgroundColor = [UIColor lightGrayColor];
    pageControl2.translatesAutoresizingMaskIntoConstraints = NO;
    pageControl2.pageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:pageControl2];
    
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:pageControl2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f];
    
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:pageControl2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0.f];
    
    [self.view addConstraints:@[c1, c2]];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        pageControl2.numberOfPages = 20;
        pageControl1.numberOfPages = 7;
//        if (pageControl1.currentPage + 0.1 <= pageControl1.numberOfPages - 1) {
//            pageControl1.currentPage =  pageControl1.currentPage + 0.1;
//        }else{
//            pageControl1.currentPage = 0;
//        }
//        if (pageControl2.currentPage + 0.1 <= pageControl2.numberOfPages - 1) {
//            pageControl2.currentPage =  pageControl2.currentPage + 0.1;
//        }else{
//            pageControl2.currentPage = 0;
//        }
    }];
}


@end
