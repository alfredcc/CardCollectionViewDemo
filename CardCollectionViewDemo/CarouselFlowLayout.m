//
//  CarouselFlowLayout.m
//  CardCollectionViewDemo
//
//  Created by race on 18/01/2018.
//  Copyright © 2018 race. All rights reserved.
//

#import "CarouselFlowLayout.h"

static const CGFloat kCellSpacing = 10.0f;
static const CGFloat kCellWidth = 300.0f;
static const CGFloat kCellHeight = 200.0f;

@implementation CarouselFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = kCellSpacing;
    CGFloat sectionInset = (self.collectionView.frame.size.width - kCellWidth) / 2;
    self.sectionInset = UIEdgeInsetsMake(0, sectionInset, 0, sectionInset);
    self.itemSize = CGSizeMake(kCellWidth, kCellHeight);
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *superAttributes = [super layoutAttributesForElementsInRect:rect];
    NSArray *attributes = [[NSArray alloc] initWithArray:superAttributes copyItems:YES];
    
    CGRect visibleRect = CGRectMake(self.collectionView.contentOffset.x,
                                    self.collectionView.contentOffset.y,
                                    self.collectionView.frame.size.width,
                                    self.collectionView.frame.size.height);
    CGFloat offset = CGRectGetMidX(visibleRect);
    
    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attribute, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat distance = offset - attribute.center.x;
        CGFloat scaleForDistance = distance / self.itemSize.width;
        CGFloat scaleForCell = 1 + 0.1 * (1 - fabs(scaleForDistance));
        // Y轴方向缩放
        attribute.transform3D =  CATransform3DMakeScale(1, scaleForCell, 1);
        //渐变
        CGFloat scaleForAlpha = 1 - fabs(scaleForDistance) * 0.6;
        
        attribute.alpha = scaleForAlpha;
    }];
    
    return attributes;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    if (proposedContentOffset.x > (self.previousOffsetX + self.itemSize.width / 3.0)) {
        self.previousOffsetX += self.itemSize.width + kCellSpacing;
        if ([self.delegate respondsToSelector:@selector(scrollToPageIndex:)]) {
            [self.delegate scrollToPageIndex:self.currentPage];
        }
    } else if (proposedContentOffset.x < (self.previousOffsetX - self.itemSize.width / 3.0)) {
        self.previousOffsetX -= self.itemSize.width + kCellSpacing;
        if ([self.delegate respondsToSelector:@selector(scrollToPageIndex:)]) {
            [self.delegate scrollToPageIndex:self.currentPage];
        }
    }
    self.currentPage = self.previousOffsetX / (kCellWidth+kCellSpacing);
    
    //将当前cell移动到屏幕中间位置
    proposedContentOffset.x = self.previousOffsetX;
    return proposedContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
