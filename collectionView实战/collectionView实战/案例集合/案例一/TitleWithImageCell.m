//
//  TitleWithImageCell.m
//  collectionView实战
//
//  Created by apple on 16/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TitleWithImageCell.h"
@interface TitleWithImageCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation TitleWithImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItemImg:(NSString *)itemImg{
    
    _itemImg = itemImg;
    _imageView.image = [UIImage imageNamed:itemImg];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.layer.cornerRadius = _imageView.image.size.height/2;
    _imageView.clipsToBounds = YES;
    
}

- (void)setItemTitle:(NSString *)itemTitle{
    _itemTitle = itemTitle;
    _titleLabel.text = itemTitle;
    _titleLabel.textColor = [UIColor blackColor];
    
}

@end
