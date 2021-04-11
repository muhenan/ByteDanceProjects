//
//  VideoCell.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/7/3.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>
#import "CLPlayerView.h"
#import "Masonry.h"
#import "CLPlayerMaskView.h"
@interface VideoCell()<CLPlayerMaskViewDelegate>
@property(nonatomic,strong)UIImageView *coverImageView ;
@property(nonatomic,strong)UIImageView *playImageView ;
@property(nonatomic,strong)AVPlayer * player;
@property(nonatomic,strong)CLPlayerMaskView *videoView;
//@property(nonatomic,strong)CLPlayerView *videoView;
@end

@implementation VideoCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setUpUI];
    }
    return self;
}

-(void)setVideoModel:(VideoModel *)videoModel
{
    _videoModel = videoModel;
    //    _videoView.url = [[NSURL alloc] initFileURLWithPath:_videoUrl];
    [_coverImageView setImage:[self getVideoPreViewImage: [[NSURL alloc] initWithString:_videoModel.videoUrl]]];
    //    [_coverImageView setImage:[UIImage imageNamed:@"coverImage"]];
    [self layoutIfNeeded];
    self.videoFrame = self.videoView.frame;
}

-(void)setVideoUrl:(NSString *)videoUrl
{
    _videoUrl = videoUrl;
//    _videoView.url = [[NSURL alloc] initFileURLWithPath:_videoUrl];
    [_coverImageView setImage:[self getVideoPreViewImage: [[NSURL alloc] initWithString:_videoUrl]]];
//    [_coverImageView setImage:[UIImage imageNamed:@"coverImage"]];
    [self layoutIfNeeded];
    self.videoFrame = self.videoView.frame;
}


-(void)setUpUI
{
    _coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _videoView = [[CLPlayerMaskView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _videoView.delegate = self;
    [_coverImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.contentView addSubview:_videoView];
    
    [self.contentView insertSubview:_coverImageView belowSubview:_videoView];
}

-(void)cl_playButtonAction:(UIButton *)button
{
    if ([_cellDelegate respondsToSelector:@selector(CellVideoDidStartToPlay:)])
    {
        [_cellDelegate CellVideoDidStartToPlay:self];
    }
}



// 获取视频第一帧
- (UIImage*) getVideoPreViewImage:(NSURL *)path
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:path options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}
//-(void)tapToPlay
//{
//    _videoView.url = [[NSURL alloc] initFileURLWithPath:_videoUrl];
//    [_videoView playVideo];
//}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self != nil)
//    {
//        _coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        _coverImageView.backgroundColor = UIColor.whiteColor;
//        _playImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 80, 80)];
//        [self setUpUI];
//    }
//    return self;
//}
//-(void)setUpUI{
////    [self.coverImageView.layer addSublayer:_playImageView.layer];
////    [self.contentView.layer addSublayer:_coverImageView.layer];
//    [self.contentView addSubview:_coverImageView];
//    [self.coverImageView addSubview :_playImageView];
//    [_coverImageView setUserInteractionEnabled:true];
//    [_playImageView setUserInteractionEnabled:true];
//    _playImageView.image = [UIImage imageNamed:@"video_play_button"];
//    _coverImageView.image = [UIImage imageNamed:@"coverImage"];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToPlay)];
//
//    [self addGestureRecognizer:tap];
//
//}

//-(void)tapToPlay
//{
//
//    NSURL *url = [[NSURL alloc] initFileURLWithPath:_videoUrl];
//
//    AVAsset *asset = [AVAsset assetWithURL:url] ;
//
//    AVPlayerItem *playItem = [[AVPlayerItem alloc] initWithAsset:asset];
//
//    _player = [[AVPlayer alloc] initWithPlayerItem:playItem];
//
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
//
//    playerLayer.frame = _coverImageView.bounds;
//
//    [_coverImageView.layer addSublayer:playerLayer];
//
//    [_player play];
//}
//
//-(void)destroyPlayer
//{
//    if (_player != nil){
//        [_player pause];
//    }
//}

@end
