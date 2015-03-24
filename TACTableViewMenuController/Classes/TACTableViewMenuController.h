//
//  TACTableViewMenuController.h
//  TACTableViewMenuController
//
//  Created by masato_arai on 2014/10/14.
//  Copyright (c) 2015年 Tea and Coffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TACTableViewMenuController : UIView

@property UIButton *scrollTopButton;
@property UIButton *scrollBottomButton;

- (instancetype)initWithTableView:(UITableView *)tableView viewController:(UIViewController *)viewController;

#pragma mark - UITableViewScroll Methodss
- (void)scrollToTopRow;
- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
- (void)scrollToBottomRow;

@end
