//
//  XLCustomCell1.m
//  AutoLayoutDemo_1
//
//  Created by Shelin on 16/1/23.
//  Copyright © 2016年 xiemingjiang. All rights reserved.
//

#import "XLCustomCell1.h"

@implementation XLCustomCell1

+ (XLCustomCell1 *)customCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XLCustomCell1";
    
    XLCustomCell1 *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"XLCustomCell1" owner:nil options:nil].lastObject;
    }
    return cell;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
