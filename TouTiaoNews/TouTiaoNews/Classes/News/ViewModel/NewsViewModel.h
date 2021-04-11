//
//  NewsViewModel.h
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/6/11.
//  Copyright © 2019 梁华建. All rights reserved.
//
#import <UIKit/UIKit.h>

@class NewsModel;

NS_ASSUME_NONNULL_BEGIN

@interface NewsViewModel : NSObject

@property(strong,nonatomic)NewsModel *newsModel;

@property(strong,nonatomic)UIImageView *newsImageView;

@end

NS_ASSUME_NONNULL_END
