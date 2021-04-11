//
//  NetworkManager.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/29.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "NetworkManager.h"
#import "ListNewsModel.h"
#import "NewsModel.h"
@interface NetworkManager()<NSCopying,NSMutableCopying>
@end
@implementation NetworkManager
static NetworkManager *network = nil;
//MARK: - 单例初始化
+(instancetype)shared{
    return [[NetworkManager alloc] init];
}
-(instancetype)init
{
    if (network == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            network = [super init];
        });
    }
    return network;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        network = [super allocWithZone:zone];
    });
    return network;
}
-(id)copyWithZone:(NSZone *)zone
{
    return network;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return network;
}

-(void)loadNews:(NewsListFinishLoad) finishBlock{

    NSString *url = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc]initWithString:url]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
       id jsonObj = [NSJSONSerialization JSONObjectWithData:data options: nil error:nil];
           NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        
        finishBlock(error == nil , dataArray);
        
    }] resume];
    
}

@end
