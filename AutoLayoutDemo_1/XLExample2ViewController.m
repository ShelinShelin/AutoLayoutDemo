//
//  XLExample2ViewController.m
//  AutoLayoutDemo_1
//
//  Created by Shelin on 16/1/25.
//  Copyright © 2016年 xiemingjiang. All rights reserved.
//

#import "XLExample2ViewController.h"

@interface XLExample2ViewController ()

@end

@implementation XLExample2ViewController

- (instancetype)init {
    if ([super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"XLExample2ViewController" owner:nil options:nil].lastObject;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
