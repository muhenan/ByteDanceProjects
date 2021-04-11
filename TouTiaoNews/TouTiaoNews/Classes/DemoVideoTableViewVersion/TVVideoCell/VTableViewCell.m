//
//  VTableViewCell.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import "VTableViewCell.h"
#import "UpBar.h"
#import "DownBar.h"

@interface VTableViewCell()

@property (nonatomic, copy, readwrite) DownBar *downBar; // 底部的工具栏
@property (nonatomic, strong, readwrite) UpBar *upBar; // 顶部的工具栏
@property (nonatomic, strong, readwrite) UIImageView *coverView; // 封面图
@property (nonatomic, strong, readwrite) UIImageView *playButton; // 播放按钮

@end

@implementation VTableViewCell

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        NSLog(@"cell 初始化");
//    }
//    return self;
//}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    NSLog(@"cell init with frame");
//    self = [super initWithFrame:frame];
//    if (self) {
//
//        _upBar = [[UpBar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 90)];
//        [self addSubview:_upBar];
//
//
//        int wide = _upBar.frame.size.width;
//        _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _upBar.bounds.size.height, wide, 211)];
//        //_coverView.image = [UIImage imageNamed:model.coverImageURL];
//
//        int sizeOfPlayButton = 48;
//        _playButton = [[UIImageView alloc]initWithFrame:CGRectMake(wide/2 - sizeOfPlayButton/2, _upBar.bounds.size.height + _coverView.bounds.size.height/2 - sizeOfPlayButton/2, sizeOfPlayButton, sizeOfPlayButton)];
//        _playButton.image = [UIImage imageNamed:@"play"];
//        [self addSubview:_coverView];
//        [self addSubview:_playButton];
//
//        _downBar = [[DownBar alloc] initWithFrame:CGRectMake(0, 90 + 211, wide, 48)];
//        [self addSubview:_downBar];
//    }
//    return self;
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        NSLog(@"cell init with style");
        _upBar = [[UpBar alloc]init];
        _coverView = [[UIImageView alloc] init];
        _playButton = [[UIImageView alloc]init];
        _playButton.image = [UIImage imageNamed:@"play"];
        _downBar = [[DownBar alloc]init];
    }
    
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"heng cell lay out Subview");
    _upBar.frame = CGRectMake(0, 0, self.frame.size.width, 90);
    
    int wide = _upBar.frame.size.width;
    _coverView.frame = CGRectMake(0, _upBar.bounds.size.height, wide, 211);
    
    int sizeOfPlayButton = 48;
    _playButton.frame = CGRectMake(wide/2 - sizeOfPlayButton/2, _upBar.bounds.size.height + _coverView.bounds.size.height/2 - sizeOfPlayButton/2, sizeOfPlayButton, sizeOfPlayButton);
    
    _downBar.frame = CGRectMake(0, 90 + 211, wide, 48);
//    [self setNeedsLayout];
//    [self layoutIfNeeded];
//    [self setNeedsDisplay];
    
    [self addSubview:_upBar];
    [self addSubview:_coverView];
    [self addSubview:_playButton];
    [self addSubview:_downBar];
}

- (void)renderWithModel:(VVideoModel *)model {
    NSLog(@"绑定数据");
    _model = model;
    [_upBar renderWithModel:model];
    _coverView.image = [UIImage imageNamed:model.coverImageURL];
    
    __weak VTableViewCell * cell = self;
    __weak VVideoModel * weakModel = _model;
    _upBar.clickCallBackBlock = ^(){
        NSLog(@"call back to heng cell");
        cell.cellCallBackBlock(weakModel);
    };
}

@end
