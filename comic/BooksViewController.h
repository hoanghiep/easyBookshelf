//
//  BooksViewController.h
//  comic
//
//  Created by Tran Hoang Hiep on 11/2/13.
//  Copyright (c) 2013 Tran Hoang Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSMutableArray+Extend.h"
#import "BooksCell.h"
#import "ReadViewController.h"
@interface BooksViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *books;
@end
