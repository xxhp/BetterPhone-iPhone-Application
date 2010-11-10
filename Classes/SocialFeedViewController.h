//
//  SocialFeedViewController.h
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceBookContacts.h"
#import "FBRequest.h"
#import "FBSession.h"

@interface SocialFeedViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate, FBSessionDelegate, FBRequestDelegate> 
{
	IBOutlet UITableView* _table;
	
	FaceBookContacts* faceBooks1;

     
}

@end
