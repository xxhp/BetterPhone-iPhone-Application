//
//  ContactsViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContactsViewController.h"
#import "DataManager.h"
#import "BetterPhoneAppDelegate.h"


@interface ContactsViewController (privateMethod)

-(void) showPersonViewController:(ABRecordRef)str;
-(void) adjustView;

@end


@implementation ContactsViewController

@synthesize canAddToFavourites = _canAddToFavourites;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	_masterLists         = [[NSArray alloc] init];
	_listContent         = [[NSArray alloc] init];
	_filteredListContent = [[NSMutableArray alloc] init];
	_filteredRecordIds   = [[NSMutableArray alloc] init];

	_afterSearching      = _table;
}

-(void)viewWillAppear:(BOOL)animated
{
	[_recordIds removeAllObjects];
	
	[[DataManager sharedObj].masterContactList removeAllObjects];
	[[DataManager sharedObj].recordPersonId    removeAllObjects];
	
	BetterPhoneAppDelegate* app = [[UIApplication sharedApplication] delegate];
	[app getContactsList];
	
    _masterLists = [[DataManager sharedObj] masterContactList];
	
	[self adjustView];
		
	_faceBookCont		= [[NSArray alloc] initWithArray:[[DataManager sharedObj] sharedContacts]];
	_recordIds			= [[DataManager sharedObj] recordPersonId];

	_listContent        = [[NSArray arrayWithArray:_masterLists] retain];
	
    if(_viewPushed == YES && self.tabBarController.selectedIndex == 2)
	{
		_viewPushed = NO; 
	}
	else
	{
		[_filteredRecordIds removeAllObjects];
		_filteredRecordIds   = [[NSMutableArray alloc] initWithArray:_recordIds];
	}
	
	if(self.tabBarController.selectedIndex == 2)
	{
		[[DataManager sharedObj] setIsShowAddScreen:NO];
	}
	
	if (_viewinDialPadPush == YES)
	{
		[self dismissModalViewControllerAnimated:YES];
		_viewinDialPadPush = NO; 
	}
	
	BOOL checkingValue =  [[DataManager sharedObj] isfirstTabActivated];
	
	if (checkingValue == YES)
	{
		[[DataManager sharedObj] setIsShowAddScreen:NO];
	}
	
	[_table reloadData]; 
}

-(void) adjustView
{
	if (self.tabBarController.selectedIndex == 2)
	{
		UIBarButtonItem*	rightButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
																					  target:self 
																					  action:@selector(addNewContacts:)]autorelease];
		self.navigationItem.rightBarButtonItem = rightButton;
	}
	
	if (self.tabBarController.selectedIndex == 0)
	{
		UIBarButtonItem*	leftButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
																					 target:self 
																					 action:@selector(dismissModalViews:)] autorelease];
		self.navigationItem.leftBarButtonItem = leftButton;
	}
}

- (void)viewDidUnload
{
	_filteredListContent = nil;
	_filteredRecordIds   = nil;
}

-(IBAction)dismissModalViews:(id)Sender
{
	[DataManager sharedObj].canAddToContacts = NO;
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark action method

-(IBAction)addNewContacts:(id)Sender
{
	ABNewPersonViewController *newPerson = [[ABNewPersonViewController alloc] init];
	newPerson.newPersonViewDelegate = self;
	
	UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:newPerson];
		
	[self presentModalViewController:navigation animated:YES];
	
	[newPerson release];
	[navigation release];	
}

