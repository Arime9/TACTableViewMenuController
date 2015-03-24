//
//  TACTableViewMenuController.m
//  TACTableViewMenuController
//
//  Created by masato_arai on 2014/10/14.
//  Copyright (c) 2015年 Tea and Coffee. All rights reserved.
//

#import "TACTableViewMenuController.h"

@implementation TACTableViewMenuController {
    UIViewController *_viewController;
    UITableView *_tableView;
}

- (void)initializator {
    CGFloat mcWidth = 50.f;
    CGFloat mcHeight = 92.f;
    CGFloat mcMargin = 4.f;
    
    CGFloat mbWidth = 50.f;
    CGFloat mbHeight = 46.f;
    
    self.frame = CGRectMake((_tableView.frame.origin.x + _tableView.frame.size.width) - (mcWidth), (_tableView.frame.origin.y + _tableView.frame.size.height) - (mcMargin + mcHeight), mcWidth, mcHeight);
    [_viewController.view addSubview:self];
    
    _scrollTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _scrollTopButton.frame = CGRectMake(0.f, 0.f, mbWidth, mbHeight);
    _scrollTopButton.imageEdgeInsets = UIEdgeInsetsMake(4.f, 4.f, 4.f, 8.f);
    [_scrollTopButton setImage:[UIImage imageNamed:@"mc_up.png"] forState:UIControlStateNormal];
    [_scrollTopButton addTarget:self action:@selector(scrollToTopRow) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_scrollTopButton];
    
    _scrollBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _scrollBottomButton.frame = CGRectMake(0.f, mbHeight*1, mbWidth, mbHeight);
    _scrollBottomButton.imageEdgeInsets = UIEdgeInsetsMake(4.f, 4.f, 4.f, 8.f);
    [_scrollBottomButton setImage:[UIImage imageNamed:@"mc_down.png"] forState:UIControlStateNormal];
    [_scrollBottomButton addTarget:self action:@selector(scrollToBottomRow) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_scrollBottomButton];
}

- (instancetype)initWithTableView:(UITableView *)tableView viewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        _viewController = viewController;
        _tableView = tableView;
        [self initializator];
    }
    return self;
}

#pragma mark - UITableViewScroll Methods
- (void)scrollToTopRow {
    NSInteger section = [_tableView numberOfSections] - 1;
    if (section == -1) return;
    
    NSInteger row = [_tableView numberOfRowsInSection:section] - 1;
    if (row == -1) return;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated {
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

- (void)scrollToBottomRow {
    NSInteger section = [_tableView numberOfSections] - 1;
    if (section == -1) return;
    
    NSInteger row = [_tableView numberOfRowsInSection:section] - 1;
    if (row == -1) return;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

@end
