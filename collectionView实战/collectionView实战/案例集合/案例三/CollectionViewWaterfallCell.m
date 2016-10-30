//
//  CollectionViewWaterfallCell.m
//  collectionView实战
//
//  Created by apple on 16/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CollectionViewWaterfallCell.h"

@implementation CollectionViewWaterfallCell
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _imageView;
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
    
    
}
@end
