//
//  OnlyImageCell.m
//  collectionView实战
//
//  Created by apple on 16/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "OnlyImageCell.h"
@interface OnlyImageCell()
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;

@end

@implementation OnlyImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setContentImg:(NSString *)contentImg{
    _contentImg = contentImg;
    _contentImageView.image = [UIImage imageNamed:contentImg];
    _contentImageView.contentMode = UIViewContentModeScaleAspectFill;
}

@end
