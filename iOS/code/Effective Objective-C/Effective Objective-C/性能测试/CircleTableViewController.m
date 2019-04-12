//
//  CircleTableViewController.m
//  Effective Objective-C
//
//  Created by wtw on 2018/2/2.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "CircleTableViewController.h"
#import "CircleTableViewCell.h"

@interface CircleTableViewController ()

@property (nonatomic,assign) int rowCount;

@end

@implementation CircleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _rowCount = 20;
    self.title = NSStringFromClass([self class]);
//    [self.tableView registerClass:[CircleTableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseID = @"cell";
    CircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[CircleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        
        NSLog(@"%zd",indexPath.row);
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row];

    NSLog(@"%s == %p",__func__,cell);
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _rowCount = 30;
    
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
