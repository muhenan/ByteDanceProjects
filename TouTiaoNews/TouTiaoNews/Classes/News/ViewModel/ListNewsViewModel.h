//
//  ListNewsViewModel.h
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/6/11.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class NewsViewModel;
@interface ListNewsViewModel : NSObject
@property(strong,nonatomic)NSMutableArray<NewsViewModel*> *listNews;
@end

NS_ASSUME_NONNULL_END
