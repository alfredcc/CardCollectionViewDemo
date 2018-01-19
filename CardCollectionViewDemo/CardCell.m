//
//  CardCellCollectionViewCell.m
//  CardCollectionViewDemo
//
//  Created by race on 19/01/2018.
//  Copyright © 2018 race. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor lightGrayColor];
}

+ (NSString *)cellIdentifier{
    return @"CardCell";
}

@end
