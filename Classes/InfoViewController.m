//
//  InfoViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"
#import "InfoViewController.h"

@interface InfoViewController (private)

-(void) createAddressbook;
-(void) createTextField;

@end



@implementation InfoViewController

@synthesize rowNO = _rowNO;



-(void)viewDidLoad
{
	//adding save button on view when present view in dialpad 
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]   initWithTitle:@"Save"  style:UIBarButtonItemStylePlain	
																								target:self 
																								action:@selector(saveContact)] autorelease];
	
	
	_mobile = [[NSString alloc] init];
	_work   = [[NSString alloc] init];
	_home   = [[NSString alloc] init];
	
	[self createTextField];
}

-(void)viewWillAppear:(BOOL)animated
{
	if ([DataManager sharedObj].canAddToContacts) 
	{
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]   initWithTitle:@"Save"  style:UIBarButtonItemStylePlain	
																									target:self 
																									action:@selector(saveContact)] autorelease];
	}
	else 
	{
		self.navigationItem.rightBarButtonItem = nil;
	}

	if (self.tabBarController.selectedIndex == 2)
	{
		 _editButton = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit	   target:self 
																											action:@selector(editContacts:)];
		
		_doneButton = [[UIBarButtonItem alloc]	initWithBarButtonSystemItem:UIBarButtonSystemItemDone	 target:self 
																										 action:@selector(doneContacts:)];
		
		
		self.navigationItem.rightBarButtonItem = _editButton;
	}
	
	[_tableView reloadData];
}

- (void) saveContact
{
	NSLog(@"save clicked");

	CFErrorRef anError = NULL;
	
	//code to save data in address book	
	ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
	ABMultiValueAddValueAndLabel(multiPhone, [DataManager sharedObj].mobileNumber, kABPersonPhoneMainLabel, NULL);            
	ABRecordSetValue(_recordRef, kABPersonPhoneProperty, multiPhone, &anError);
	CFRelease(multiPhone);
	
	ABAddressBookSave(_addressBookRef, &anError);
	[DataManager sharedObj].mobileNumber = nil;
	[self.navigationController popViewControllerAnimated:YES];
}


- (IBAction) editContacts:(id)Sender
{
	self.navigationItem.rightBarButtonItem = _doneButton;

	_compareElements = YES;
	[_tableView reloadData];
}

- (IBAction) doneContacts:(id)Sender
{
	self.navigationItem.rightBarButtonItem = _editButton;
	
	_compareElements = NO;
	
	CFErrorRef anError = NULL;
	
	ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);

	ABMultiValueReplaceLabelAtIndex(multiPhone, kABPersonPhoneMobileLabel,0 );
	
	//code to save data in address book	
		
	
	//ABMultiValueAddValueAndLabel(multiPhone, _mobileTextField.text, kABPersonPhoneMainLabel, NULL);            
	ABRecordSetValue(_recordRef, kABPersonPhoneProperty, multiPhone, &anError);
	CFRelease(multiPhone);
	
	ABAddressBookSave(_addressBookRef, &anError);
	
	
	
	_mobileTextField.text = @""; 
	_workTextField.text   = @"";
	_homeTextField.text   = @"";
	
	[_tableView reloadData];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    // Return the number of rows in the section.
    return 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (_compareElements == NO)
	{
		static NSString *CellIdentifier = @"Cell";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil)
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
		}
		
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.textLabel.textColor = [[UIColor alloc]initWithRed:0.3 green:0.5 blue:0.7 alpha:1];
		cell.textAlignment = UITextAlignmentLeft;
		[self createAddressbook];
		
		switch (indexPath.row)
		{
				case 0:
						cell.textLabel.text = @"mobile";
						cell.detailTextLabel.text = _mobile;	
						
						if ([DataManager sharedObj].canAddToContacts)
							cell.detailTextLabel.text = [DataManager sharedObj].mobileNumber;
							
						break;
				case 1:
						cell.textLabel.text = @"home";
						cell.detailTextLabel.text = _home;
						
						break;
				case 2:
						cell.textLabel.text = @"work";
						cell.detailTextLabel.text = _work;
						
						break;
				default:
						NSLog(@"hello");
						break;
		 }
		return cell;
	}
	else
	{
		static NSString *CellIdentifier = @"Cell1";
		
		UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell1 == nil)
		{
			cell1 = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
		}
		
		cell1.selectionStyle = UITableViewCellSelectionStyleNone;
		cell1.textLabel.textColor = [[UIColor alloc]initWithRed:0.3 green:0.5 blue:0.7 alpha:1];
		cell1.textAlignment = UITextAlignmentLeft;
		
		
		switch (indexPath.row)
		{
			case 0:
					cell1.textLabel.text = @"mobile";
					[cell1.contentView addSubview:_mobileTextField];
					
					break;
			case 1:
					cell1.textLabel.text = @"home";
					[cell1.contentView addSubview:_homeTextField];
					
					break;
			case 2:
					cell1.textLabel.text = @"work";
					[cell1.contentView addSubview:_workTextField];
					
					break;
			default:
					NSLog(@"hello");
					break;
		}
		return cell1;
	}

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	textField.clearsOnBeginEditing = YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
	 _mobile =  _mobileTextField.text;
	 _work   =  _workTextField.text;
	 _home   =  _homeTextField.text;
}

