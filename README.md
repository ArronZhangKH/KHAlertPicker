#KHAlertPicker
###[中文版本](https://github.com/ArronZhangKH/KHAlertPicker/blob/master/README-CN.md#khalertpicker)
###AlertController + UIPickerView = KHAlertPicker
- small volume
- support custom UIPickerView
- support system's UIDatePicker in default


##Usage
1. Download and copy the **KHAlertPicker** folder with the source code in it to your project.
2. Initialize **KHAlertPickerController**, and give it a Title, Separator and SourceArray

        KHAlertPickerController *alertPicker = [KHAlertPickerController alertPickerWithTitle:@"Number" Separator:nil SourceArr:self.alertPickerArr];
        
3. Add Completion Action
(If you want to get the current value of UIPickerView, use **"alertPicker.conentStr"**)  
	 	
	 	UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
	 		//code what you want here after clicking sureAction
	 		_defaultArr[index] = alertPicker.contentStr;
        	[self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
	 	}];
	    [alertPicker addCompletionAction:sureAction];

4. present **KHAlertPickerController**, scroll UIPickerView to choose the value you want

		[self presentViewController:alertPicker animated:YES completion:nil];

####Congratulations! Now you know how to use KHAlertPicker

####This is the effect you got:  
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHAlertPicker_Demo02.gif?raw=true)

  
  
###What if I have some arrays inside SourceArr and wanna present a UIPickerView with several columns?
###**KHAlertPicker** already considered this situation and optimized it, and what you need to code is exactly the same.

	KHAlertPickerController *alertPicker = [KHAlertPickerController alertPickerWithTitle:@"Date" Separator:@"-" SourceArr:self.alertPickerArr];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        _defaultArr[index] = alertPicker.contentStr;
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    [alertPicker addCompletionAction:sureAction];  
    [self presentViewController:alertPicker animated:YES completion:nil];
###Now you got yourself a **KHAlertPicker** with three columns like this:
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHAlertPicker_Demo01.gif?raw=true)   
 
###What if I wanna use UIDatePicker in default?
##Usage
1. Initialize **UIDatePicker** and **NSDateFormatter**

        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
   	    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
  	    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
  	    dateFormatter.dateFormat = @"HH:mm:ss  MM/dd/yyyy";

2. Initialize **KHAlertPickerController**, and give it a **UIDatePicker** and **NSDateFormatter**
 
    	KHAlertPickerController *alertPicker = [KHAlertPickerController alertPickerWithTitle:@"Date" DatePicker:datePicker DateFormatter:dateFormatter];
    
3. Add completion Action

  	 	 UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        	_defaultArr[index] = alertPicker.contentStr;
      	   [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
   		 }];
   		 
   		 [alertPicker addCompletionAction:sureAction];
    
4. Present **KHAlertPicker**, scroll **UIDatePicker** to get what you want
   
    	[self presentViewController:alertPicker animated:YES completion:nil];
   	
###So far, you got a new KHAlertPicker with a default DatePicker:
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHAlertView_Demo03.gif?raw=true)

####TO DO:

- Add logical relation for columns when UIPickerView has serveral columns.
- simplify the usage by decreasing code quantity of interface.

