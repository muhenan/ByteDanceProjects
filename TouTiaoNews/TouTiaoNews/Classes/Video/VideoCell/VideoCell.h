//
//  VideoCell.h
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/7/3.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@class VideoCell;
@protocol VideoCellDelegate <NSObject>

-(void)CellVideoDidStartToPlay:(VideoCell *_Nullable)cell;  // video cell 这个代理中只有这一个函数，就是这个cell的视频要播放

@end
NS_ASSUME_NONNULL_BEGIN

@interface VideoCell : UICollectionViewCell
@property(nonatomic,copy)NSString *videoUrl;    // 视频的url
@property(nonatomic,assign)CGRect videoFrame;   // 视频的frame
@property(nonatomic,strong)VideoModel *videoModel;  // 视频的 model
@property(nonatomic,weak)id<VideoCellDelegate> cellDelegate;    // cell的代理
-(void)destroyPlayer;   // 销毁控制器
@end

NS_ASSUME_NONNULL_END
