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



            // irrelevant constraints (not influencing the layout at all)

            /* zero size constraints - START */
            NSArray<NSLayoutConstraint*>* sizeConstraints = @[
                                                              [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.0],
                                                              [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.0]
                                                              ];
            [sizeConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.priority = UILayoutPriorityDefaultLow - 10;
                obj.active = YES;
            }];
            /* zero size constraints - END */



            /* pin to parent - START */
            NSArray<NSLayoutConstraint*>* pinConstraints = @[
                                                             [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:v.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
                                                             [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:v.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                                                             [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:v.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0],
                                                             [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:v.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0],
                                                             ];
            [pinConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.priority = UILayoutPriorityDefaultLow - 20;
                obj.active = YES;
            }];
            /* pin to parent - END */



            /* fit in parent - START */
            NSArray<NSLayoutConstraint*>* fitInConstraints = @[
                                                               [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:v.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
                                                               [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:v.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                                                               [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual toItem:v.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0],
                                                               [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationLessThanOrEqual toItem:v.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0],
                                                               ];
            [fitInConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.priority = UILayoutPriorityDefaultLow - 30;
                obj.active = YES;
            }];
            /* fit in parent - END */
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
