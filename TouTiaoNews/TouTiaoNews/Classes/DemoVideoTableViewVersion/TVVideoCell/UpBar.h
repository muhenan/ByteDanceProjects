//
//  UpBar.h
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ClickCallBackBlock)(void);

@interface UpBar : UIView

- (void)renderWithModel:(VVideoModel *)model;

@property(nonatomic, copy) ClickCallBackBlock clickCallBackBlock;

@end

NS_ASSUME_NONNULL_END
