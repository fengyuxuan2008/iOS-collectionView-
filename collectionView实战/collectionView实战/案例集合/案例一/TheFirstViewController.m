//
//  TheFirstViewController.m
//  collectionView实战
//
//  Created by apple on 16/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TheFirstViewController.h"
#import "TitleWithImageCell.h"
@interface TheFirstViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)TitleWithImageCell *cell;
@property(nonatomic,strong)NSArray *titlePicArray;
@property(nonatomic,strong)NSArray *titleArray;
@property (nonatomic, strong)UIPageControl *pageControl;
@end

@implementation TheFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"案例一";
    [self initData];
    [self loadControl];
    self.view.backgroundColor = BG_COLOR;
  
}

- (void)initData{
    _titleArray = @[@"美食",@"酒店/客栈",@"休闲娱乐",@"周边游/旅游",@"生活服务",@"丽人",@"火锅",@"自助餐",@"甜点饮品",@"小吃快餐",@"川湘菜",@"西餐",@"日韩料理",@"烧烤烤肉",@"经济型酒店",@"全部分类"];
    _titlePicArray = @[@"文化传媒",@"教育培训",@"影视制作",@"演艺经纪",@"灯光道具",@"文化传媒",@"教育培训",@"影视制作",@"演艺经纪",@"灯光道具",@"文化传媒",@"教育培训",@"影视制作",@"演艺经纪",@"灯光道具",@"文化传媒"];
}

#pragma mark - 加载控件
- (void)loadControl{
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    scrollView.delegate = self;
    //设置scrollView的滚动大小
    scrollView.contentSize = CGSizeMake(2*SCREEN_WIDTH, 200);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    _collectionView = [self collectionViewWithFrame:CGRectMake(0,0, 2*SCREEN_WIDTH, 200) layout:[self setLayoutWithItemSize:CGSizeMake(2*SCREEN_WIDTH/8, 80)]];
    [scrollView addSubview:_collectionView];
    
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-20, 170, 0, 20)];
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = 2;
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    [self.view addSubview:_pageControl];
}

#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewW =  scrollView.frame.size.width;
    //算出水平移的距离
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2)/scrollViewW;
    _pageControl.currentPage = page;
}


- (UICollectionView *)collectionViewWithFrame:(CGRect)frame layout:(UICollectionViewFlowLayout *)layout
{
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    [collectionView setDelegate:(id<UICollectionViewDelegate>)self];
    [collectionView setDataSource:(id<UICollectionViewDataSource>)self];
    
    [collectionView registerNib:[UINib nibWithNibName:@"TitleWithImageCell" bundle:nil] forCellWithReuseIdentifier:@"TitleWithImageCell"];
    
    
    collectionView.backgroundColor = WHITE_COLOR;
    return collectionView;
}


- (UICollectionViewFlowLayout *)setLayoutWithItemSize:(CGSize)itemSize
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = itemSize;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
   
    
    
    
    return layout;
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    return _titleArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TitleWithImageCell" forIndexPath:indexPath];
    
    
    _cell.backgroundColor = WHITE_COLOR;
    
    _cell.itemTitle = _titleArray[indexPath.item];
    _cell.itemImg = _titlePicArray[indexPath.item];
    
    return _cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
