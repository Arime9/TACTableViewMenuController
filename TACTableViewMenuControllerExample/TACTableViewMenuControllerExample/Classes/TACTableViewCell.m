//
//  TACTableViewCell.m
//  TACTableViewMenuControllerExample
//
//  Created by masato_arai on 2015/03/24.
//  Copyright (c) 2015年 Tea and Coffee. All rights reserved.
//

#import "TACTableViewCell.h"

@implementation TACTableViewCell

+ (UINib *)nib {
    NSString *nibName = NSStringFromClass([self class]);
    return [UINib nibWithNibName:nibName bundle:nil];
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)awaker {
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self awaker];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
