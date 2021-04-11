//
//  UpBar.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import "UpBar.h"
#import "DataModel.h"

@interface UpBar()

@property (nonatomic, strong, readwrite) UILabel *wordsLabel; // 用户发动态配的文案
@property (nonatomic, strong, readwrite) UILabel *nameLabel; // 用户名
@property (nonatomic, strong, readwrite) UIImageView *iconImageView; // 用户头像
@property (nonatomic, strong, readwrite) UIButton *followButton; // 关注的按钮
@property (nonatomic, strong, readwrite) UIButton *otherButton; // 三点的按钮

@end

@implementation UpBar


//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//            self.backgroundColor = [UIColor whiteColor];
//
//            int shiftFromUp = 30;
//
//            _otherButton = [[UIButton alloc]initWithFrame:CGRectMake((342.0/375.0) * frame.size.width, shiftFromUp - 12/2, 17, 12)];
//            [_otherButton setImage:[UIImage imageNamed:@"dislike"] forState:0];
//            [_otherButton addTarget:self action:@selector(clickOtherButton:) forControlEvents:UIControlEventTouchUpInside];
//
//            [self addSubview:_otherButton];
//
//            _followButton = [[UIButton alloc]initWithFrame:CGRectMake((298.0/375.0) * frame.size.width, shiftFromUp - 14/2, 28, 14)];
//            [_followButton setImage:[UIImage imageNamed:@"follow"] forState:0];
//            [_followButton addTarget:self action:@selector(clickFollowButton:) forControlEvents:UIControlEventTouchUpInside];
//
//            [self addSubview:_followButton];
//
//            _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake((16.0/375.0) * frame.size.width, shiftFromUp - 24/2, 24, 24)];
//
//            [self addSubview:_iconImageView];
//
//            _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake((48.0/375.0) * frame.size.width, shiftFromUp - 16/2, 80, 16)];
//            _nameLabel.font = [UIFont systemFontOfSize:14];
//
//            [self addSubview:_nameLabel];
//
//            /*
//             问题：label中文字顶部对齐显示
//             （默认是从中间开始显示的）
//             */
//            _wordsLabel = [[UILabel alloc] initWithFrame:CGRectMake((16.0/375.0) * frame.size.width, shiftFromUp - 10, (343.0/375.0) * frame.size.width, 100)];
//            _wordsLabel.font = [UIFont systemFontOfSize:16];
//            [_wordsLabel setNumberOfLines:0];
//
//            [self addSubview:_wordsLabel];
//    }
//    return self;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _otherButton = [[UIButton alloc]init];
        [_otherButton setImage:[UIImage imageNamed:@"dislike"] forState:0];
        [_otherButton addTarget:self action:@selector(clickOtherButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_otherButton];
        
        _followButton = [[UIButton alloc]init];
        [_followButton setImage:[UIImage imageNamed:@"follow"] forState:0];
        [_followButton addTarget:self action:@selector(clickFollowButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_followButton];
        
        _iconImageView = [[UIImageView alloc]init];
        [self addSubview:_iconImageView];
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_nameLabel];
        
        /*
         问题：label中文字顶部对齐显示
         （默认是从中间开始显示的）
         */
        _wordsLabel = [[UILabel alloc] init];
        _wordsLabel.font = [UIFont systemFontOfSize:16];
        [_wordsLabel setNumberOfLines:0];
        [self addSubview:_wordsLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"up bar layout subviews");
    
    int shiftFromUp = 30;
    _otherButton.frame = CGRectMake((342.0/375.0) * self.frame.size.width, shiftFromUp - 12/2, 17, 12);
    _followButton.frame = CGRectMake((298.0/375.0) * self.frame.size.width, shiftFromUp - 14/2, 28, 14);
    _iconImageView.frame = CGRectMake((16.0/375.0) * self.frame.size.width, shiftFromUp - 24/2, 24, 24);
    _nameLabel.frame = CGRectMake((48.0/375.0) * self.frame.size.width, shiftFromUp - 16/2, 80, 16);
    _wordsLabel.frame = CGRectMake((16.0/375.0) * self.frame.size.width, shiftFromUp - 10, (343.0/375.0) * self.frame.size.width, 100);
}

- (void)renderWithModel:(VVideoModel *)model{
    _iconImageView.image = [UIImage imageNamed:model.avatarURL];
    _nameLabel.text = model.name;
    _wordsLabel.text = model.words;
}

// 点击三点，触发函数
-(void) clickOtherButton:(UIButton *) button{
    NSLog(@"click other button");
    self.clickCallBackBlock();
}

// 点击关注，触发函数
-(void) clickFollowButton:(UIButton *) button{
    NSLog(@"click follow button");
}


@end
