//
//  TheThirdViewController.m
//  collectionView实战
//
//  Created by apple on 16/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TheThirdViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "CollectionViewWaterfallCell.h"
#import "CollectionViewWaterfallHeader.h"
#import "CollectionViewWaterfallFooter.h"

#define CELL_COUNT 20
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"

@interface TheThirdViewController ()<UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cats;
@end

@implementation TheThirdViewController

- (NSArray *)cats {
    if (!_cats) {
        _cats = @[@"cat1.jpg", @"cat2.jpg", @"cat3.jpg", @"cat4.jpg"];
    }
    return _cats;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"案例三";
     [self.view addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.headerHeight = RESIZE_UI6(350/2)+RESIZE_UI6(339/2)*2+RESIZE_UI6(78/2)+3;
        layout.footerHeight = FOOTER_HEIGHT;
        layout.minimumColumnSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = RGBColor(30, 32, 36, 1);
       
        [_collectionView registerClass:[CollectionViewWaterfallCell class]
            forCellWithReuseIdentifier:CELL_IDENTIFIER];
        [_collectionView registerClass:[CollectionViewWaterfallHeader class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                   withReuseIdentifier:HEADER_IDENTIFIER];
        [_collectionView registerClass:[CollectionViewWaterfallFooter class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
                   withReuseIdentifier:FOOTER_IDENTIFIER];
    }
    return _collectionView;
}

- (NSArray *)cellSizes {
    if (!_cellSizes) {
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(400, 550)],
                       [NSValue valueWithCGSize:CGSizeMake(1000, 665)],
                       [NSValue valueWithCGSize:CGSizeMake(1024, 689)],
                       [NSValue valueWithCGSize:CGSizeMake(640, 427)]
                       ];
    }
    return _cellSizes;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateLayoutForOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self updateLayoutForOrientation:toInterfaceOrientation];
}

- (void)updateLayoutForOrientation:(UIInterfaceOrientation)orientation {
    CHTCollectionViewWaterfallLayout *layout =
    (CHTCollectionViewWaterfallLayout *)self.collectionView.collectionViewLayout;
    layout.columnCount = UIInterfaceOrientationIsPortrait(orientation) ? 2 : 3;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return CELL_COUNT;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewWaterfallCell *cell =
    (CollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER
                                                                               forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.cats[indexPath.item % 4]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:HEADER_IDENTIFIER
                                                                 forIndexPath:indexPath];
        reusableView.backgroundColor = RGBColor(125, 125, 125, 1);
        //轮播图，暂时以固定图片代替
        UIImageView *bannerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RESIZE_UI6(350/2))];
        bannerView.image = [UIImage imageNamed:@"bannerPic"];
        [reusableView addSubview:bannerView];
        
        UIImageView *ArtImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, RESIZE_UI6(350/2)+1, SCREEN_WIDTH, RESIZE_UI6(339/2))];
        ArtImgView.image = [UIImage imageNamed:@"艺人库"];
        [reusableView addSubview:ArtImgView];
        ArtImgView.userInteractionEnabled = YES;
        //添加点击事件（暂无）
       // UITapGestureRecognizer *artTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToArtVC:)];
       // [ArtImgView addGestureRecognizer:artTap];
        
        
        UIImageView *NeedImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0,RESIZE_UI6(350/2)+RESIZE_UI6(339/2)+1*2, SCREEN_WIDTH, RESIZE_UI6(339/2))];
        NeedImgView.image = [UIImage imageNamed:@"需求厅"];
        [reusableView addSubview:NeedImgView];
        NeedImgView.userInteractionEnabled = YES;
         //添加点击事件（暂无）
        //UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToNeedVC:)];
        //[NeedImgView addGestureRecognizer:tap];
        
        UIImageView *ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0,RESIZE_UI6(350/2)+RESIZE_UI6(339/2)+RESIZE_UI6(339/2)+1*3, SCREEN_WIDTH, RESIZE_UI6(78/2))];
        ImgView.image = [UIImage imageNamed:@"artShow_title"];
        
        [reusableView addSubview:ImgView];
        
    }
    else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:FOOTER_IDENTIFIER
                                                                 forIndexPath:indexPath];
    }
    
    return reusableView;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellSizes[indexPath.item % 4] CGSizeValue];
}


#pragma mark - Life Cycle

- (void)dealloc {
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
