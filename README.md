# TACTableViewMenuController
![Screen Shot](https://github.com/Tea-and-Coffee/TACTableViewMenuController/wiki/images/ScreenShot_iPhone5s_iOS8.1_01.png)

# Installation
Add the following files to your project.

* TACTableViewMenuController.h, .m
* Resource(Button Images)

# Usage
    #import "TACTableViewMenuController.h"
    
    @property (nonatomic, strong) TACTableViewMenuController *tableViewMenuController;
    
    - (void)viewDidLoad {
        [super viewDidLoad];
    
        self.tableViewMenuController = [[TACTableViewMenuController alloc] initWithTableView:(UITableView *)self.tableView contentMode:TACTableViewMenuControllerContentModeRight top:YES up:YES more:YES down:YES bottom:YES];
        [self.tableViewMenuController showInView:self.view];
    }

# License
TACTableViewMenuController is released under the MIT license. See LICENSE for details.