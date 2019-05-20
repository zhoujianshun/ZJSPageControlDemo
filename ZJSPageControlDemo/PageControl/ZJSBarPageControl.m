//
//  ZJSBarPageControl.m
//  ZJSPageControlDemo
//
//  Created by 周建顺 on 2019/5/20.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import "ZJSBarPageControl.h"


@interface ZJSBarPageControl()

@property (nonatomic, strong) NSMutableArray<CALayer*> *pages;


@property(nullable, nonatomic,strong) UIColor *zjs_pageIndicatorTintColor;
@property(nullable, nonatomic,strong) UIColor *zjs_currentPageIndicatorTintColor;

@end

@implementation ZJSBarPageControl

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}


-(void)commonInit{
    _indicatorSize = CGSizeMake(10, 10);
    _selectIndicatorWidth = 20;
    _currentPage = 0;
    _space = 10;
    self.backgroundColor = [UIColor clearColor];
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
    _zjs_pageIndicatorTintColor = [UIColor colorWithRed:72./255. green:155./255. blue:255./255. alpha:0.4];
    _zjs_currentPageIndicatorTintColor = [UIColor colorWithRed:72./255. green:155./255. blue:255./255. alpha:1];
//    UIPageControl
}


-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.translatesAutoresizingMaskIntoConstraints) {
        if (!CGSizeEqualToSize([self getSelfSize], self.frame.size)) {
            [self resetFrame];
        }
    }

}



//-(void)sizeToFit{
//    [super sizeToFit];
//        [self resetFrame];
//}
//
-(CGSize)sizeThatFits:(CGSize)size{
    return [self getSelfSize];
}



/**
 返回固有大小，autolayout不需要设置尺寸

 @return 固有尺寸
 */
-(CGSize)intrinsicContentSize{
    CGFloat width = (_numberOfPages -1) * self.space + (_numberOfPages - 1) * self.indicatorSize.width + self.selectIndicatorWidth;
    CGFloat heigth = self.indicatorSize.height;
    return CGSizeMake(width, heigth);
}


-(void)drawRect:(CGRect)rect{
    
    if (self.hidesForSinglePage) {
        if (_numberOfPages <= 1) {
            return;
        }
    }
    
    BOOL changeColor = self.pageIndicatorTintColor == nil;
    if(!changeColor){
        [self.pageIndicatorTintColor setFill];
    }
    
    CGFloat currentPage = self.currentPage;
    if (currentPage < 0) {
        currentPage = 0;
    }else if (currentPage >= self.numberOfPages - 1 ){
        currentPage = self.numberOfPages - 1;
    }
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.indicatorSize.width;
    CGFloat height= self.indicatorSize.height;
    for (int i = 0; i < self.numberOfPages; i++) {

        CGFloat value = currentPage  - i;
        if (value > 0 && value < 1) {
            width = self.indicatorSize.width + (self.selectIndicatorWidth - self.indicatorSize.width) * (1 - value);
            
            if(changeColor){
                [[UIColor colorWithRed:72./255. green:155./255. blue:255./255. alpha:0.4 + 0.6*(1 - value)] setFill];
            }
            
            
        }else if(value < 0 && value > -1){
            width = self.indicatorSize.width + (self.selectIndicatorWidth - self.indicatorSize.width) * (1  + value);
            
            if(changeColor){
                [[UIColor colorWithRed:72./255. green:155./255. blue:255./255. alpha:0.5 + 0.6*(1  + value)] setFill];
            }
            
        }else{
            if (i == currentPage) {
                
                width = self.selectIndicatorWidth;
                
                if(changeColor){
                    [self.zjs_currentPageIndicatorTintColor setFill];
                }
            }else{
                
                width = self.indicatorSize.width;
                
                if(changeColor){
                    [self.zjs_pageIndicatorTintColor setFill];
                }
            }
        }
        

        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x, y, width, height) cornerRadius:height/2.f];
        [path fill];
        x = x + width + self.space;
    }
    
}

#pragma mark -


/**
 重新设置frame
 */
-(void)resetFrame{
    
    if (self.translatesAutoresizingMaskIntoConstraints) {
        CGSize size = [self getSelfSize];
        self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), size.width, size.height);
    }else{
        // 调用后会调用intrinsicContentSize重新获取自身的size
        [self invalidateIntrinsicContentSize];
    }
}

-(CGSize)getSelfSize{
    CGFloat width = (_numberOfPages -1) * self.space + (_numberOfPages - 1) * self.indicatorSize.width + self.selectIndicatorWidth;
    CGFloat heigth = self.indicatorSize.height;
    return CGSizeMake(width, heigth);
}

-(void)resetHidden{
    if (_hidesForSinglePage) {
        if (_numberOfPages <= 1) {
            self.hidden = YES;
            return;
        }
    }
    
    self.hidden = NO;
}

#pragma mark -

-(void)setHidesForSinglePage:(BOOL)hidesForSinglePage{
    _hidesForSinglePage = hidesForSinglePage;
    [self resetHidden];
    
}



-(NSMutableArray *)pages{
    if (!_pages) {
        _pages = [[NSMutableArray alloc] init];
    }
    return _pages;
}

-(void)setNumberOfPages:(NSInteger)numberOfPages{
    _numberOfPages = numberOfPages;
    [self resetHidden];
    
    [self resetFrame];
    [self setNeedsDisplay];
}

-(void)setCurrentPage:(CGFloat)currentPage{
    _currentPage = currentPage;
    [self setNeedsDisplay];
}

@end
