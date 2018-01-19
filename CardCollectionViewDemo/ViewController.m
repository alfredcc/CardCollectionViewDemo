//
//  ViewController.m
//  CardCollectionViewDemo
//
//  Created by race on 18/01/2018.
//  Copyright © 2018 race. All rights reserved.
//

#import "ViewController.h"
#import "CardCell.h"
#import "CarouselFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet CarouselFlowLayout *carouselFlowLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 停止滚动后到 proposedContentOffset 的速率
    self.collectionView.decelerationRate = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CardCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}


@end
