//
//  DemoVIdeoCellCollectionViewCellVertical.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import "DemoVIdeoCellCollectionViewCellVertical.h"
#import "DemoVideoUpBar.h"
#import "DemoVideoDownBar.h"

@interface DemoVIdeoCellCollectionViewCellVertical()

@property (nonatomic, copy, readwrite) DemoVideoDownBar *downBar; // 底部的工具栏
@property (nonatomic, copy, readwrite) DemoVideoUpBar *upBar; // 顶部的工具栏
@property (nonatomic, strong, readwrite) UIImageView *coverView; // 封面图
@property (nonatomic, strong, readwrite) UIImageView *playButton; // 播放按钮

@end

@implementation DemoVIdeoCellCollectionViewCellVertical

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _upBar = [[DemoVideoUpBar alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 90)];
        [self addSubview:_upBar];
        
        _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _upBar.bounds.size.height, frame.size.width, 475)];
        _coverView.image = [UIImage imageNamed:@"Image"];
        int sizeOfPlayButton = 48;
        _playButton = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/2 - sizeOfPlayButton/2, _upBar.bounds.size.height + _coverView.bounds.size.height/2 - sizeOfPlayButton/2, sizeOfPlayButton, sizeOfPlayButton)];
        _playButton.image = [UIImage imageNamed:@"play"];
        [self addSubview:_coverView];
        [self addSubview:_playButton];
            
        _downBar = [[DemoVideoDownBar alloc] initWithFrame:CGRectMake(0, 565, frame.size.width, 48)];
        [self addSubview:_downBar];
    }
    return self;
}


- (UICollectionViewLayoutAttributes*)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes*)layoutAttributes {

    [self setNeedsLayout];
    [self layoutIfNeeded];

    CGRect cellFrame = layoutAttributes.frame;
    cellFrame.size.height= 613;
    layoutAttributes.frame= cellFrame;

    return layoutAttributes;

}

@end
