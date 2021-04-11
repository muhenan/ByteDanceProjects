//
//  NewsModel.h
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/30.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsModel : NSObject
@property(nonatomic,copy)NSString *author_name;
@property(nonatomic,copy)NSString *category;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *thumbnail_pic_s;
@property(nonatomic,copy)NSString *title;
///文章的URL
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *uniquekey;
- (void)configWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
