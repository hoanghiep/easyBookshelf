//
//  BooksViewController.m
//  comic
//
//  Created by Tran Hoang Hiep on 11/2/13.
//  Copyright (c) 2013 Tran Hoang Hiep. All rights reserved.
//

#define CELL_IDENTIFIER @"CELL_IDENTIFIER"
#define TOTAL_ITEMS_IN_CELL 3

#import "BooksViewController.h"

@interface BooksViewController ()

//@property(nonatomic, retain) UITapGestureRecognizer *singleBookTap;
@end

@implementation BooksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Manga";
    }
    return self;
}

-(void)loadView{
    [super loadView];
    self.tableView = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStylePlain];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.view = self.tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self loadData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

#pragma mark - public

-(void)loadData{
    self.books = [[NSMutableArray alloc] init];
    for(int i = 0; i < 28; i++){
        [self.books addObject:[NSString stringWithFormat:@"BOOK %d",i]];
    }
}

#pragma mark - tableview

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.books numbersOfRangeWith:TOTAL_ITEMS_IN_CELL];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier;
    if(indexPath.row + 1 == [self.books numbersOfRangeWith:TOTAL_ITEMS_IN_CELL]){
        identifier = @"LAST";
    }
    else{
        identifier = CELL_IDENTIFIER;
    }
    BooksCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[BooksCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSMutableArray *groupBooks =  [self.books arrayInRange:indexPath.row withLength:TOTAL_ITEMS_IN_CELL];
    if([groupBooks count] > 0){
        
        float margin = (cell.bounds.size.width - [groupBooks count] * BOOK_WITH)/([groupBooks count] + 1);
        UIView *view;
        NSInteger tag;
        UITapGestureRecognizer *singleBookTap;
        
        for(int i = 0; i < [groupBooks count]; i++){
            view = [[UIView alloc] initWithFrame:CGRectMake(margin * (i+1) + i * BOOK_WITH, 3, BOOK_WITH, BOOK_HEIGHT)];
            if([groupBooks objectAtIndex:i] != [NSNull null]){
                tag = indexPath.row * TOTAL_ITEMS_IN_CELL + i;
                view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d", tag % 5]]];
                singleBookTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                action:@selector(viewBookTap:)];
                [view addGestureRecognizer:singleBookTap];
            }
            else{
                tag = -1;
                view.backgroundColor = [UIColor colorWithWhite:255 alpha:0.0f];
            }
            
            view.tag = tag;
            [cell addSubview:view];
        }
    }
    return cell;

}

#pragma mark- gesture
-(void)viewBookTap:(UITapGestureRecognizer*)sender{
    UIView *vew = sender.view;
    NSLog(@"TAP %d", vew.tag);
    ReadViewController *readBook = [[ReadViewController alloc] init];//with ...
    [self.navigationController pushViewController:readBook animated:YES];
}

@end
