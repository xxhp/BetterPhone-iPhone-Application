//
//  ContactsViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactInfo.h"

@implementation ContactsViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//ABUnknownPersonViewController* picker = [[ABUnknownPersonViewController alloc] init];
	
	ABPeoplePickerNavigationController* picker = [[ABPeoplePickerNavigationController alloc] init]; 
//		
	picker.navigationItem.leftBarButtonItem.enabled = NO;
//	
	picker.peoplePickerDelegate = self;
	
	[self.view addSubview:picker.view];
		
}

//- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker 
//{
//    // assigning control back to the main controller
//	[self dismissModalViewControllerAnimated:YES];
//}
//
//- (BOOL)peoplePickerNavigationController: (ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
//	
//	// setting the first name
//    firstName.text = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//	
//	// setting the last name
//    lastName.text = (NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);	
//	
//	// setting the number
//	/*
//	 this function will set the first number it finds
//	 
//	 if you do not set a number for a contact it will probably
//	 crash
//	 */
//	ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
//	number.text = (NSString*)ABMultiValueCopyValueAtIndex(multi, 0);
//	
//	// remove the controller
//    [self dismissModalViewControllerAnimated:YES];
//	
//    return NO;
//}
//
//- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
//    return NO;
//}





- (void)dealloc
{
    [super dealloc];
}


@end
