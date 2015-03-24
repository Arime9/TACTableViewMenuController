//
//  TACTableViewMenuController.h
//  TACTableViewMenuController
//
//  Created by masato_arai on 2014/10/14.
//  Copyright (c) 2015年 Tea and Coffee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TACTableViewMenuControllerContentMode) {
    TACTableViewMenuControllerContentModeLeft,
    TACTableViewMenuControllerContentModeRight
};

@interface TACTableViewMenuController : UIView

@property (nonatomic, strong) UIButton *scrollTopButton;
@property (nonatomic, strong) UIButton *scrollBottomButton;
@property (nonatomic, strong) UIButton *scrollUpButton;
@property (nonatomic, strong) UIButton *scrollDownButton;
@property (nonatomic, strong) UIButton *showMoreButton;

- (instancetype)initWithTableView:(UITableView *)tableView contentMode:(TACTableViewMenuControllerContentMode)contentMode top:(BOOL)top up:(BOOL)up more:(BOOL)more down:(BOOL)down bottom:(BOOL)bottom;
- (void)showInView:(UIView *)view;
- (void)removeFromSuperview;

#pragma mark
#pragma mark UITableViewScroll Methods
- (void)scrollToTopRow;
- (void)scrollToBottomRow;
- (void)scrollToUpSection;
- (void)scrollToDownSection;
- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

#pragma mark
#pragma mark showMore's Methods
- (void)showMore:(id)sender;

@end
