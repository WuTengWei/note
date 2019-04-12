//
//  ViewController.m
//  Effective Objective-C
//
//  Created by wtw on 2018/1/30.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "ViewController.h"
#import "EOCPerson.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *dataArr;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@"CircleTableViewController",@"ReactTableViewController",@"BlockKitViewController"];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_dataArr[indexPath.row]];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = NSClassFromString(_dataArr[indexPath.row]);
    id vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
