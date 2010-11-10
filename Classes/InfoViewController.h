//
//  InfoViewController.h
//  BetterPhone
//
//  Created by Manish Jain  on 10/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface InfoViewController : UITableViewController 
{

	CFStringRef currentPhoneNumberRef;
	CFStringRef currentHomeNumberRef;
	CFStringRef currentWorkNumberRef;

	NSInteger  _rowNO;
	IBOutlet  UITableView* _table; 
 }

@property (nonatomic, readwrite) NSInteger rowNO;

@end
