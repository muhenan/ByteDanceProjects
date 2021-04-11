//
//  VVerticalTableViewCell.h
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/7.
//  Copyright © 2021 梁华建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^CellCallBackBlcok) (VVideoModel * model);

@interface VVerticalTableViewCell : UITableViewCell

- (void)renderWithModel:(VVideoModel *)model;

@property(nonatomic, strong) CellCallBackBlcok cellCallBackBlock;
@property(nonatomic, strong) VVideoModel * model;

@end

NS_ASSUME_NONNULL_END
