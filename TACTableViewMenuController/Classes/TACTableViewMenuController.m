//
//  TACTableViewMenuController.m
//  TACTableViewMenuController
//
//  Created by masato_arai on 2014/10/14.
//  Copyright (c) 2015年 Tea and Coffee. All rights reserved.
//

#import "TACTableViewMenuController.h"

@implementation TACTableViewMenuController {
    UITableView *_tableView;
    TACTableViewMenuControllerContentMode _contentMode;
    BOOL _top;
    BOOL _bottom;
    BOOL _up;
    BOOL _down;
    BOOL _more;
}

- (void)initializator {
    CGFloat mbWidth = 50.f;
    CGFloat mbHeight = 46.f;
    UIEdgeInsets mbEdgeInsets = (_contentMode == TACTableViewMenuControllerContentModeLeft) ? UIEdgeInsetsMake(4.f, 8.f, 4.f, 4.f) : UIEdgeInsetsMake(4.f, 4.f, 4.f, 8.f);
    NSMutableArray *buttons = [NSMutableArray array];
    
    if (_top) {
        _scrollTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _scrollTopButton.frame = CGRectMake(0.f, mbHeight*[buttons count], mbWidth, mbHeight);
        _scrollTopButton.imageEdgeInsets = mbEdgeInsets;
        [_scrollTopButton setImage:[UIImage imageNamed:@"mc_top.png"] forState:UIControlStateNormal];
        [_scrollTopButton addTarget:self action:@selector(scrollToTopRow) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_scrollTopButton];
        
        [buttons addObject:_scrollTopButton];
    }
    
    if (_up) {
        _scrollUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _scrollUpButton.frame = CGRectMake(0.f, mbHeight*[buttons count], mbWidth, mbHeight);
        _scrollUpButton.imageEdgeInsets = mbEdgeInsets;
        [_scrollUpButton setImage:[UIImage imageNamed:@"mc_up.png"] forState:UIControlStateNormal];
        [_scrollUpButton addTarget:self action:@selector(scrollToUpSection) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_scrollUpButton];
        
        [buttons addObject:_scrollUpButton];
    }
    
    if (_more) {
        _showMoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _showMoreButton.frame = CGRectMake(0.f, mbHeight*[buttons count], mbWidth, mbHeight);
        _showMoreButton.imageEdgeInsets = mbEdgeInsets;
        [_showMoreButton setImage:[UIImage imageNamed:@"mc_more.png"] forState:UIControlStateNormal];
        [_showMoreButton addTarget:self action:@selector(showMore:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_showMoreButton];
        
        [buttons addObject:_showMoreButton];
    }
    
    if (_down) {
        _scrollDownButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _scrollDownButton.frame = CGRectMake(0.f, mbHeight*[buttons count], mbWidth, mbHeight);
        _scrollDownButton.imageEdgeInsets = mbEdgeInsets;
        [_scrollDownButton setImage:[UIImage imageNamed:@"mc_down.png"] forState:UIControlStateNormal];
        [_scrollDownButton addTarget:self action:@selector(scrollToDownSection) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_scrollDownButton];
        
        [buttons addObject:_scrollDownButton];
    }
    
    if (_bottom) {
        _scrollBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _scrollBottomButton.frame = CGRectMake(0.f, mbHeight*[buttons count], mbWidth, mbHeight);
        _scrollBottomButton.imageEdgeInsets = mbEdgeInsets;
        [_scrollBottomButton setImage:[UIImage imageNamed:@"mc_bottom.png"] forState:UIControlStateNormal];
        [_scrollBottomButton addTarget:self action:@selector(scrollToBottomRow) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_scrollBottomButton];
        
        [buttons addObject:_scrollBottomButton];
    }
    
    CGFloat mcWidth = 50.f;
    CGFloat mcHeight = 46.f * [buttons count];
    UIEdgeInsets mcMargin = (_contentMode == TACTableViewMenuControllerContentModeLeft) ? UIEdgeInsetsMake(0.f, 0.f, 4.f, 0.f) : UIEdgeInsetsMake(0.f, (_tableView.frame.origin.x + _tableView.frame.size.width) - (mcWidth), 4.f, 0.f);
    self.frame = CGRectMake(mcMargin.left, (_tableView.frame.origin.y + _tableView.frame.size.height) - (mcMargin.bottom + mcHeight), mcWidth, mcHeight);
}

- (instancetype)initWithTableView:(UITableView *)tableView contentMode:(TACTableViewMenuControllerContentMode)contentMode top:(BOOL)top up:(BOOL)up more:(BOOL)more down:(BOOL)down bottom:(BOOL)bottom {
    self = [self init];
    if (self) {
        _tableView = tableView;
        _contentMode = contentMode;
        _top = top;
        _bottom = bottom;
        _more = more;
        _up = up;
        _down = down;
        
        [self initializator];
    }
    return self;
}

- (void)showInView:(UIView *)view {
    [view addSubview:self];
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
}

#pragma mark
#pragma mark UITableViewScroll Methods
- (void)scrollToTopRow {
    NSInteger section = [_tableView numberOfSections] - 1;
    if (section == -1) return;
    
    NSInteger row = [_tableView numberOfRowsInSection:section] - 1;
    if (row == -1) return;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)scrollToBottomRow {
    NSInteger section = [_tableView numberOfSections] - 1;
    if (section == -1) return;
    
    NSInteger row = [_tableView numberOfRowsInSection:section] - 1;
    if (row == -1) return;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)scrollToUpSection {
    NSArray *indexPaths = [_tableView indexPathsForVisibleRows];
    NSIndexPath *firstIndexPath = [indexPaths firstObject];
    
    NSInteger section = (firstIndexPath.row == 0) ? firstIndexPath.section - 1 : firstIndexPath.section;
    if (section == -1) return;
    
    NSInteger row = 0;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)scrollToDownSection {
    NSArray *indexPaths = [_tableView indexPathsForVisibleRows];
    NSIndexPath *firstIndexPath = [indexPaths firstObject];
    
    if (firstIndexPath.section == [_tableView numberOfSections] - 1) {
        [self scrollToBottomRow];
        return;
    }
    
    NSInteger section = firstIndexPath.section + 1;
    
    NSInteger row = 0;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated {
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

#pragma mark
#pragma mark showMore's Methods
- (void)showMore:(id)sender {
}

@end
