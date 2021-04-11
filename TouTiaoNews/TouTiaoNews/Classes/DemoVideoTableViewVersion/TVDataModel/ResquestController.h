//
//  ResquestController.h
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResquestController : NSObject


//+ (void)getContentByOffset:(NSNumber *)offset
//                    bySize:(NSNumber *)sizeOfContents;

+ (void)getContentByOffset:(NSNumber *)offset
                    bySize:(NSNumber *)sizeOfContents
              andThenBlock:(void(^)(NSDictionary *dic))block;

@end

NS_ASSUME_NONNULL_END
