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

- (NSString*) getIndividualPhoneRecord:(NSNumber*)recordNumber;

@end

@implementation FavouritesViewController

-(void)viewDidLoad
{
	UIBarButtonItem*	rightButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
																				 target:self 
																				 action:@selector(addNewContacts:)] autorelease];
	self.navigationItem.rightBarButtonItem = rightButton;
	self.navigationItem.leftBarButtonItem = ((UIViewController*)self).editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
	_favContacts = [[NSArray alloc] initWithArray:[[DataManager sharedObj] favouritesArray]];
	_favIndex    = [[NSArray alloc] initWithArray:[[DataManager sharedObj] indexarrayForFaviourites]]; 
	
	[[DataManager sharedObj]  setIsfirstTabActivated:YES];
	[_table reloadData];
}

-(void) viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:YES];
	[[DataManager sharedObj]  setIsfirstTabActivated:NO];
}

#pragma mark -
#pragma mark edit button delegate

- (void)setEditing:(BOOL)editing animated:(BOOL)animated 
{	
	[super  setEditing:editing animated:animated];	
	[_table setEditing:editing animated:YES];
}

- (void) tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath 
{
	if (editingStyle == UITableViewCellEditingStyleDelete) 
	{
		[[DataManager sharedObj].favouritesArray removeObjectAtIndex:indexPath.row];
		[[DataManager sharedObj].indexarrayForFaviourites removeObjectAtIndex:indexPath.row];
		[self viewWillAppear:YES];
	}
}

#pragma mark -

-(IBAction) addNewContacts:(id)Sender
{
	ContactsViewController* contacts = [[ContactsViewController alloc] init];	
	contacts.canAddToFavourites = YES;
	UINavigationController *navigation1 = [[UINavigationController alloc] initWithRootViewController:contacts];
	
	[self.navigationController presentModalViewController:navigation1 animated:YES];
	[navigation1 release];
}

-(IBAction) dismissModalViews:(id)Sender
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
	
	NSString* call = [self getIndividualPhoneRecord:[_favIndex objectAtIndex:indexPath.row]];
	
	NSString *phoneNumberScheme = [NSString stringWithFormat:@"tel:%@",call];
	phoneNumberScheme = [phoneNumberScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberScheme]];
}

- (NSString*) getIndividualPhoneRecord:(NSNumber*)recordNumber
{
	NSArray* recordIds = [[DataManager sharedObj] recordPersonId];
	ABRecordRef ref = [recordIds objectAtIndex:[recordNumber intValue]];
	ABMultiValueRef allRecordPhonesRef = ABRecordCopyValue(ref, kABPersonPhoneProperty);
	
	NSString* mobileLabel;
	NSString* mobile;
	         
	for(CFIndex i = 0; i<ABMultiValueGetCount(allRecordPhonesRef); i++)
	{
		mobileLabel=(NSString*)ABMultiValueCopyLabelAtIndex(allRecordPhonesRef, i);
		mobile=(NSString*)ABMultiValueCopyValueAtIndex(allRecordPhonesRef,i);
	}
	return mobile;
}

#pragma mark -
#pragma mark memory managment

- (void)dealloc 
{
	_ReleaseObject(_favContacts);
	_ReleaseObject(_favIndex);
	[super dealloc];
}


@end
