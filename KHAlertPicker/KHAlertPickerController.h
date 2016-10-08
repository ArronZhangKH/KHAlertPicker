//
//  KHAlertPickerController.h
//  KHAlertPicker
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 Arron_zkh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHAlertPickerController : UIAlertController

/** content of the pickerView*/
@property (nonatomic, copy)  NSString *contentStr;


+ (instancetype)alertPickerWithTitle:(NSString *)title Separator:(NSString *)separator SourceArr:(NSArray *)sourceArr;

+ (instancetype)alertPickerWithTitle:(NSString *)title DatePicker:(UIDatePicker *)datePicker DateFormatter:(NSDateFormatter *)dateFomatter;

- (void)addCompletionAction:(UIAlertAction *)action;


@end
