//
//  ListNewsModel.h
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/30.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NewsModel;
NS_ASSUME_NONNULL_BEGIN

@interface ListNewsModel : NSObject
@property(nonatomic,strong)NSMutableArray<NewsModel*> *listNews;
-(void)appendNews:(NewsModel*) news;
-(NewsModel*)newsAt:(NSUInteger) index ;
-(NSUInteger)count;
@end

NS_ASSUME_NONNULL_END
