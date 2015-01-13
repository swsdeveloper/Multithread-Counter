//
//  ViewController.m
//  MultiThreadCounter
//
//  Created by Steven Shatz on 1/12/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.keepRunning = false;
    
    self.i = 0;
}

- (IBAction)StopButtonPressed:(UIButton *)sender {
    NSLog(@"Stop Button Pressed");
    self.keepRunning = false;
    [self showLabel];               // display final value of i (when while loop ends)
}

- (IBAction)StartButtonPressed:(UIButton *)sender {
    NSLog(@"Start Button Pressed");
    if (self.keepRunning == false) {
        self.keepRunning = true;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            [self incrementCounter];
        });
    }
}

// This runs in a separate thread, but the label display must be updated in the main thread
- (void)incrementCounter {
    while (self.keepRunning == true) {
        
        ++self.i;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.i % 100 == 0) {
                [self showLabel];   // show label every 1000th iteration thru the while loop
            }
        });
    }
    NSLog(@"End of while loop - i = %lld", self.i);
}

- (void)showLabel {
    self.CounterLabel.text = [NSString stringWithFormat:@"%lld", self.i];
    [self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
