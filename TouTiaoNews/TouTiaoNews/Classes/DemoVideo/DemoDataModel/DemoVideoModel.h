//
//  DemoVideoModel.h
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoVideoModel : NSObject


@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *avatarURL;
@property(nonatomic, copy) NSString *words;
@property(nonatomic, copy) NSString *coverImageURL;

+(DemoVideoModel *) dic2Object:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
