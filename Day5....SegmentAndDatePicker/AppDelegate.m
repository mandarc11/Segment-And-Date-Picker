//
//  AppDelegate.m
//  Day5....SegmentAndDatePicker
//
//  Created by Student P_02 on 16/06/17.
//  Copyright © 2017 Felix ITs. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor=[UIColor yellowColor];
    self.myViewController=[[UIViewController alloc]init];
    self.window.rootViewController=self.myViewController;
    
    
    self.dateAndTimeLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 30, 330, 50)];
    self.dateTimeArray=[NSArray arrayWithObjects:@"Show Date",@"Show Time" /*,@"Show Both"*/, nil];
    
    //Use Of Segment::
    self.segment=[[UISegmentedControl alloc]initWithItems:self.dateTimeArray];
    self.segment.frame=CGRectMake(70, 400,280,50) ;
    [self.myViewController.view addSubview:self.segment];

    [self.segment addTarget:self action:@selector(showDateOrTime:) forControlEvents:UIControlEventValueChanged];
    
    //Use Of Date Picker::
    self.myDatePicker=[[UIDatePicker alloc]init];
    [self.myDatePicker addTarget:self action:@selector(changeDateOrTime:) forControlEvents:UIControlEventValueChanged];
    
    [self.myViewController.view addSubview:self.dateAndTimeLabel];

    [self.window makeKeyAndVisible];
    
    return YES;
}


-(void)changeDateOrTime:(UIDatePicker *)sender
{
    UIDatePicker *localDatePicker=sender;
    if(localDatePicker.datePickerMode==UIDatePickerModeDate)
    {
        self.dateAndTimeLabel.text=[NSString stringWithFormat:@"%@",localDatePicker.date];
        self.dateAndTimeLabel.textColor=[UIColor redColor];

    }
    else
    {
        NSDateFormatter *myFormatter=[[NSDateFormatter alloc]init];
        [myFormatter setDateFormat:@"hh:mm:ss"];
        self.dateAndTimeLabel.text=[myFormatter stringFromDate:localDatePicker.date];
        self.dateAndTimeLabel.font=[UIFont boldSystemFontOfSize:20];
        self.dateAndTimeLabel.textColor=[UIColor redColor];
    }
}
-(void)showDateOrTime:(UISegmentedControl *)sender
{
    UISegmentedControl *localSegment=sender;
    NSInteger index=localSegment.selectedSegmentIndex;
    
    switch (index) {
        case 0:
            self.myDatePicker.datePickerMode=UIDatePickerModeDate;
            self.myDatePicker.minimumDate=[NSDate date];
            break;
            
        case 1:
            self.myDatePicker.datePickerMode=UIDatePickerModeTime;
            break;
       /* case 2:
            self.myDatePicker.datePickerMode=UIDatePickerModeDateAndTime;
            break;*/
    }
    self.myDatePicker.frame=CGRectMake(100, 200, 300, 200);
    [self.myViewController.view addSubview:self.myDatePicker];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
