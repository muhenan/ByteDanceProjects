//
//  DemoVideoModel.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import "DemoVideoModel.h"

@interface DemoVideoModel()

@end

@implementation DemoVideoModel

+(DemoVideoModel *) dic2Object:(NSDictionary *)dic{
    DemoVideoModel * result = [[DemoVideoModel alloc]init];
    result.name = dic[@"name"];
    result.avatarURL = dic[@"avatarURL"];
    result.words = dic[@"words"];
    result.coverImageURL = dic[@"coverImageURL"];
    
    return result;
}

@end
