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

@interface SocialFeedViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate, FBRequestDelegate> 
{
	IBOutlet UITableView*				_table;
	IBOutlet UIActivityIndicatorView*	_activity;
		
	//local array for comparison for all methods
	NSArray*				_local;
    NSArray*				_status;
	NSArray*				_contacts;
	NSArray*				_faceBookContacts; 

	NSMutableArray*			_friends;	
	
	UIImageView*			_imageView;
	
	NSTimer*				_timeCounter;
	
	int						_counts;
	BOOL					_tableContent;
}


@end
