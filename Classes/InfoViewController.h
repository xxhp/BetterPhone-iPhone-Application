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


@interface InfoViewController : UITableViewController <UITextFieldDelegate>
{
    IBOutlet  UITableView*    _tableView; 
		
	UIBarButtonItem* _editButton;
	UIBarButtonItem* _doneButton;

	//reference variable to refer address book components
	CFStringRef _currentPhoneNumberRef;
	CFStringRef _currentHomeNumberRef;
	CFStringRef _currentWorkNumberRef;
	
	ABAddressBookRef _addressBookRef;
	ABRecordRef      _recordRef;

	
	//strings will store the three fields
	NSString* _mobile;
	NSString* _home;
	NSString* _work;
	
	NSInteger  _rowNO;
	
	//textfield for edit screen
	UITextField* _mobileTextField;
	UITextField* _homeTextField;
	UITextField* _workTextField;
	
	
	BOOL  _compareElements ;
	
	
 }

@property (nonatomic, readwrite) NSInteger rowNO;


@end
