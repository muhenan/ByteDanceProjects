//
//  VideoViewController.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/29.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoCell/VideoCell.h"
#import "CLPlayerView.h"

//宏定义了屏幕宽高
#define screenHeight [[UIApplication sharedApplication] keyWindow].frame.size.height
#define screenWidth [[UIApplication sharedApplication] keyWindow].frame.size.width

//用于复用的 video cell 的 id
static NSString *const videoCellID = @"videoCellID";

@interface VideoViewController()<UICollectionViewDelegate,UICollectionViewDataSource,VideoCellDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)CLPlayerView * clPlayerView;
@property(nonatomic,strong)VideoCell *playingCell;
@property(nonatomic,strong)UIButton *playBtn;
@end

@implementation VideoViewController

-(instancetype)init
{
    // tab bar 位置的初始化设置
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareCollectionView];
    //使用frame布局要先布局好再添加到子view上面，使用自动布局的话就不用
//    _playBtn = [[UIButton alloc]initWithFrame:CGRectMake(190, 300, 100,30)];

//    [self playVideoInVisiableCells];
}

//进入这个界面就自动播放
-(void)playVideoInVisiableCells{
//下面是我实际项目中代码。在这里你需要做的就是获得第一个有视频的cell，并进行播放和记录。播放视频可以抽到一个方法中，需要的就是播放视频所在的cell以及视频播放所需要的地址URL等。可以仿照我的进行写代码，当然，如果你的每个cell类型相同且都有视频，你可以直接获取可见的cell  NSArray *visiableCells = [self.tableView visibleCells]; 判断 visiableCells.count是否大于0，正在播放的cell就是第一个了。接下来我们说一说播放视频- (void)initPlayerView:(VideoCell *)cell playClick:(NSURL *)videoUrl
    
    // 找到下一个要播放的cell(最在屏幕中心的)
    VideoCell *firstCell = nil;
    
    NSArray *visiableCells = [self.collectionView visibleCells];
    
    //存放大框播放视频
    for (int i = 0; i < visiableCells.count; i++) {
        UITableViewCell *cell = visiableCells[i];
        if ([cell isKindOfClass:[VideoCell class]]) {
            firstCell = (VideoCell *)cell;
            
            break;
        }
    }
    
    //播放第一个视频
    [self initPlayerView:firstCell playClick:[[NSURL alloc]initWithString:firstCell.videoUrl]];
    
}

- (void)initPlayerView:(VideoCell *)cell playClick:(NSURL *)videoUrl
{
    self.playingCell = cell;
    //    self.playingIndexPath = [self.tableView indexPathForCell:cell];
    [_clPlayerView destroyPlayer];
    _clPlayerView = nil;
    
    CLPlayerView *playerView = [[CLPlayerView alloc] initWithFrame:cell.videoFrame];
    _clPlayerView = playerView;
    
    [cell.contentView addSubview:_clPlayerView];
    
    //视频地址
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self->_clPlayerView.url = videoUrl;
        //播放
        [self->_clPlayerView playVideo];
    });
    
    //返回按钮点击事件回调
    [_clPlayerView backButton:^(UIButton *button) {
        NSLog(@"返回按钮被点击");
    }];
    
    //播放完成回调
    [_clPlayerView endPlay:^{
        
        //销毁播放器
        [self->_clPlayerView destroyPlayer];
        
        self->_clPlayerView = nil;
        
        NSLog(@"播放完成");
        
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    //我发现作者对于内存的释放有一点问题，播放器销毁后内存并没有下降
    //    [_clPlayerView calculateScrollOffset:self.tableView cell:self.playingCell];
    
    //我尝试去修改作者的，似乎也没有起作用，所有自己在改方法中进行销毁
    NSArray *cells = [self.collectionView visibleCells];
    if (![cells containsObject:self.playingCell]) {
        
        if (_clPlayerView) {
            //销毁播放器
            [_clPlayerView destroyPlayer];
            _clPlayerView = nil;
        }
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //滑动播放
    [self handleScrollPlaying:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (!decelerate){
        //滑动播放
        [self handleScrollPlaying:scrollView];
    }
}

//这里参考第二篇文章的计算方式，更准确的计算方式应该是：cell中videoView的中心距屏幕的中心最近的cell为正在播放的cell。
//滑动播放
- (void)handleScrollPlaying:(UIScrollView *)scrollView
{
    // 找到下一个要播放的cell(最在屏幕中心的)
    VideoCell *finnalCell = nil;
    NSArray *visiableCells = [self.collectionView visibleCells];
    
    //存放大框播放视频
    NSMutableArray *tempVideoCells = [NSMutableArray array];
    for (int i = 0; i < visiableCells.count; i++) {
        UITableViewCell *cell = visiableCells[i];
        
        if ([cell isKindOfClass:[VideoCell class]]) {
            [tempVideoCells addObject:cell];
        }
    }
    
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    CGFloat gap = MAXFLOAT;
    
    for (VideoCell *cell in tempVideoCells) {
        
        [indexPaths addObject:[self.collectionView indexPathForCell:cell]];
        
        //计算距离屏幕中心最近的cell
        CGPoint coorCentre = [cell.superview convertPoint:cell.center toView:nil];
        CGFloat delta = fabs(coorCentre.y-[UIScreen mainScreen].bounds.size.height*0.5);
        if (delta < gap) {
            gap = delta;
            finnalCell = cell;
        }
    }
    
    // 注意, 如果正在播放的cell和finnalCell是同一个cell, 不应该在播放
    if (finnalCell != nil && self.playingCell != finnalCell)  {
        if (_clPlayerView) {
            [_clPlayerView destroyPlayer];
            _clPlayerView = nil;
        }
        
//        [self initPlayerView:finnalCell playClick:[[NSURL alloc] initFileURLWithPath:finnalCell.videoUrl]];
        [self initPlayerView:finnalCell playClick:[[NSURL alloc] initWithString:finnalCell.videoUrl]];
        self.playingCell = finnalCell;
        return;
    }
}





//对 Collection View 进行一定的基本设置
-(void)prepareCollectionView
{
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    fl.itemSize = CGSizeMake(screenWidth,350);  // 大小
    fl.scrollDirection = UICollectionViewScrollDirectionVertical; // 垂直 拉
    fl.minimumLineSpacing = 10;
    fl.minimumInteritemSpacing = 10;    // 最小的cell间的间隙是 10 像素
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:fl];
    [self.view addSubview:_collectionView];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
//    _collectionView.scrollDel
    [_collectionView registerClass: VideoCell.class forCellWithReuseIdentifier:videoCellID];
}

//设置每一个位置的cell
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    VideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: videoCellID forIndexPath:indexPath];
    cell.backgroundColor = UIColor.redColor;
//    cell.videoUrl = @"/Users/lianghuajian/Downloads/xvideos.com_4df89527f7ca2a361709939d8249b637.mp4";
    cell.cellDelegate = self;
    cell.videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    return cell;
}


// 实现 video cell 代理中的唯一一个函数
- (void)CellVideoDidStartToPlay:(VideoCell *)cell
{
//    [self initPlayerView:cell playClick:[[NSURL alloc] initFileURLWithPath:cell.videoUrl]];
    [self initPlayerView:cell playClick:[[NSURL alloc] initWithString:cell.videoUrl]];
}

//每个 section 有20个
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

//
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    
//    [[self.collectionView visibleCells] enumerateObjectsUsingBlock:^(__kindof UICollectionViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [(VideoCell*)obj destroyPlayer];
//    }];
//}
@end

