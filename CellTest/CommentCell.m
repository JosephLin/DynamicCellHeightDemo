//
//  CommentCell.m
//  CellTest
//
//  Created by Joseph Lin on 6/28/13.
//  Copyright (c) 2013 Joseph Lin. All rights reserved.
//

#import "CommentCell.h"


@implementation CommentCell

- (void)setComment:(Comment *)comment
{
    _comment = comment;
    self.nameLabel.text = comment.name;
    self.bodyLabel.text = comment.body;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = NSDateFormatterFullStyle;
    formatter.timeStyle = NSDateFormatterFullStyle;
    self.dateLabel.text = [formatter stringFromDate:comment.date];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForComment:(Comment *)comment
{
    static CommentCell *sharedCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UINib *nib = [UINib nibWithNibName:@"CommentCell" bundle:nil];
        sharedCell = [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
    });
    
    sharedCell.comment = comment;
    [sharedCell setNeedsUpdateConstraints];
    [sharedCell setNeedsLayout];
    CGSize size = [sharedCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    NSLog(@"size: %@", NSStringFromCGSize(size));
    return size.height;
}

@end
