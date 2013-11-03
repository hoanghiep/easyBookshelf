//
//  ReadViewController.h
//  comic
//
//  Created by Tran Hoang Hiep on 11/3/13.
//  Copyright (c) 2013 Tran Hoang Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) NSMutableArray *pages;
@property(nonatomic, assign) NSInteger currentPage;

@end
