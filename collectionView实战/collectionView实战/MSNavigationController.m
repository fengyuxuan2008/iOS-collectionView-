//
//  MSNavigationController.m
//  MSSoftware
//
//  Created by apple on 16/8/2.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "MSNavigationController.h"

@interface MSNavigationController ()

@end

@implementation MSNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


//当第一次使用这个类的时候调用1次

+ (void)initialize
{
    
    // 设置UINavigationBarTheme的主题
    [self setupNavigationBarTheme];
   
}


//设置UINavigationBarTheme的主题

+ (void)setupNavigationBarTheme
{
    
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    //设置导航条背景图片
    [appearance setBackgroundImage:[UIImage imageNamed:@"navgation"] forBarMetrics:UIBarMetricsDefault];
    appearance.shadowImage = [UIImage new];
    
    UIFont* font = [UIFont systemFontOfSize:34.0/2];
    NSDictionary* textAttributes = @{NSFontAttributeName:font,
                                     NSForegroundColorAttributeName:WHITE_COLOR};
    
    [[UINavigationBar appearance]setTitleTextAttributes:textAttributes];
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    // UITextAttributeFont  --> NSFontAttributeName(iOS7)

    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17.0];
    // UIOffsetZero是结构体, 只要包装成NSValue对象, 才能放进字典\数组中
    //textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs];
}

//能拦截所有push进来的子控制器

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置导航栏按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"back_btn" highImageName:@"back_btn" target:self action:@selector(back)];
        
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

@end
