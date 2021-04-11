//
//  VViewController.m
//  TouTiaoNews
//
//  Created by muhenan on 2021/4/6.
//  Copyright © 2021 梁华建. All rights reserved.
//

// 1 uitableview 用法
// 2 异步请求数据
// 3 mvc mvvm

/*
// 1 UI init 布局 分开 ✅
     init with frame 在 deque 的时候会调到，不用管用的是什么 frame， tableview 帮我们管理
     layout subview 里面放布局
        一定把初始化和布局分开
// 2 请求 子线程 ✅
        子线程放到 request里，我们调用的时候直接通过 offset 和 size 调用即可
// 3 offset ✅
        加载更多的时候，offset + 10，刷新的时候是 0
// 4 删除 传 model ✅
        不要传 button了，通过 model，再通过 源数据数组找到 row
// 5 上拉是新的数据接在下面，下拉刷新清理源数据 ✅
        尽量用上头条的接口，找到要用的接口即可
   6 block 里面都用 weak，改一改 ✅
*/

#import "VViewController.h"
#import "VTableViewCell.h"
#import "VVerticalTableViewCell.h"
#import "DataModel.h"
#import "ResquestController.h"


//@interface VViewController ()<UITableViewDelegate,UITableViewDataSource, UIScrollViewDelegate>
@interface VViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView* tableView;
//@property (nonatomic, strong) NSMutableArray<VTableViewCell *> *cells;
@property (nonatomic, strong) ResquestController *Request;
@property (nonatomic, strong) VVideoModelArray *modelArray;

@property NSInteger rate;
@property int offset;
@property int sizeOfOneRequest;

@end

@implementation VViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _offset = 0;
        _sizeOfOneRequest = 10;
        _rate = 2;
        
        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getSuccess:) name:@"getSuccess" object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    NSLog(@"now VViewController view Did Load");
    [super viewDidLoad];
    
    //_cells = [[NSMutableArray alloc] init];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setScrollEnabled:YES];
    [_tableView setBounces:YES];
    [_tableView registerClass:[VTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[VVerticalTableViewCell class] forCellReuseIdentifier:@"Vcell"];
    //[_tableView setScrollEnabled:YES];
    [self.view addSubview:_tableView];
    
    dispatch_queue_t queue = dispatch_queue_create("requestData", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [ResquestController getContentByOffset:[[NSNumber alloc]initWithInt:self->_offset] bySize:[[NSNumber alloc]initWithInt:self->_sizeOfOneRequest] andThenBlock:^(NSDictionary * _Nonnull dic) {
            NSLog(@"first get data success");
            self->_offset += self->_sizeOfOneRequest;
            self->_modelArray = dic[@"videoArray"];
            [self->_tableView reloadData];
        }];
    });
}


#pragma mark 重新加载 table

//-(void) reloadtable{
//    NSLog(@"reload table");
//    [_cells removeAllObjects];
//
//    NSLog(@"count of models is %lu", (unsigned long)_modelArray.models.count);
//    for(int i = 0; i < _modelArray.models.count; i++){
//        NSLog(@"generate a cell, i is %d", i);
//        VTableViewCell *cell = [[VTableViewCell alloc]initWithModel:_modelArray.models[i] withWide:self.view.frame.size.width];
//        [_cells addObject:cell];
//    }
//    NSLog(@"count of _cells is %lu", (unsigned long)_cells.count);
//    [self.tableView reloadData];
//    NSLog(@"reload table end");
//}

#pragma mark 分页请求部分

- (void)getContents{
    NSLog(@"now get Contents");
    
    
//    dispatch_queue_t queue = dispatch_queue_create("requestData", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        [ResquestController getContentByOffset:[[NSNumber alloc]initWithInt:self->_offset] bySize:[[NSNumber alloc]initWithInt:self->_sizeOfOneRequest] andThenBlock:^(NSDictionary * _Nonnull dic) {
//            NSLog(@"get contents success");
//            self->_offset++;
//            VVideoModelArray * callBackModelArray = dic[@"videoArray"];
//            [self->_modelArray.models addObjectsFromArray:callBackModelArray.models];
//            [self->_tableView reloadData];
//        }];
//    });
    
    [ResquestController getContentByOffset:[[NSNumber alloc]initWithInt:self->_offset] bySize:[[NSNumber alloc]initWithInt:self->_sizeOfOneRequest] andThenBlock:^(NSDictionary * _Nonnull dic) {
        NSLog(@"get contents success");
        self->_offset++;
        VVideoModelArray * callBackModelArray = dic[@"videoArray"];
        [self->_modelArray.models addObjectsFromArray:callBackModelArray.models];
        [self->_tableView reloadData];
    }];
    
}

