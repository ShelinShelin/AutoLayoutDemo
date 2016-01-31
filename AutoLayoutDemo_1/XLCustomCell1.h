//
//  XLCustomCell1.h
//  AutoLayoutDemo_1
//
//  Created by Shelin on 16/1/23.
//  Copyright © 2016年 xiemingjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLCustomCell1 : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageBotton;

+ (XLCustomCell1 *)customCellWithTableView:(UITableView *)tableView;
@end
