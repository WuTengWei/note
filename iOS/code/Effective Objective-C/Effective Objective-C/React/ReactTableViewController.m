//
//  ReactTableViewController.m
//  Effective Objective-C
//
//  Created by wtw on 2018/2/5.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "ReactTableViewController.h"
#import "ReactiveObjC.h"

@interface ReactTableViewController ()

@end

@implementation ReactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class c = NSClassFromString(@"OneViewController");
    [self.navigationController pushViewController:[[c alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