#pragma mark -
#pragma mark tableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_table == self.searchDisplayController.searchResultsTableView)
	        return [_filteredListContent count];
    else
	        return [_listContent count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.accessoryView = nil;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.highlighted = NO; 
	
	UIImage* img = [UIImage imageNamed:@"image20.ico"];
	UIImageView* imageView = [[UIImageView alloc] initWithImage:img];
	
	[imageView setImage:img];
	
	
    // Configure the cell...
	if (_table == self.searchDisplayController.searchResultsTableView)
	{
        NSString* str  = [_filteredListContent objectAtIndex:indexPath.row];
		
		for (int i = 0; i < _faceBookCont.count; i++)
		{
			NSString* str1 = [_faceBookCont objectAtIndex:i]; 
			
			if ([str isEqualToString:str1]) 
			{
				cell.accessoryView = imageView;  
			}
		}
		cell.textLabel.text = [_filteredListContent objectAtIndex:indexPath.row];
    }
	else
	{
        NSString* str  = [_listContent objectAtIndex:indexPath.row];
		
		for (int i = 0; i < _faceBookCont.count; i++)
		{
			NSString* str1 = [_faceBookCont objectAtIndex:i]; 
			
			if ([str isEqualToString:str1]) 
			{
				cell.accessoryView = imageView;  
			}
		}
		
		cell.textLabel.text = [_listContent objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark -
#pragma mark tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	ABRecordRef personID      = [_filteredRecordIds objectAtIndex:indexPath.row];
	
	ABAddressBookRef addressref = [[DataManager sharedObj] ref]; 
	
	
	if(self.tabBarController.selectedIndex == 2)
	{
		[[DataManager sharedObj] setIsShowAddScreen:NO];
		[self showPersonViewController:personID];
	}
	
	
	if ([DataManager sharedObj].isShowAddScreen == YES ) 
	{
		_viewinDialPadPush = YES;
		
		CFErrorRef anError = NULL;
		
		//code to save data in address book	
		
		ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
		ABMultiValueAddValueAndLabel(multiPhone, [DataManager sharedObj].mobileNumber, kABPersonPhoneMainLabel, NULL);  
		ABRecordSetValue(personID, kABPersonPhoneProperty, multiPhone, &anError);
		CFRelease(multiPhone);
		
		ABAddressBookSave(addressref, &anError);
		
		[DataManager sharedObj].mobileNumber = nil;
		[self showPersonViewController:personID];
	}
	else
	{
		_viewPushed = YES;
		
		NSUInteger indes = [_recordIds indexOfObject:personID];

		if (_canAddToFavourites) 
		{
			CFStringRef allRecordPhonesRef  = ABRecordCopyValue(personID, kABPersonPhoneProperty);
			CFIndex nPhones = ABMultiValueGetCount(allRecordPhonesRef);
			
			if (nPhones) 
			{
				if ([[DataManager sharedObj].favouritesArray count] == 0) 
				{
					[[DataManager sharedObj].favouritesArray addObject:[_masterLists objectAtIndex:indes]];
					[[DataManager sharedObj].indexarrayForFaviourites addObject:[NSNumber numberWithInt:indes]];
					[self dismissModalViewControllerAnimated:YES];
				}
				else 
				{
					NSString* mObject = [[NSString alloc] initWithString:[_masterLists objectAtIndex:indes]];
					if ([[DataManager sharedObj].favouritesArray containsObject:mObject])
					{	
						[self dismissModalViewControllerAnimated:YES];
					}
					else 
					{
						[[DataManager sharedObj].favouritesArray addObject:[_masterLists objectAtIndex:indes]];
						[[DataManager sharedObj].indexarrayForFaviourites addObject:[NSNumber numberWithInt:indes]];
						[self dismissModalViewControllerAnimated:YES];
					}
				}
			}
			else 
			{
				[self showPersonViewController:personID];
			}
		}
	}
}

#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	[_filteredListContent removeAllObjects]; // First clear the filtered array.
	[_filteredRecordIds   removeAllObjects];
	
	for (int i = 0; i <_listContent.count; i++)
	{
		NSString* abc = [_listContent objectAtIndex:i];
		NSComparisonResult result = [abc compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        if (result == NSOrderedSame)
		{
			[_filteredListContent addObject:abc];
		    [_filteredRecordIds   addObject:[_recordIds objectAtIndex:i]]; 
		}
    }
}

#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
	[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
	_table = self.searchDisplayController.searchResultsTableView;
    
	// Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
	[searchBar setShowsCancelButton:NO animated:YES];
	_table = _afterSearching;

	[self.navigationController setNavigationBarHidden:NO animated:YES];
	[searchBar resignFirstResponder];
}

-(void)showPersonViewController:(ABRecordRef)str 
{
	// Fetch the address book 

	ABPersonViewController *picker = [[[ABPersonViewController alloc] init] autorelease];
	picker.personViewDelegate = self;
	picker.displayedPerson = str;
	
	// Allow users to edit the person’s information
	if (self.tabBarController.selectedIndex == 0)
	{
		picker.allowsEditing = NO;
	}
	else
	{
		picker.allowsEditing = YES;
	}
	
	if ([DataManager sharedObj].isShowAddScreen == YES) 
	{
		picker.allowsEditing = YES;
	}
		
	[self.navigationController pushViewController:picker animated:YES];
}


#pragma mark -
#pragma mark memory managment

- (void)dealloc
{
    _ReleaseObject(_masterLists);
	[_listContent release];
	[_filteredListContent release];
	[super dealloc];
}

@end
