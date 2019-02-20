//
//  ViewController.m
//  HLButtonClickRange
//
//  Created by hhl on 2019/2/20.
//  Copyright © 2019 HL. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+HLClickRange.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button hlChangeButtonClickLength:50];
}

- (void)buttonClick{
    
    NSLog(@"触发了");
}

@end
