//
//  TheSecondViewController.m
//  collectionView实战
//
//  Created by apple on 16/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TheSecondViewController.h"
#import "OnlyImageCell.h"
#import "CollectionReusableView.h"
@interface TheSecondViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *imageArr;
@end

@implementation TheSecondViewController
static NSString * const ID = @"OnlyImageCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"案例二";
    [self initData];
     [self.view addSubview:self.tableView];
    [self buildHeaderView];
    
}

- (void)initData{
    _imageArr = @[@"back", @"cat2", @"cat3", @"cat4"];
  
}

- (void)buildHeaderView{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 350/2)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 350/2)];
    imageView.image = [UIImage imageNamed:@"back"];
    [headView addSubview:imageView];
    self.tableView.tableHeaderView = headView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = WHITE_COLOR;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, HEADER_HEIGHT, 0);
        self.tableView.showsVerticalScrollIndicator = NO;
    }
    
    return _tableView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [self collectionViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 328) layout:[self setLayoutWithItemSize:CGSizeMake(SCREEN_WIDTH/2, 60)]];
        
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, FOOTER_HEIGHT, 0);
        UINib *nib = [UINib nibWithNibName:@"OnlyImageCell" bundle:nil];
        [_collectionView registerNib:nib forCellWithReuseIdentifier:ID];
        _collectionView.scrollEnabled = NO;
        
        [_collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
        
    }
    
    return _collectionView;
}
- (UICollectionReusableView *)collectionView:
    (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                            withReuseIdentifier:@"Header"
                                                                                   forIndexPath:indexPath];
        
        reusableView.backgroundColor = WHITE_COLOR;
        UIView *titleSectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        titleSectionView.backgroundColor = BG_COLOR;
        UIImageView *iconImg = [[UIImageView alloc]initWithFrame:CGRectMake(RESIZE_UI6(20/2), RESIZE_UI6(18/2), 30, 30)];
        [titleSectionView addSubview:iconImg];
        UILabel *titleSectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(RESIZE_UI6(20/2)+30+10, RESIZE_UI6(18/2), SCREEN_WIDTH/2, 30)];
        titleSectionLabel.textColor = NAV_COLOR;
        [titleSectionView addSubview:titleSectionLabel];
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - RESIZE_UI6(80/2), RESIZE_UI6(18/2), 20, 30)];
        img.image = [UIImage imageNamed:@"jiantou"];
        [titleSectionView addSubview:img];
        if (indexPath.section == 0) {
            iconImg.image = [UIImage imageNamed:@"jifen"];
            titleSectionLabel.text = @"积分专区";
        }else{
            
            iconImg.image = [UIImage imageNamed:@"tuangou"];
            titleSectionLabel.text = @"团购专区";
        }
        [view addSubview:titleSectionView];
        
        reusableView = view;
    }
    
    
    return reusableView;
}

#pragma mark - 创建控件
- (UICollectionView *)collectionViewWithFrame:(CGRect)frame layout:(UICollectionViewFlowLayout *)layout
{
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    [collectionView setDelegate:(id<UICollectionViewDelegate>)self];
    [collectionView setDataSource:(id<UICollectionViewDataSource>)self];
    
    collectionView.backgroundColor = WHITE_COLOR;
    
    return collectionView;
}
- (UICollectionViewFlowLayout *)setLayoutWithItemSize:(CGSize)itemSize
{
    // 1.流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 2.每个cell的尺寸
    layout.itemSize = CGSizeMake(SCREEN_WIDTH/2, 60);
    // 3.设置cell之间的水平间距
    layout.minimumInteritemSpacing = 0;
    // 4.设置cell之间的垂直间距
    layout.minimumLineSpacing = 0;
    // 5.设置四周的内边距
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 44);
    return layout;
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 4;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //创建cell
    if (indexPath.section == 0) {
        OnlyImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        
        //传递模型
        if (_imageArr.count != 0) {
            cell.contentImg = _imageArr[indexPath.item];
            
        }
        return cell;
        
        
    }else if(indexPath.section == 1){
        OnlyImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        
        if (_imageArr.count != 0) {
            cell.contentImg = _imageArr[indexPath.item];
            
        }
        return cell;
        
    }else{
        return nil;
        
    }
    
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MyLog(@"点击了第%ld分区,第%ld个",(long)indexPath.section,(long)indexPath.item);
        
    }else{
        MyLog(@"点击了第%ld分区,第%ld个",(long)indexPath.section,(long)indexPath.item);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {//collectionview分区
        return 1;
    }else{//tableview分区
        return 3;
        
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIView *lineView= [[UIView alloc]initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = BG_COLOR;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        [cell addSubview:self.collectionView];
        return cell;
    }
    else{
        
       cell.textLabel.text = @"我是程序猿小白！";
        [cell addSubview:lineView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 308;
    }else{
        return 44;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        MyLog(@"点击了第几行:%ld",(long)indexPath.row);
       
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *titleSectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    titleSectionView.backgroundColor = RGBColor(241, 242, 244, 1);
    UIImageView *iconImg = [[UIImageView alloc]initWithFrame:CGRectMake(RESIZE_UI6(20/2), RESIZE_UI6(18/2), 30, 30)];
    [titleSectionView addSubview:iconImg];
    UILabel *titleSectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(RESIZE_UI6(20/2)+30+10, RESIZE_UI6(18/2), SCREEN_WIDTH/2, 30)];
    titleSectionLabel.textColor = NAV_COLOR;
    [titleSectionView addSubview:titleSectionLabel];
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - RESIZE_UI6(80/2), RESIZE_UI6(18/2), 20, 30)];
    img.image = [UIImage imageNamed:@"jiantou"];
    [titleSectionView addSubview:img];
    if (section == 1) {
        iconImg.image = [UIImage imageNamed:@"foryou"];
        titleSectionLabel.text = @"为你推荐";
    }else{
        
        
    }
    
    return titleSectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 44;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
