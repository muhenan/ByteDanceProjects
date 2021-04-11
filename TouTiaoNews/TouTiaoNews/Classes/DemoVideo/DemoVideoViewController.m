//
//  DemoVideoViewController.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import "DemoVideoViewController.h"
#import "DemoVideoCellCollectionViewCell.h"
#import "DemoVIdeoCellCollectionViewCellVertical.h"

@interface DemoVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation DemoVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    //flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, 349);
    flowLayout.estimatedItemSize = CGSizeMake(self.view.bounds.size.width, 613);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[DemoVideoCellCollectionViewCell class] forCellWithReuseIdentifier:@"DemoVideoCellCollectionViewCell"];
    [collectionView registerClass:[DemoVIdeoCellCollectionViewCellVertical class] forCellWithReuseIdentifier:@"DemoVideoCellCollectionViewCellVertical"];
    
    [self.view addSubview:collectionView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    
    int value = arc4random() % 10;
    NSLog(@"random value is %d" ,value);
    if(value < 5){
        DemoVIdeoCellCollectionViewCellVertical * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DemoVideoCellCollectionViewCellVertical" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor greenColor];
        return cell;
    }else{
        DemoVideoCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DemoVideoCellCollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor greenColor];
        return cell;
    }
    
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
//
//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}

//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}

//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}

//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}

//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
