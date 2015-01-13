//
//  ViewController.h
//  MultiThreadCounter
//
//  Created by Steven Shatz on 1/12/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *CounterLabel;

@property (assign, nonatomic) BOOL keepRunning;

@property (assign, nonatomic) long long int i;

@end

