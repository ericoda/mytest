//
//  AViewController.m
//  RACDemo_Objc
//
//  Created by Eric on 2017/7/6.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "AViewController.h"
#import "ATextField.h"
@interface AViewController () <UITextFieldDelegate>
@property (nonatomic, strong) ATextField *tf;
@end

@implementation AViewController {
    ATextField *_tf1;
    ATextField *_tf2;
    ATextField *_tf3;
    ATextField *_tf4;
    ATextField *_tf5;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self buidTF1];
    [self buidTF2];
    [self buidTF3];
    [self buidTF4];
}

- (void)buidTF1 {
    // condition control
    _tf1 = [[ATextField alloc] init];
    [self.view addSubview:_tf1];
    UIView *superV = self.view;
    [_tf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superV.mas_top).with.offset(10);
        make.left.equalTo(superV.mas_left).with.offset(10);
        make.right.equalTo(superV.mas_right).with.offset(-10);;
        make.height.with.offset(50);
    }];
    _tf1.placeholder = @"try to input \"test\" here";
    _tf1.borderStyle = UITextBorderStyleLine;
    _tf1.clearButtonMode = UITextFieldViewModeWhileEditing;


    [[_tf1.rac_textSignal filter:^BOOL(NSString *newTxt) {
        return [newTxt.lowercaseString containsString:@"test"];
    }] subscribeNext:^(id x) {
        _tf1.tips =[NSString stringWithFormat:@"signal value: %@", x] ;
    }];

}

- (void)buidTF2 {
    // condition control
    _tf2 = [[ATextField alloc] init];
    [self.view addSubview:_tf2];
    UIView *superV = self.view;
    [_tf2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tf1.mas_bottom).with.offset(30);
        make.left.equalTo(superV.mas_left).with.offset(10);
        make.right.equalTo(superV.mas_right).with.offset(-10);;
        make.height.with.offset(50);
    }];
    _tf2.placeholder = @"try to input anything here";
    _tf2.borderStyle = UITextBorderStyleLine;
    _tf2.clearButtonMode = UITextFieldViewModeWhileEditing;


    [[_tf2.rac_textSignal map:^id(id value) {
        return [NSString stringWithFormat:@"value after handled:%@",value];
    }] subscribeNext:^(id x) {
        _tf2.tips =[NSString stringWithFormat:@"signal %@", x] ;
    }];

    /*
     * you can also do it this way:

     [[_tf2.rac_textSignal bind:^RACStreamBindBlock{
     return ^RACStream *(id value, BOOL *stop) {
     return [RACReturnSignal return:[NSString stringWithFormat:@"value after handled:%@",value]];
     };
     }] subscribeNext:^(id x) {
     _tf2.tips =[NSString stringWithFormat:@"signal %@", x] ;
     }];

     */
}

- (void)buidTF3 {
    _tf3 = [[ATextField alloc] init];
    [self.view addSubview:_tf3];
    UIView *superV = self.view;
    [_tf3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tf2.mas_bottom).with.offset(30);
        make.left.equalTo(superV.mas_left).with.offset(10);
        make.right.equalTo(superV.mas_right).with.offset(-10);;
        make.height.with.offset(50);
    }];
    _tf3.placeholder = @"try to input anything here";
    _tf3.borderStyle = UITextBorderStyleLine;
    _tf3.clearButtonMode = UITextFieldViewModeWhileEditing;

    RAC(_tf3,tips) = _tf3.rac_textSignal;
}


- (void)buidTF4 {
    _tf4 = [[ATextField alloc] init];
    [self.view addSubview:_tf4];
    UIView *superV = self.view;
    [_tf4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tf3.mas_bottom).with.offset(30);
        make.left.equalTo(superV.mas_left).with.offset(10);
        make.right.equalTo(superV.mas_right).with.offset(-10);;
        make.height.with.offset(50);
    }];
    _tf4.placeholder = @"try to input anything into TF2 || TF3";
    _tf4.borderStyle = UITextBorderStyleLine;
    _tf4.clearButtonMode = UITextFieldViewModeWhileEditing;


    RAC(_tf4,text) = [RACSignal combineLatest:@[_tf2.rac_textSignal,_tf3.rac_textSignal] reduce:^(NSString *tf2, NSString *tf3){
        if (tf2 && tf3) {
            return [NSString stringWithFormat:@"%@%@",tf2,tf3 ];
        }
        return @"";
    }];;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.text.length >= 11) {
        if (textField.isFirstResponder) {
            [textField resignFirstResponder];
        }
        return NO;
    }
    return YES;
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
