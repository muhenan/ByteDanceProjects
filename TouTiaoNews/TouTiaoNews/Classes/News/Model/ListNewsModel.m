//
//  ListNewsModel.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/30.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "ListNewsModel.h"

@implementation ListNewsModel

-(instancetype)init{
    self = [super init];
    if (self){
        
        self.listNews = [[NSMutableArray alloc] init];
    }
    return self;
}
//MARK: - 封装类似数组的容器便利操作
///添加NewsModel进入ListNewsModel，
-(void)appendNews:(NewsModel*) news{
    [_listNews addObject:news];
}

///获取对应index的NewsModel
-(NewsModel*)newsAt:(NSUInteger) index {
    if (index >=0 && index < _listNews.count)
    {
        return [_listNews objectAtIndex:index];
    }
    return nil;
}

-(NSUInteger)count{
    return _listNews.count;
}

@end
