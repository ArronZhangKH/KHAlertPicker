//
//  KHAlertPickerController.m
//  KHAlertPicker
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 Arron_zkh. All rights reserved.
//

#import "KHAlertPickerController.h"
#import "NSArray+SubArr.h"

@interface KHAlertPickerController ()<UIPickerViewDelegate, UIPickerViewDataSource>

/** CustomPickerView */
@property (nonatomic, weak)  UIPickerView *pickerView;
/** DatePicker Of system */
@property(nonatomic, strong) UIDatePicker *datePicker;
/** dateFormatter */
@property(nonatomic, strong) NSDateFormatter *dateFormatter;


/** subArray for current content of custom pickerView */
@property (nonatomic, strong)  NSArray *subArr;
/** dataSource For custom pickerView */
@property (nonatomic, strong)  NSArray *dataSourceArr;

/** contentArrM */
@property (nonatomic, strong)  NSMutableArray *contentArrM;
/** separator for custom pickerView */
@property (nonatomic, copy)  NSString *separator;



@end

@implementation KHAlertPickerController

#pragma mark - initialization

/**
 initialization of alertController with system's datePicker in default
 */
+ (instancetype)alertPickerWithTitle:(NSString *)title DatePicker:(UIDatePicker *)datePicker DateFormatter:(NSDateFormatter *)dateFomatter{
    
    KHAlertPickerController *alertPicker = [self alertControllerWithTitle:title message:@"\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertPicker.view addSubview:datePicker];
    
    alertPicker.datePicker = datePicker;
    alertPicker.dateFormatter = dateFomatter;
    
    [alertPicker handleDatePicker:datePicker];
    alertPicker.contentStr = [dateFomatter stringFromDate:datePicker.date];
    
    return alertPicker;
}

/**
 initialization of alertController with custom pickerView
 */
+ (instancetype)alertPickerWithTitle:(NSString *)title Separator:(NSString *)separator SourceArr:(NSArray *)sourceArr{
    
    KHAlertPickerController *alertPicker = [self alertControllerWithTitle:title message:@"\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleActionSheet];
    alertPicker.separator = separator;
    alertPicker.dataSourceArr = sourceArr;
    
    [alertPicker.pickerView reloadAllComponents];
    [alertPicker scrollToMiddleWith:sourceArr];
    
    return alertPicker;
}

#pragma mark - lazy load
- (UIPickerView *)pickerView{
    if (!_pickerView) {
        CGFloat width = CGRectGetWidth(self.view.frame);
        UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 30, width, 200)];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        pickerView.showsSelectionIndicator = YES;
        [self.view addSubview:pickerView];
        _pickerView = pickerView;
        
    }
    return _pickerView;
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    if ([self.dataSourceArr hasSubArrInside]) {
        return self.dataSourceArr.count;
    }
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if ([self.dataSourceArr hasSubArrInside]) {
        NSArray *arr = self.dataSourceArr[component];
        return arr.count;
    }
    
    return self.dataSourceArr.count;
}

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if ([self.dataSourceArr hasSubArrInside]) {
        NSArray *arr = self.dataSourceArr[component];
        NSString *str = arr[row];
        return str;
    }
    
    return self.dataSourceArr[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ([self.dataSourceArr hasSubArrInside]) {
        [self.dataSourceArr enumerateObjectsUsingBlock:^(NSArray *subArr, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx == component) {
                self.contentArrM[component] = subArr[row];
            }
        }];
        self.contentStr = [self.contentArrM componentsJoinedByString:self.separator];
        
    }else{
        self.contentStr = self.dataSourceArr[row];
    }
    
   
}

#pragma mark - other methods

- (void)scrollToMiddleWith:(NSArray *)dataSource{
    
    if ([dataSource hasSubArrInside]) {
        
        self.contentArrM = [NSMutableArray array];
        [dataSource enumerateObjectsUsingBlock:^(NSArray *subArr, NSUInteger component, BOOL * _Nonnull stop) {
            NSInteger row = subArr.count / 2;
            [self.pickerView selectRow:row inComponent:component animated:NO];
            [self.contentArrM addObject:subArr[row]];
        }];
        
        self.contentStr = [self.contentArrM componentsJoinedByString:self.separator];
        return;
    }
    
    NSInteger middleNum = dataSource.count / 2;
    [self.pickerView selectRow:middleNum inComponent:0 animated:NO];
    self.contentStr = dataSource[middleNum];
	
}

- (void)addCompletionAction:(UIAlertAction *)action{
    
    [self addAction:action];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [self addAction:cancelAction];
}

- (void)handleDatePicker:(UIDatePicker *)datePicker{
    [datePicker addTarget:self action:@selector(handleValueChangedOfDatePicker) forControlEvents:UIControlEventValueChanged];
}

- (void)handleValueChangedOfDatePicker{
    self.contentStr = [self.dateFormatter stringFromDate:self.datePicker.date];
}







@end
