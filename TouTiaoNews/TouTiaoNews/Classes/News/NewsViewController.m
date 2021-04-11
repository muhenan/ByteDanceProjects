//
//  NewsViewController.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/29.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "NewsViewController.h"
#import "NetWorkManager.h"
#import "ListNewsModel.h"
#import "ListNewsViewModel.h"
#import "NewsViewModel.h"
#import "NewsModel.h"
#import "NewsCell/NewsTableViewCell.h"
#import "SDWebImage.h"
static NSString * const NewsCellID = @"NewsCellID";
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
//@property(nonatomic,strong)NewsViewModel *newsViewModel;
@property(nonatomic,strong)ListNewsViewModel *listNewsViewModel;

@end

@implementation NewsViewController
//MARK: - 懒加载属性
- (ListNewsViewModel *)listNewsViewModel
{
    if (_listNewsViewModel == nil) {
        _listNewsViewModel = [[ListNewsViewModel alloc] init];
    }
    return _listNewsViewModel;
}

//MARK: - 生命周期
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
//    __weak NewsViewController* weakself = self;
    __weak typeof(self) weakself = self;
    [[NetworkManager shared] loadNews:^(Boolean success, NSArray<NewsModel*> * _Nonnull dataArray) {
        if (success) {
            NSMutableArray<NewsViewModel *> *list = [[NSMutableArray alloc]init];
            for(NSDictionary *info in dataArray)
            {
                NewsModel *model = [[NewsModel alloc] init];
                
                NewsViewModel *newsViewModel = [[NewsViewModel alloc]init];
                //KVC
                [model configWithDictionary:info];
                
                newsViewModel.newsModel = model;
                
                [list addObject:newsViewModel];

            }
            weakself.listNewsViewModel.listNews = list;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself.tableView reloadData];
            });
        }
    }];
}

//MARK: - 布局视图
-(void)setUpUI{
    //1.初始化控件
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    //2.添加自控件
    [self.view addSubview:_tableView];
    //.设置控件
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.estimatedRowHeight = 96;
    [_tableView registerClass:NewsTableViewCell.class forCellReuseIdentifier:NewsCellID];
}

//MARK: - TableViewDataSource & Delegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
   NewsViewModel *nvm = _listNewsViewModel.listNews[indexPath.row];
    
   NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NewsCellID];
    //用该方法赋值重用的cell，保证cell中数据不重复
    cell.newsViewModel = nvm;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listNewsViewModel.listNews.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
