//
//  ZJSBarPageControl.h
//  ZJSPageControlDemo
//
//  Created by 周建顺 on 2019/5/20.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJSBarPageControl : UIView

@property (nonatomic, assign) CGSize indicatorSize;
@property (nonatomic, assign) CGFloat selectIndicatorWidth;
@property (nonatomic, assign) CGFloat space;

@property(nonatomic) NSInteger numberOfPages;          // default is 0
@property(nonatomic) CGFloat currentPage;            // default is 0. value pinned to 0..numberOfPages-1
@property(nullable, nonatomic,strong) UIColor *pageIndicatorTintColor;

@property (nonatomic, assign) BOOL hidesForSinglePage;



@end

NS_ASSUME_NONNULL_END
