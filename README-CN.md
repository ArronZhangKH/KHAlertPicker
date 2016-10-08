#KHAlertPicker
###English Version
###AlertController + UIPickerView = KHAlertPicker
- 体量小
- 支持自定义的UIPickerView
- 支持系统自带的UIDatePicker


##使用方法
1. 下载并复制**KHAlertPicker**文件夹下的源代码到你的工程目录。
2. 初始化**KHAlertPickerController**, 赋值Title, Separator和SourceArray

        KHAlertPickerController *alertPicker = [KHAlertPickerController alertPickerWithTitle:@"Number" Separator:nil SourceArr:self.alertPickerArr];
        
3. 添加确定按钮  
(注意:如果要获取当前PickerView的内容,只需通过alertPicker.contentStr来获取)
	 	
	 	UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
	 		//在此写入点击确定按钮后要响应的操作
	 		_defaultArr[index] = alertPicker.contentStr;
        	[self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
	 	}];
	    [alertPicker addCompletionAction:sureAction];

4. 展示**KHAlertPickerController**, 滚动视图并选择你要的内容

		[self presentViewController:alertPicker animated:YES completion:nil];

####恭喜!到此您已经掌握了KHAlertPicker的用法
####完成以上操作后得到的效果如下:  
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHAlertPicker_Demo02.gif?raw=true)

  
  
###假如数据源中嵌套了数组, 导致UIPickerView有多列呢? 不需担心,KHAlertPicker已经考虑到这种情况并在内部进行了处理,所以代码和以上完全一致
代码如下所示:

	KHAlertPickerController *alertPicker = [KHAlertPickerController alertPickerWithTitle:@"Date" Separator:@"-" SourceArr:self.alertPickerArr];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        _defaultArr[index] = alertPicker.contentStr;
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    [alertPicker addCompletionAction:sureAction];  
    [self presentViewController:alertPicker animated:YES completion:nil];
####选择器多列的效果图如下:
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHAlertPicker_Demo01.gif?raw=true)   
 
###假如我想用系统自定义的UIDatePicker呢?
##使用方法
1. 初始化**UIDatePicker**和**NSDateFormatter**

        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
   	    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
  	    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
  	    dateFormatter.dateFormat = @"HH:mm:ss  MM/dd/yyyy";

2. 初始化**KHAlertPickerController**, 并赋值**UIDatePicker**和**NSDateFormatter**
 
    	KHAlertPickerController *alertPicker = [KHAlertPickerController alertPickerWithTitle:@"Date" DatePicker:datePicker DateFormatter:dateFormatter];
    
3. 添加确定按钮  

  	 	 UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        	_defaultArr[index] = alertPicker.contentStr;
      	   [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
   		 }];
   		 
   		 [alertPicker addCompletionAction:sureAction];
    
4. 展示KHAlertPicker, 滚动视图并选择你要的内容
   
    	[self presentViewController:alertPicker animated:YES completion:nil];
   	
###到此,您就全部完成了! 效果如下:
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHAlertView_Demo03.gif?raw=true)

####后续工作
- 在UIPickerView有多列的情况下, 为其添加列和列之间的逻辑关系
- 减少接口的代码量

