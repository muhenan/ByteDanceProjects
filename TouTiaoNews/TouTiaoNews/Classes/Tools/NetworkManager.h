//
//  NetworkManager.h
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/29.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NewsModel;

NS_ASSUME_NONNULL_BEGIN
typedef void(^NewsListFinishLoad)(Boolean success , NSArray<NewsModel*> *dataArray);
@interface NetworkManager : NSObject
+(instancetype)shared;
-(void)loadNews:(NewsListFinishLoad)finishBlock;
@end

NS_ASSUME_NONNULL_END
