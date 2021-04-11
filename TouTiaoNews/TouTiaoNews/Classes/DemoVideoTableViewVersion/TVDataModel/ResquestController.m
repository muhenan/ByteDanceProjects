//
//  ResquestController.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import "ResquestController.h"
#import "DataModel.h"

@implementation ResquestController

//+ (void)getContentByOffset:(NSNumber *)offset
//                    bySize:(NSNumber *)sizeOfContents{
//
//    NSLog(@"get content by offset and size begin");
//
//    [NSThread sleepForTimeInterval:1.0]; // 模拟网络请求
//
//    NSMutableArray *names = [[NSMutableArray alloc]init];
//    NSMutableArray *avatarURLs = [[NSMutableArray alloc]init];
//    NSMutableArray *wordss = [[NSMutableArray alloc]init];
//    NSMutableArray *coverImageURLs = [[NSMutableArray alloc]init];
//
//    for(int i= 0; i < [sizeOfContents intValue]; i++){
//        [names addObject:[NSString stringWithFormat:@"num%d",[offset intValue] * 10 + i]];
//        [avatarURLs addObject:@"Pic"];
//        [wordss addObject:@"假扮老广和茶楼老板聊天，老板说出虾饺好吃的惊天秘密！"];
//
//        int value = arc4random() % 10;
//        NSLog(@"random value is %d" ,value);
//        if(value < 5){
//            [coverImageURLs addObject:@"Image"];
//        }else{
//            [coverImageURLs addObject:@"Rectangle"];
//        }
//    }
//
//
//    NSDictionary *responseObject = [[NSDictionary alloc]initWithObjectsAndKeys:names, @"names", avatarURLs, @"avatarURLs", wordss, @"wordss", coverImageURLs, @"coverImageURLs", nil];
//
//    NSLog(@"%@", responseObject[@"names"][0]);
//    NSLog(@"%@", responseObject[@"names"][1]);
//    NSLog(@"%@", responseObject[@"names"][2]);
//
//    NSLog(@"count of dic is %@", responseObject[@"names"][2]);
//
//    //请求成功，发出通知
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"getSuccess" object:self userInfo:responseObject]];
//    });
//    //[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"getSuccess" object:self userInfo:responseObject]];
//
//    NSLog(@"get content by offset and size end");
//
//}

+ (void)getContentByOffset:(NSNumber *)offset bySize:(NSNumber *)sizeOfContents andThenBlock:(void (^)(NSDictionary * _Nonnull))block{
    
//    NSLog(@"get content by offset and size begin");
//
//    [NSThread sleepForTimeInterval:1.5]; // 模拟网络请求
//
//    NSMutableArray *names = [[NSMutableArray alloc]init];
//    NSMutableArray *avatarURLs = [[NSMutableArray alloc]init];
//    NSMutableArray *wordss = [[NSMutableArray alloc]init];
//    NSMutableArray *coverImageURLs = [[NSMutableArray alloc]init];
//
//    for(int i= 0; i < [sizeOfContents intValue]; i++){
//        [names addObject:[NSString stringWithFormat:@"num%d",[offset intValue] * 10 + i]];
//        [avatarURLs addObject:@"Pic"];
//        [wordss addObject:@"假扮老广和茶楼老板聊天，老板说出虾饺好吃的惊天秘密！"];
//
//        int value = arc4random() % 10;
//        NSLog(@"random value is %d" ,value);
//        if(value < 5){
//            [coverImageURLs addObject:@"Image"];
//        }else{
//            [coverImageURLs addObject:@"Rectangle"];
//        }
//    }
//
//
//    NSDictionary *responseObject = [[NSDictionary alloc]initWithObjectsAndKeys:names, @"names", avatarURLs, @"avatarURLs", wordss, @"wordss", coverImageURLs, @"coverImageURLs", nil];
//
//    NSLog(@"%@", responseObject[@"names"][0]);
//    NSLog(@"%@", responseObject[@"names"][1]);
//    NSLog(@"%@", responseObject[@"names"][2]);
//
//    NSLog(@"count of dic is %@", responseObject[@"names"][2]);
//
//
//    NSLog(@"get success");
//    //NSLog(@"count of dic is %@", [notification userInfo][@"names"][2]);
//    VVideoModelArray *videoArray = [[VVideoModelArray alloc]init];
//    videoArray = [DicToModelArrayTool dic2Object:responseObject];
//
//    NSDictionary *finalDic = [[NSDictionary alloc]initWithObjectsAndKeys:videoArray, @"videoArray", nil];
//
//    //请求成功，返回主线程
//    dispatch_async(dispatch_get_main_queue(), ^{
//        //[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"getSuccess" object:self userInfo:responseObject]];
//        block(finalDic);
//    });
    //[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"getSuccess" object:self userInfo:responseObject]];
    
    //NSLog(@"get content by offset and size end");
    
    dispatch_queue_t queue = dispatch_queue_create("requestData", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"get content by offset and size begin");
        
        [NSThread sleepForTimeInterval:1.5]; // 模拟网络请求
        
        NSMutableArray *names = [[NSMutableArray alloc]init];
        NSMutableArray *avatarURLs = [[NSMutableArray alloc]init];
        NSMutableArray *wordss = [[NSMutableArray alloc]init];
        NSMutableArray *coverImageURLs = [[NSMutableArray alloc]init];
        
        for(int i= 0; i < [sizeOfContents intValue]; i++){
            [names addObject:[NSString stringWithFormat:@"num%d",[offset intValue] + i]];
            [avatarURLs addObject:@"Pic"];
            [wordss addObject:@"假扮老广和茶楼老板聊天，老板说出虾饺好吃的惊天秘密！"];
            
            int value = arc4random() % 10;
            NSLog(@"random value is %d" ,value);
            if(value < 5){
                [coverImageURLs addObject:@"Image"];
            }else{
                [coverImageURLs addObject:@"Rectangle"];
            }
        }
        
        
        NSDictionary *responseObject = [[NSDictionary alloc]initWithObjectsAndKeys:names, @"names", avatarURLs, @"avatarURLs", wordss, @"wordss", coverImageURLs, @"coverImageURLs", nil];
        
        NSLog(@"%@", responseObject[@"names"][0]);
        NSLog(@"%@", responseObject[@"names"][1]);
        NSLog(@"%@", responseObject[@"names"][2]);
        
        NSLog(@"count of dic is %@", responseObject[@"names"][2]);
        
        
        NSLog(@"get success");
        //NSLog(@"count of dic is %@", [notification userInfo][@"names"][2]);
        VVideoModelArray *videoArray = [[VVideoModelArray alloc]init];
        videoArray = [DicToModelArrayTool dic2Object:responseObject];
        
        NSDictionary *finalDic = [[NSDictionary alloc]initWithObjectsAndKeys:videoArray, @"videoArray", nil];
        
        //请求成功，返回主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            //[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"getSuccess" object:self userInfo:responseObject]];
            block(finalDic);
        });
        
    });

}



@end