-(void) createAddressbook
{
	//createing address book
	_addressBookRef = ABAddressBookCreate(); 
	
	//code to get information about a contact
	CFArrayRef allPeopleRef = ABAddressBookCopyArrayOfAllPeople(_addressBookRef);  
	_recordRef = CFArrayGetValueAtIndex(allPeopleRef, _rowNO);
	CFStringRef allRecordPhonesRef = ABRecordCopyValue(_recordRef, kABPersonPhoneProperty);
	CFIndex nPhones = ABMultiValueGetCount(allRecordPhonesRef);
	
	switch (nPhones)
	{
		case 1:
			_currentPhoneNumberRef = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 0);
			CFArrayRef  dssf =       ABMultiValueCopyArrayOfAllValues(allRecordPhonesRef);
			break;
		case 2:
			_currentPhoneNumberRef = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 0);
			_currentWorkNumberRef  = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 1);
			break;
		case 3:
			_currentPhoneNumberRef = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 0);
			_currentWorkNumberRef  = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 1);
			_currentHomeNumberRef  = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 2);
			break;
		case 0:
			_currentPhoneNumberRef = nil;
			_currentWorkNumberRef  = nil;
			_currentHomeNumberRef  = nil;	
			break;
		default:
			_currentPhoneNumberRef = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 0);
			_currentWorkNumberRef  = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 1);
			_currentHomeNumberRef  = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 2);
			break;
	}
	
	_mobile = [[NSString stringWithFormat:@"%@",_currentPhoneNumberRef] retain]; 
	_home   = [[NSString stringWithFormat:@"%@",_currentHomeNumberRef] retain];
	_work   = [[NSString stringWithFormat:@"%@",_currentWorkNumberRef] retain];
	
	if ([_mobile isEqualToString:@"(null)"])
	{
		_mobile = @"";
	}
	
	if ([_home isEqualToString:@"(null)"])
	{
		_home = @"";
	}
	
	if ([_work isEqualToString:@"(null)"])
	{
		_work = @"";
	}
	
}

-(void) createTextField
{
	CGRect frame = CGRectMake (80, 9, 200 , 28);
	_mobileTextField = [[UITextField alloc] initWithFrame:frame];
	_homeTextField   = [[UITextField alloc] initWithFrame:frame];
	_workTextField   = [[UITextField alloc] initWithFrame:frame];
	_mobileTextField.delegate = self;
    _homeTextField.delegate   = self;
	_workTextField.delegate   = self;

}


#pragma mark -
#pragma mark memory managment

- (void)dealloc 
{
    [super dealloc];
}


@end

