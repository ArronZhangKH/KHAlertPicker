//
//  ViewController.m
//  textField
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 Arron_zkh. All rights reserved.
//

#import "ViewController.h"
#import "KHAlertPickerController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

/** array for alert Picker  */
@property (nonatomic, strong)  NSArray *alertPickerArr;
/** array for tableView in default  */
@property (nonatomic, strong)  NSMutableArray *defaultArr;
/** tableView for Demo */
@property (nonatomic, weak)  UITableView *tableView;


@end

@implementation ViewController

#pragma mark - lazy load
- (void)createAlertPickerArr{
    NSMutableArray *arrM1 = [NSMutableArray array];
    for (NSInteger i = 1950; i < 2016; i++) {
        [arrM1 addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    
    NSMutableArray *arrM2 = [NSMutableArray array];
    for (NSInteger i = 1; i < 13; i++) {
        [arrM2 addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    
    NSMutableArray *arrM3 = [NSMutableArray array];
    for (NSInteger i = 1; i < 31; i++) {
        [arrM3 addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    
    self.alertPickerArr = @[arrM1, arrM2, arrM3];
}

- (void)createNewAlertPickerArr{
    self.alertPickerArr = @[@"1", @"2", @"3",@"4",@"5"];
}

- (void)createDefaultArr{
    if (!_defaultArr) {
        _defaultArr = [NSMutableArray arrayWithArray: @[@"A", @"B", @"C", @"D"]];
    }
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView = tableView;
        [self.view addSubview:tableView];
    }
    return _tableView;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.defaultArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = self.defaultArr[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self showKHAlertPickerControllerWithIndex:indexPath.row];
}


#pragma mark - show alertPicker

/** init KHAlertPicker With custom pickerView */
#if 0
- (void)showKHAlertPickerControllerWithIndex:(NSInteger)index{
    
    KHAlertPickerController *alertPicker = [KHAlertPickerController alertPickerWithTitle:@"Date" Separator:@"-" SourceArr:self.alertPickerArr];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        _defaultArr[index] = alertPicker.contentStr;
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    [alertPicker addCompletionAction:sureAction];
    [self presentViewController:alertPicker animated:YES completion:nil];
}
#endif


/** init KHAlertPicker With system's default datePicker */
#if 1
- (void)showKHAlertPickerControllerWithIndex:(NSInteger)index{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"HH:mm:ss  MM/dd/yyyy";
    
    KHAlertPickerController *alertPicker = [KHAlertPickerController alertPickerWithTitle:@"Date" DatePicker:datePicker DateFormatter:dateFormatter];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {

        _defaultArr[index] = alertPicker.contentStr;
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        
    }];
    
    [alertPicker addCompletionAction:sureAction];
    [self presentViewController:alertPicker animated:YES completion:nil];
}
#endif


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self createAlertPickerArr];
    
    [self createDefaultArr];
    
    [self tableView];
    
    //[self createNewAlertPickerArr];

}


@end
