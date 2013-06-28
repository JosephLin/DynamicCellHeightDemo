//
//  RootViewController.m
//  CellTest
//
//  Created by Joseph Lin on 6/28/13.
//  Copyright (c) 2013 Joseph Lin. All rights reserved.
//

#import "RootViewController.h"
#import "CommentCell.h"


@interface RootViewController ()
@property (nonatomic, strong) NSMutableArray *comments;
@end


@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.comments = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        Comment *comment = [Comment new];
        comment.name = @"Joseph Lin";
        
        NSMutableString *body = [NSMutableString new];
        for (int j = 0; j < i * 5; j++) {
            [body appendString:@"comment... "];
        }
        comment.body = body;
        comment.date = [NSDate date];
        
        [self.comments addObject:comment];
    }
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"CommentCell"];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];

}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.comments count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Comment *comment = self.comments[indexPath.row];
    CGFloat height = [CommentCell heightForComment:comment];
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];

    Comment *comment = self.comments[indexPath.row];
    cell.comment = comment;
    
    return cell;
}


@end