- (void)getContentsToTop{
    NSLog(@"now get Contents to top");
//    dispatch_queue_t queue = dispatch_queue_create("requestData", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        [ResquestController getContentByOffset:[[NSNumber alloc]initWithInt:self->_offset] bySize:[[NSNumber alloc]initWithInt:self->_sizeOfOneRequest] andThenBlock:^(NSDictionary * _Nonnull dic) {
//            NSLog(@"get contents success");
//            self->_offset++;
//            VVideoModelArray * resultArray = [[VVideoModelArray alloc]init];
//            VVideoModelArray * callBackModelArray = dic[@"videoArray"];
//            [resultArray.models addObjectsFromArray:callBackModelArray.models];
//            [resultArray.models addObjectsFromArray:self->_modelArray.models];
//            //[self->_modelArray.models addObjectsFromArray:callBackModelArray.models];
//
//            self->_modelArray.models = resultArray.models;
//            [self->_tableView reloadData];
//        }];
//    });
    _offset = 0;
    [ResquestController getContentByOffset:[[NSNumber alloc]initWithInt:self->_offset] bySize:[[NSNumber alloc]initWithInt:self->_sizeOfOneRequest] andThenBlock:^(NSDictionary * _Nonnull dic) {
        NSLog(@"get contents success");
        self->_offset++;
        VVideoModelArray * callBackModelArray = dic[@"videoArray"];
        [self->_modelArray.models removeAllObjects];
        [self->_modelArray.models addObjectsFromArray:callBackModelArray.models];
        [self->_tableView reloadData];
    }];
}

//- (void)getSuccess:(NSNotification *)notification{ //接到通知后把通知中的字典变成我们要用的数组的形式
//    NSLog(@"get success");
//    _offset++;
//    NSLog(@"count of dic is %@", [notification userInfo][@"names"][2]);
//    _modelArray = [DicToModelArrayTool dic2Object:[notification userInfo]];
//    //[self reloadtable];
//    [self.tableView reloadData];
//}

#pragma mark Table View 部分


#pragma mark 删除

//添加了一个简单的左滑删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.modelArray.models removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //return ((VTableViewCell *)tableView.visibleCells[indexPath.row]).cell_height;
    if([_modelArray.models[indexPath.row].coverImageURL isEqualToString:@"Image"]){
        return 90 + 475 + 48;
    }else{
        return 90 + 211 + 48;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // 返回值是多少既有几个分区
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if([_modelArray.models[indexPath.row].coverImageURL isEqualToString:@"Image"]){
        
        VVerticalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Vcell" forIndexPath:indexPath];
        if(cell == nil){
            cell = [[VVerticalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Vcell"];
        }
        [cell renderWithModel:_modelArray.models[indexPath.row]];
        
        __weak typeof(self) weakSelf = self;
        cell.cellCallBackBlock = ^(VVideoModel * model){
            NSLog(@"call back to VC");
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:[weakSelf.modelArray.models indexOfObject:model] inSection:0];
            NSLog(@"name is %@", weakSelf.modelArray.models[newIndexPath.row].name);
            //删除源数据和cell
            [weakSelf.modelArray.models removeObjectAtIndex:newIndexPath.row];
            [weakSelf.tableView deleteRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        };
        
        NSLog(@"indexPath is %ld", (long)indexPath.row);
        
        return cell;
    }else{
        VTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        if(cell == nil){
            cell = [[VTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        [cell renderWithModel:_modelArray.models[indexPath.row]];
        __weak typeof(self) weakSelf = self;
        cell.cellCallBackBlock = ^(VVideoModel * model){
            NSLog(@"call back to VC");
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:[weakSelf.modelArray.models indexOfObject:model] inSection:0];
            
            NSLog(@"name is %@", weakSelf.modelArray.models[newIndexPath.row].name);
            
            //删除源数据和cell
            [weakSelf.modelArray.models removeObjectAtIndex:newIndexPath.row];
            [weakSelf.tableView deleteRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        };
        NSLog(@"indexPath is %ld", (long)indexPath.row);
        return cell;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelArray.models.count;
}

#pragma mark - ScrollView Delegate

// 该函数在拉动结束的时刻（松手的那一刻）触发
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
//    NSLog(@"-------------- scroll start -----------");
//    NSLog(@"offset %f",scrollView.contentOffset.y);
//    NSLog(@"%f",scrollView.frame.size.height);
//    NSLog(@"%f",scrollView.contentSize.height);
//    NSLog(@"%f",scrollView.contentInset.top);
//    NSLog(@"%f",scrollView.contentInset.bottom);
//    //scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
//    NSLog(@"-------------- scroll end -----------");
    
    if(scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height){
        [UIView commitAnimations];
        [UIView animateWithDuration:2.0 animations:^{
                    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
                } completion:^(BOOL finished) {
                    NSLog(@"get more data");
                    [self getContents];
                }];
    }
    
    if(scrollView.contentOffset.y < -20){
        [UIView commitAnimations];
        [UIView animateWithDuration:1.0 animations:^{
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                } completion:^(BOOL finished) {
                    NSLog(@"get more data to header");
                    [self getContentsToTop];
                }];
    }
    
}



@end
