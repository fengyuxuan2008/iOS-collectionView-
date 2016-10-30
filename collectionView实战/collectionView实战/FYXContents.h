//
//  FYXContents.h
//  collectionView实战
//
//  Created by apple on 16/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#ifndef FYXContents_h
#define FYXContents_h

#define     RESIZE_UI6(float)  ((float)/375.0f*SCREEN_WIDTH)
#define     RESIZE_UI(float)  ((float)/320.0f*SCREEN_WIDTH)
#define SCREEN_HEIGHT              ([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0?[[UIScreen mainScreen] bounds].size.height :[[UIScreen mainScreen] bounds].size.height-20)
#define SCREEN_WIDTH                [[UIScreen mainScreen] bounds].size.width

#define     HEADER_HEIGHT               64
#define     FOOTER_HEIGHT               49

#pragma mark - 颜色
#define BG_COLOR RGBColor(241, 242, 244, 1) //背景色
#define NAV_COLOR RGBColor(45, 165, 255, 1)//蓝色
#define WHITE_COLOR RGBColor(255, 255, 255,1) //白色

#define RGBColor(r,g,b,l) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:l]

#ifdef DEBUG   //如果调试状态
#define MyLog(...) printf("%f %s\n",[[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
#else           //发布状态

#define MyLog(...)
#endif
#endif /* FYXContents_h */
