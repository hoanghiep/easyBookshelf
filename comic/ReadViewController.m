//
//  ReadViewController.m
//  comic
//
//  Created by Tran Hoang Hiep on 11/3/13.
//  Copyright (c) 2013 Tran Hoang Hiep. All rights reserved.
//

#import "ReadViewController.h"

@interface ReadViewController ()

@end

@implementation ReadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    [super loadView];
    [self loadData];
    self.currentPage = 0;
    UIImage *image = [UIImage imageNamed:[self.pages objectAtIndex:self.currentPage]];
    self.imageView = [[UIImageView alloc] initWithFrame:[self.view bounds]];
    self.imageView.clipsToBounds = YES;
    self.imageView.image = image;
    self.scrollView = [[UIScrollView alloc] init];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = [self.imageView bounds].size;
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 100.0;
    self.view = self.scrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - scrollview
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return  self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    UIView* zoomView = [scrollView.delegate viewForZoomingInScrollView:scrollView];
    CGRect zvf = zoomView.frame;
    if(zvf.size.width < scrollView.bounds.size.width)
    {
        zvf.origin.x = (scrollView.bounds.size.width - zvf.size.width) / 2.0;
    }
    else
    {
        zvf.origin.x = 0.0;
    }
    if(zvf.size.height < scrollView.bounds.size.height)
    {
        zvf.origin.y = (scrollView.bounds.size.height - zvf.size.height) / 2.0;
    }
    else
    {
        zvf.origin.y = 0.0;
    }
    zoomView.frame = zvf;
}

#pragma mark - public

-(void)loadData{
    self.pages = [[NSMutableArray alloc] initWithArray:@[@"p1.png",@"p2.png"]];
}

@end
