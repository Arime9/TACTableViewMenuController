//
//  ViewController.h
//  TACTableViewMenuControllerExample
//
//  Created by masato_arai on 2015/03/24.
//  Copyright (c) 2015年 Tea and Coffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TACTableViewMenuController.h"

@class TACTableView;

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet TACTableView *tableView;
@property (nonatomic, strong) TACTableViewMenuController *tableViewMenuController;

@end
