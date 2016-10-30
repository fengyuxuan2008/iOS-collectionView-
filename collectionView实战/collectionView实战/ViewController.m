//
//  ViewController.m
//  collectionView实战
//
//  Created by apple on 16/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "TheFirstViewController.h"
#import "TheSecondViewController.h"
#import "TheThirdViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self initData];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = WHITE_COLOR;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, HEADER_HEIGHT, 0);
        self.tableView.tableFooterView = [[UIView alloc]init];
    }
    
    return _tableView;
}


- (void)initData{
    _titleArr = @[@"案例一",@"案例二",@"案例三"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArr.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = _titleArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TheFirstViewController *theFirstVC = [[TheFirstViewController alloc]init];
    TheSecondViewController *theSecondVC = [[TheSecondViewController alloc]init];
    TheThirdViewController *theThirdVC = [[TheThirdViewController alloc]init];
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:theFirstVC animated:NO];
            break;
        case 1:
            [self.navigationController pushViewController:theSecondVC animated:NO];
            break;
        default:
            [self.navigationController pushViewController:theThirdVC animated:NO];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
