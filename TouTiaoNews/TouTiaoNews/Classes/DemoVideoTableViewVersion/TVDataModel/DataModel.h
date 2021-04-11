//
//  DataModel.h
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface DataModel : NSObject

@end


#pragma mark VVideoModel
@interface VVideoModel : NSObject


@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *avatarURL;
@property(nonatomic, copy) NSString *words;
@property(nonatomic, copy) NSString *coverImageURL;


@end


#pragma mark VVideoModelArray
@interface VVideoModelArray : NSObject

@property(strong, nonatomic) NSMutableArray<VVideoModel *>* models;

@end

#pragma mark DicToModelArrayTool
@interface DicToModelArrayTool : NSObject

+(VVideoModelArray *)dic2Object:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
