//
//  ViewController.m
//  TACTableViewMenuControllerExample
//
//  Created by masato_arai on 2015/03/24.
//  Copyright (c) 2015年 Tea and Coffee. All rights reserved.
//

#import "ViewController.h"
#import "TACTableViewMenuController.h"

@interface ViewController ()

@end

@implementation ViewController {
    TACTableViewMenuController *_tableViewMenuController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableViewMenuController = [[TACTableViewMenuController alloc] initWithTableView:(UITableView *)_tableView contentMode:TACTableViewMenuControllerContentModeLeft top:YES up:YES more:YES down:YES bottom:YES];
    [_tableViewMenuController showInView:self.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
