//
//  NewsModel.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/30.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "NewsModel.h"
@interface NewsModel()<NSCoding>
//@property(nonatomic,copy)NSString *author_name;
//@property(nonatomic,copy)NSString *category;
//@property(nonatomic,copy)NSString *date;
//@property(nonatomic,copy)NSString *thumbnail_pic_s;
//@property(nonatomic,copy)NSString *title;
//@property(nonatomic,copy)NSString *url;
@end

@implementation NewsModel
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _category = [aDecoder decodeObjectForKey:@"category"];
        _url = [aDecoder decodeObjectForKey:@"picUrl"];
        _uniquekey = [aDecoder decodeObjectForKey:@"uniqueKey"];
        _title = [aDecoder decodeObjectForKey:@"title"];
        _date = [aDecoder decodeObjectForKey:@"date"];
        _author_name = [aDecoder decodeObjectForKey:@"authorName"];
        _url = [aDecoder decodeObjectForKey:@"articleUrl"];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_author_name forKey:@"author_name"];
    [aCoder encodeObject:_category forKey:@"category"];
    [aCoder encodeObject:_date forKey:@"date"];
    [aCoder encodeObject:_thumbnail_pic_s forKey:@"thumbnail_pic_s"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_uniquekey forKey:@"uniquekey"];
   
}

- (void)configWithDictionary:(NSDictionary *)dictionary {
#warning 类型是否匹配
    self.category = [dictionary objectForKey:@"category"];
    self.thumbnail_pic_s = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.author_name = [dictionary objectForKey:@"author_name"];
    self.url = [dictionary objectForKey:@"url"];
}

+ (BOOL)supportsSecureCoding{
    return YES;
}


@end
