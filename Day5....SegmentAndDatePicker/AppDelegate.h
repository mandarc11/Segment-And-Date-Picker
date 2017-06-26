//
//  AppDelegate.h
//  Day5....SegmentAndDatePicker
//
//  Created by Student P_02 on 16/06/17.
//  Copyright © 2017 Felix ITs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *myViewController;
@property (strong, nonatomic) UIDatePicker *myDatePicker;
@property (strong, nonatomic) UILabel *dateAndTimeLabel;
@property (strong, nonatomic) UISegmentedControl *segment;
@property NSArray *dateTimeArray;


@end

