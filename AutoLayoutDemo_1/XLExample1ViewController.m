//
//  XLExample1ViewController.m
//  AutoLayoutDemo_1
//
//  Created by Shelin on 16/1/23.
//  Copyright © 2016年 xiemingjiang. All rights reserved.
//

#import "XLExample1ViewController.h"
#import "XLCustomCell1.h"

@interface XLExample1ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *example1TableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation XLExample1ViewController

- (instancetype)init {
    if ([super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"XLExample1ViewController" owner:nil options:nil].lastObject;
    }
    return self;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSString *tempStr;
        for (int i = 0; i < 50; i ++ ) {
            NSString *str = [NSString stringWithFormat:@"嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻%@",tempStr];
            tempStr = str;
            [_dataArray addObject:str];
        }
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.example1TableView.estimatedRowHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XLCustomCell1 *cell = [[NSBundle mainBundle] loadNibNamed:@"XLCustomCell1" owner:nil options:nil].lastObject;
    cell.label.text = self.dataArray[indexPath.row];

    cell.label.hidden = NO;
    if (cell.label.hidden == YES) {
        cell.imageBotton.priority = 500;
    }else {
        cell.imageBotton.priority = 1000;
    }
    return cell;
}
@end
