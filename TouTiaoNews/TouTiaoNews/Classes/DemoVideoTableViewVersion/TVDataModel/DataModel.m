//
//  DataModel.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import "DataModel.h"


@implementation DataModel

@end

#pragma mark VVideoModel
@implementation VVideoModel

//+(VVideoModelArray *) dic2Object:(NSDictionary *)dic{
//    VVideoModel * result = [[VVideoModel alloc]init];
//    result.name = dic[@"name"];
//    result.avatarURL = dic[@"avatarURL"];
//    result.words = dic[@"words"];
//    result.coverImageURL = dic[@"coverImageURL"];
//
//    return result;
//    VVideoModelArray * result = [[VVideoModelArray alloc]init];
//
//}

@end

#pragma mark VVideoModelArray
@implementation VVideoModelArray

- (instancetype)init
{
    self = [super init];
    if (self) {
        _models = @[].mutableCopy;
    }
    return self;
}

@end

#pragma mark DicToModelArrayTool
@implementation DicToModelArrayTool

+ (VVideoModelArray *)dic2Object:(NSDictionary *)dic{
    
    
    VVideoModelArray * result = [[VVideoModelArray alloc]init];
    
    NSArray *nameArr = [[NSArray alloc] initWithArray:(NSArray *)dic[@"names"]];
    NSArray *avatarArr = [[NSArray alloc] initWithArray:(NSArray *)dic[@"avatarURLs"]];
    NSArray *wordsArr = [[NSArray alloc] initWithArray:(NSArray *)dic[@"wordss"]];
    NSArray *coverArr = [[NSArray alloc] initWithArray:(NSArray *)dic[@"coverImageURLs"]];
    
    for(int i = 0; i < 10; i++){
        
        VVideoModel* model = [[VVideoModel alloc]init];
        
        NSLog(@"%@", nameArr[i]);
        
        model.name = nameArr[i];
        model.avatarURL = avatarArr[i];
        model.words = wordsArr[i];
        model.coverImageURL = coverArr[i];
        
        [result.models addObject:model];
    }
    
    NSLog(@"count of models is %lu", (long unsigned)result.models.count);
    
    return result;
    
}

@end
