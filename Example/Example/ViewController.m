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
    
    CGRect coachmark1 = CGRectMake(([UIScreen mainScreen].bounds.size.width - 125) / 2, 64, 125, 125);
    CGRect coachmark2 = CGRectMake(([UIScreen mainScreen].bounds.size.width - 300) / 2, coachmark1.origin.y + coachmark1.size.height, 300, 80);
    CGRect coachmark3 = CGRectMake(2, 20, 45, 45);
    
    // Setup coach marks
    NSArray *coachMarks = @[
                            @{
                                @"rect": [NSValue valueWithCGRect:coachmark1],
                                @"caption": @"You can put marks over images",
                                @"shape": @"circle",
                                @"position":[NSNumber numberWithInteger:LABEL_POSITION_LEFT],
                                @"alignment":[NSNumber numberWithInteger:LABEL_ALIGNMENT_RIGHT],
                                @"showArrow":[NSNumber numberWithBool:YES]
                            },
                            @{
                                @"rect": [NSValue valueWithCGRect:coachmark2],
                                @"caption": @"Also, we can show buttons"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:coachmark3],
                                @"caption": @"And works with navigations buttons too",
                                @"shape": @"square"
                                }
                            ];
    
    MPCoachMarks *coachMarksView = [[MPCoachMarks alloc] initWithFrame:self.navigationController.view.bounds coachMarks:coachMarks];
    [self.navigationController.view addSubview:coachMarksView];
    [coachMarksView start];
    
}

@end
