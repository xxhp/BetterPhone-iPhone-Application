//
//  BetterPhoneAppDelegate.h
//  BetterPhone
//
//  Created by Manish Jain  on 10/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetterPhoneAppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window;
	IBOutlet UITabBarController* _tabBarController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

