//
//  NewsTableViewCell.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/6/11.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsViewModel.h"
#import "Masonry.h"
#import "SDWebImage.h"
static int newsCellMargin = 16;
static NSString * const NewsCellID = @"NewsCellID";
@implementation NewsTableViewCell

//MARK: - 更新视图模型
-(void)setNewsViewModel:(NewsViewModel *)newsViewModel
{
//    if (_newsViewModel == nil) {
        _newsViewModel = newsViewModel;
        _authorLabel.text = _newsViewModel.newsModel.author_name;
        _sourceLabel.text = @"头条";
        _titleLabel.text = _newsViewModel.newsModel.title;
        _date.text = @"2019-6-11 10:48";
        
        [_newsImageView sd_setImageWithURL:[NSURL URLWithString:_newsViewModel.newsModel.thumbnail_pic_s]  placeholderImage:nil options:SDWebImageRetryFailed|SDWebImageRefreshCached];
 
//        [self setNeedsLayout];
//    }
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
  if(self){
      [self setUpUI];
  }
    return self;
}

//MARK: - 布局视图
-(void)setUpUI{
    //0,初始化子控件
    _authorLabel = [[UILabel alloc]init];
    _date = [[UILabel alloc] init];
    _titleLabel = [[UILabel alloc] init];
    _sourceLabel = [[UILabel alloc] init];
    _newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 70)];
    [_newsImageView setContentMode:UIViewContentModeScaleToFill];
    _newsImageView.clipsToBounds = true;
    
    [_titleLabel setFont:[UIFont systemFontOfSize:16]];
    _titleLabel.preferredMaxLayoutWidth = 270;
    _titleLabel.numberOfLines = 2;
    _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _titleLabel.textColor = [UIColor blackColor];
    [_date setFont:[UIFont systemFontOfSize:12]];
    _date.textColor = [UIColor blackColor];
    [_authorLabel setFont:[UIFont systemFontOfSize:12]];
    _authorLabel.textColor = [UIColor blackColor];
    [_sourceLabel setFont:[UIFont systemFontOfSize:12]];
    _sourceLabel.textColor = [UIColor blackColor];
    //1,添加子控件
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_newsImageView];
    [self.contentView addSubview:_sourceLabel];
    [self.contentView addSubview:_authorLabel];
    [self.contentView addSubview:_date];
    //2,添加自动布局
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.equalTo(self.contentView.mas_left) setOffset:newsCellMargin];
        [make.right.equalTo(self.imageView.mas_left) setOffset:newsCellMargin];
        //18高度*2行 + 上下空隙16*2 = 68
        make.height.mas_equalTo(68);
        make.top.equalTo(self.contentView.mas_top);
    }];
    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        [make.left.equalTo(self.contentView.mas_left) setOffset:newsCellMargin];
        [make.bottom.equalTo(self.contentView.mas_bottom) setOffset:-newsCellMargin];
    }];
    [_sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.equalTo(self.authorLabel.mas_right) setOffset:newsCellMargin];
        make.top.equalTo(self.authorLabel.mas_top);
        make.bottom.equalTo(self.authorLabel.mas_bottom) ;
    }];
    [_date mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.equalTo(self.sourceLabel.mas_right) setOffset:newsCellMargin];
//    make.height.mas_equalTo(12);
        make.top.equalTo(self.authorLabel.mas_top);
      make.bottom.equalTo(self.authorLabel.mas_bottom);
    }];
    [_newsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.equalTo(self.contentView.mas_top) setOffset:13];
        
//        [make.left.equalTo(self.titleLabel.mas_right) setOffset:newsCellMargin];
        [make.right.equalTo(self.contentView.mas_right) setOffset:-13];
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(100);
    }];
}
///Tell UIKit that you're using autoLayout
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    [self setinde] = NewsCellID;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
