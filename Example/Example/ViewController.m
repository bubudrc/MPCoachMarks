//
//  ViewController.m
//  Example
//
//  Created by marcelo.perretta@gmail.com on 7/8/15.
//  Copyright (c) 2015 MAWAPE. All rights reserved.
//

#import "ViewController.h"
#import "MPCoachMarks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self showTutorial];
}

#pragma mark - Tutorial
-(void) showTutorial{
    
    CGRect coachmark1 = CGRectMake(0, 120, 125, 125);
    CGRect coachmark2 = CGRectMake(52, 318, 60, 60);
    CGRect coachmark3 = CGRectMake(2, 20, 45, 45);
    
    CGFloat screenSize = [UIScreen mainScreen].bounds.size.width;
    if(screenSize >= 375 && screenSize < 414){ //@2x
        coachmark1 = CGRectMake(28, 120, 125, 125);
        coachmark2 = CGRectMake(80, 318, 60, 60);
        coachmark3 = CGRectMake(4, 20, 45, 45);
    } else if(screenSize >= 414){ //@3x
        coachmark1 = CGRectMake(48, 120, 125, 125);
        coachmark2 = CGRectMake(100, 318, 60, 60);
        coachmark3 = CGRectMake(8, 20, 45, 45);
    }
    
    // Setup coach marks
    NSArray *coachMarks = @[
                            @{
                                @"rect": [NSValue valueWithCGRect:coachmark1],
                                @"caption": @"You can put marks over images",
                                @"shape": @"rect"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:coachmark2],
                                @"caption": @"Also, we can show buttons",
                                @"shape": @"circle"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:coachmark3],
                                @"caption": @"And works with navigations buttons too"
                                }
                            ];
    
    MPCoachMarks *coachMarksView = [[MPCoachMarks alloc] initWithFrame:self.navigationController.view.bounds coachMarks:coachMarks];
    [self.navigationController.view addSubview:coachMarksView];
    [coachMarksView start];
    
}

@end
