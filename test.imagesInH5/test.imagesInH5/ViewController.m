//
//  ViewController.m
//  test.imagesInH5
//
//  Created by EricLau on 16/6/16.
//  Copyright © 2016年 eric. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+Extension.h"
@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UIButton *go;

@end

@implementation ViewController{
	NSMutableArray * mUrlArray;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}
- (IBAction)goEvent:(UIButton *)sender {
	if (self.textfield.text.length<=0) {
		return;
	}
	[self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.textfield.text]]];
	
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	[self.view endEditing:YES];
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
	
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
	mUrlArray = [webView getAllImagesUrl].mutableCopy;
	NSLog(@"\n%@\n%s",mUrlArray.firstObject,__FUNCTION__);
}
@end
