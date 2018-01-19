//
//  CarouselFlowLayout.h
//  CardCollectionViewDemo
//
//  Created by race on 18/01/2018.
//  Copyright © 2018 race. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CarouselFlowLayoutDelegate <NSObject>

- (void)scrollToPageIndex:(NSInteger)index;

@end

@interface CarouselFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat previousOffsetX;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic,weak) id <CarouselFlowLayoutDelegate> delegate;

@end
