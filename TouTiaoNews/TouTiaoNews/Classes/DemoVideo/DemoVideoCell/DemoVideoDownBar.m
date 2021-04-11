//
//  DemoVideoDownBar.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import "DemoVideoDownBar.h"

@interface DemoVideoDownBar()

//评论，赞，分享，收藏
@property (nonatomic, strong, readwrite) UIImageView *commentImageView;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;

@property (nonatomic, strong, readwrite) UIImageView *likeImageView;
@property (nonatomic, strong, readwrite) UILabel *likeLabel;

@property (nonatomic, strong, readwrite) UIImageView *shareImageView;
@property (nonatomic, strong, readwrite) UILabel *shareLabel;

@property (nonatomic, strong, readwrite) UIImageView *favoriteImageView;
@property (nonatomic, strong, readwrite) UILabel *favoriteLabel;

@end

@implementation DemoVideoDownBar

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
        
        int shiftToLeft = 80;
        
        _shareImageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/4 * 1 - shiftToLeft, frame.size.height/2 - 8.5, 17, 17)];
        _shareImageView.image = [UIImage imageNamed:@"share"];
        [self addSubview:_shareImageView];
        
        _shareLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width/4 * 1 - shiftToLeft + 20, frame.size.height/2 - 8.5, 30, 17)];
        _shareLabel.font = [UIFont systemFontOfSize:12];
        _shareLabel.textColor = [UIColor blackColor];
        _shareLabel.text = @"分享";
        [self addSubview:_shareLabel];
        
        _favoriteImageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/4 * 2 - shiftToLeft, frame.size.height/2 - 8.5, 17, 17)];
        _favoriteImageView.image = [UIImage imageNamed:@"favorite"];
        [self addSubview:_favoriteImageView];

        _favoriteLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width/4 * 2 - shiftToLeft + 20, frame.size.height/2 - 8.5, 30, 17)];
        _favoriteLabel.font = [UIFont systemFontOfSize:12];
        _favoriteLabel.textColor = [UIColor blackColor];
        _favoriteLabel.text = @"收藏";
        [self addSubview:_favoriteLabel];
        
        _commentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/4 * 3 - shiftToLeft, frame.size.height/2 - 8.5, 17, 17)];
        _commentImageView.image = [UIImage imageNamed:@"comment"];
        [self addSubview:_commentImageView];

        _commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width/4 * 3 - shiftToLeft + 20, frame.size.height/2 - 8.5, 30, 17)];
        _commentLabel.font = [UIFont systemFontOfSize:12];
        _commentLabel.textColor = [UIColor blackColor];
        _commentLabel.text = @"评论";
        [self addSubview:_commentLabel];
        
        _likeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/4 * 4 - shiftToLeft, frame.size.height/2 - 8.5, 17, 17)];
        _likeImageView.image = [UIImage imageNamed:@"like"];
        [self addSubview:_likeImageView];

        _likeLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width/4 * 4 - shiftToLeft + 20, frame.size.height/2 - 8.5, 30, 17)];
        _likeLabel.font = [UIFont systemFontOfSize:12];
        _likeLabel.textColor = [UIColor blackColor];
        _likeLabel.text = @"点赞";
        [self addSubview:_likeLabel];

        
        
    }
    return self;
}

@end
