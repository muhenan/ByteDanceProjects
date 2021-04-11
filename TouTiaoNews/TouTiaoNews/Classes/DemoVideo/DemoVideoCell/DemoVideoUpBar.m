//
//  DemoVideoUpBar.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import "DemoVideoUpBar.h"


@interface DemoVideoUpBar()

@property (nonatomic, strong, readwrite) UILabel *wordsLabel; // 用户发动态配的文案
@property (nonatomic, strong, readwrite) UILabel *nameLabel; // 用户名
@property (nonatomic, strong, readwrite) UIImageView *iconImageView; // 用户头像
@property (nonatomic, strong, readwrite) UIButton *followButton; // 关注的按钮
@property (nonatomic, strong, readwrite) UIButton *otherButton; // 三点的按钮

@end

@implementation DemoVideoUpBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        int shiftFromUp = 30;
        
        _otherButton = [[UIButton alloc]initWithFrame:CGRectMake((342.0/375.0) * frame.size.width, shiftFromUp - 12/2, 17, 12)];
        [_otherButton setImage:[UIImage imageNamed:@"dislike"] forState:0];
        [_otherButton addTarget:self action:@selector(clickOtherButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_otherButton];
        
        _followButton = [[UIButton alloc]initWithFrame:CGRectMake((298.0/375.0) * frame.size.width, shiftFromUp - 14/2, 28, 14)];
        [_followButton setImage:[UIImage imageNamed:@"follow"] forState:0];
        [_followButton addTarget:self action:@selector(clickFollowButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_followButton];
        
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake((16.0/375.0) * frame.size.width, shiftFromUp - 24/2, 24, 24)];
        _iconImageView.image = [UIImage imageNamed:@"Pic"];
        
        [self addSubview:_iconImageView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake((48.0/375.0) * frame.size.width, shiftFromUp - 16/2, 80, 16)];
        _nameLabel.text = @"曲小姐";
        _nameLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_nameLabel];
        
        /*
         问题：label中文字顶部对齐显示
         （默认是从中间开始显示的）
         */
        _wordsLabel = [[UILabel alloc] initWithFrame:CGRectMake((16.0/375.0) * frame.size.width, shiftFromUp - 10, (343.0/375.0) * frame.size.width, 100)];
        _wordsLabel.text = @"假扮老广和茶楼老板聊天，老板说出虾饺好吃的惊天秘密！";
        _wordsLabel.font = [UIFont systemFontOfSize:16];
        [_wordsLabel setNumberOfLines:0];
        
        [self addSubview:_wordsLabel];
    }
    return self;
    
}

-(void) clickOtherButton:(UIButton *) button{
    NSLog(@"click other button");
}

-(void) clickFollowButton:(UIButton *) button{
    NSLog(@"click follow button");
}

@end
