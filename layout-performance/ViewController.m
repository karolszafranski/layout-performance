//
//  ViewController.m
//  layout-performance
//
//  Created by Karol Szafrański on 11.06.18.
//  Copyright © 2018 eclipsesource.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView* v;
    int l = 35;

    for (int i = 0; i < l; i++) {
        for (int k = 0; k < l; k++) {
            v = [[UIView alloc] initWithFrame:CGRectMake(5 + (i * 15), 5 + (k * 15), 10, 10)];
            v.backgroundColor = [UIColor grayColor];
            [self.view addSubview:v];

            // absolute positioning
            v.translatesAutoresizingMaskIntoConstraints = NO;
            [v.topAnchor constraintEqualToAnchor:v.superview.topAnchor constant:5 + (i * 15)].active = YES;
            [v.leftAnchor constraintEqualToAnchor:v.superview.leftAnchor constant:5 + (k * 15)].active = YES;
            [v.widthAnchor constraintEqualToConstant:10.0].active = YES;
            [v.heightAnchor constraintEqualToConstant:10.0].active = YES;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
