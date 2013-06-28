//
//  CommentCell.h
//  CellTest
//
//  Created by Joseph Lin on 6/28/13.
//  Copyright (c) 2013 Joseph Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"


@interface CommentCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *bodyLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) Comment *comment;

+ (CGFloat)heightForComment:(Comment *)comment;

@end
