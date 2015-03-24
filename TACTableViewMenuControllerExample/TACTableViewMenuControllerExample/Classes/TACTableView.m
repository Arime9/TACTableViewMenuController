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
    return 11;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    // NSInteger row = indexPath.row;
    
    TACTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TACTableViewCell reuseIdentifier] forIndexPath:indexPath];
    cell.textLabel.text = [@(section) stringValue];
    cell.backgroundColor = [UIColor colorWithRed:1.000 green:0.100*section blue:0.875 alpha:1.000];
    
    return cell;
}

@end
