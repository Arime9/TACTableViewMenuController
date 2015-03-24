//
//  TACTableView.m
//  TACTableViewMenuControllerExample
//
//  Created by masato_arai on 2015/03/24.
//  Copyright (c) 2015年 Tea and Coffee. All rights reserved.
//

#import "TACTableView.h"
#import "TACTableViewCell.h"

@implementation TACTableView

- (void)awaker {
    // tableView
    [self registerClass:[TACTableViewCell class] forCellReuseIdentifier:[TACTableViewCell reuseIdentifier]];
    self.backgroundColor = [UIColor colorWithRed:1.000 green:0.695 blue:0.806 alpha:1.000];
    self.dataSource = self;
    self.delegate = self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self awaker];
}

#pragma mark <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TACTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TACTableViewCell reuseIdentifier] forIndexPath:indexPath];
    return cell;
}

@end
