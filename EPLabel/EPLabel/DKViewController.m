//
//  DKViewController.m
//  EPLabel
//
//  Created by LEE CHIEN-MING on 12/29/13.
//  Copyright (c) 2013 Derek. All rights reserved.
//


#import "DKViewController.h"

/**
 Please be aware that this sample project is using Autolayout. Thus, instance variable myLabel
 will be replace by a new EPLabel instance to get rid of the influence from Autolayout.
 Reference: http://stackoverflow.com/questions/16763808/ios-cgrectmake-doesnt-change-position-of-a-uilabel
 */
@implementation DKViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
    
    EPLabel *newLabel = [[EPLabel alloc] initWithFrame:self.myLabel.frame];
    newLabel.textColor = [UIColor redColor];
    newLabel.text = text;
    newLabel.font = self.myLabel.font;
    [newLabel bestSize]; // Before getting the best size, text and font property must be set priorly.
    
    // remove original myLabel before set with a new instance
    [self.myLabel removeFromSuperview];
    self.myLabel = newLabel;
    [self.view addSubview:self.myLabel];    
}

@end
