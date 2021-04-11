//
//  NewsTableViewCell.h
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/6/11.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@class NewsViewModel;
NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell
@property(strong,nonatomic)NewsViewModel *newsViewModel;
@property(strong,nonatomic)UILabel *authorLabel;
@property(strong,nonatomic)UILabel *titleLabel;
@property(strong,nonatomic)UILabel *sourceLabel;
@property(strong,nonatomic)UIImageView *newsImageView;
@property(strong,nonatomic)UILabel *date;

@end

NS_ASSUME_NONNULL_END
