//
//  Comment.h
//  CellTest
//
//  Created by Joseph Lin on 6/28/13.
//  Copyright (c) 2013 Joseph Lin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Comment : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSDate *date;

@end
