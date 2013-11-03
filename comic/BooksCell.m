//
//  BooksCell.m
//  comic
//
//  Created by Tran Hoang Hiep on 11/2/13.
//  Copyright (c) 2013 Tran Hoang Hiep. All rights reserved.
//
#import "BooksCell.h"

@implementation BooksCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"b"]];
        //self.layer.borderWidth = 0;
        //self.layer.borderColor = [UIColor clearColor].CGColor;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
