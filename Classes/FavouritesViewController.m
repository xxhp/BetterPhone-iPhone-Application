//
// FavouritesViewController.m
// BetterPhone
//
// Created by Manish Jain  on 10/22/10.
// Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FavouritesViewController.h"
#import "ContactsViewController.h"
#import "DataManager.h"

@interface FavouritesViewController (PrivateMethods)

- (CFStringRef) getIndividualPhoneRecord:(int)recordNumber;

@end

@implementation FavouritesViewController


-(void)viewDidLoad
{
	UIBarButtonItem*	rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
																				 target:self 
																				 action:@selector(addNewContacts:)];
	self.navigationItem.rightBarButtonItem = rightButton;
	
	self.navigationItem.leftBarButtonItem = ((UIViewController*)self).editButtonItem;
	
}

-(void)viewWillAppear:(BOOL)animated
{
	_favContacts = [[NSArray alloc] initWithArray:[[DataManager sharedObj] favouritesArray]];
	[_table reloadData];
}

#pragma mark -
#pragma mark edit button delegate

- (void)setEditing:(BOOL)editing animated:(BOOL)animated 
{	
	[super setEditing:editing animated:animated];	
	[_table setEditing:editing animated:YES];
}

- (void) tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath 
{
	if (editingStyle == UITableViewCellEditingStyleDelete) 
	{
		[[DataManager sharedObj].favouritesArray removeObjectAtIndex:indexPath.row];
		[self viewWillAppear:YES];
	}
}

#pragma mark -

-(IBAction)addNewContacts:(id)Sender
{
	ContactsViewController* contacts = [[ContactsViewController alloc] init];	
	contacts.canAddToFavourites = YES;
	UINavigationController *navigation1 = [[UINavigationController alloc] initWithRootViewController:contacts];
	
	[self.navigationController presentModalViewController:navigation1 animated:YES];
}

-(IBAction)dismissModalViews:(id)Sender
{
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark tableView DataSource

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return _favContacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// Configure the cell...
	
	if ([_favContacts count]) 
		cell.textLabel.text = [_favContacts objectAtIndex:indexPath.row]; 
	else 
		return cell;
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	CFStringRef currentPhoneNumberRef = [self getIndividualPhoneRecord:indexPath.row];
	NSString* call = (NSString *)currentPhoneNumberRef;
	
	NSString *phoneNumberScheme = [NSString stringWithFormat:@"tel:%@",call];
	phoneNumberScheme = [phoneNumberScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberScheme]];
}

- (CFStringRef) getIndividualPhoneRecord:(int)recordNumber
{
	ABAddressBookRef addressBook = ABAddressBookCreate();
	CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
	CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
	
	NSString *contactFirstLast = [[NSString alloc] init];
	
	for (int i = 0; i < nPeople; i++)
	{
		ABRecordRef ref = CFArrayGetValueAtIndex(allPeople, i);
		
		CFStringRef firstName = ABRecordCopyValue(ref, kABPersonFirstNameProperty);
		CFStringRef lastName = ABRecordCopyValue(ref, kABPersonLastNameProperty);
		
		if (firstName == nil)
			contactFirstLast = [NSString stringWithFormat: @"%@", lastName];
		else if (lastName == nil)
			contactFirstLast = [NSString stringWithFormat: @"%@", firstName];
		else 
			contactFirstLast = [NSString stringWithFormat: @"%@ %@", firstName,lastName];
		
		if ([contactFirstLast isEqualToString:[_favContacts objectAtIndex:recordNumber]]) 
		{
			CFStringRef allRecordPhonesRef = ABRecordCopyValue(ref, kABPersonPhoneProperty);
			return allRecordPhonesRef;
		}
	}
	
	
	return nil;
}


#pragma mark -
#pragma mark memory managment

- (void)dealloc 
{
	[super dealloc];
	_ReleaseObject(_favContacts);
}


@end
