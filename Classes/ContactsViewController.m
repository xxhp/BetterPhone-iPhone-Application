//
//  ContactsViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactInfo.h"
#import "InfoViewController.h"
#import "SharedObject.h"

@implementation ContactsViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//hiding subViews
	_view1.hidden = YES;
	
	//adding button on navigation bar
		
	//creating address book
		
}

-(void)viewWillAppear:(BOOL)animated
{
	
	ABAddressBookRef addressBook = ABAddressBookCreate();
	
	CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
	CFIndex      nPeople = ABAddressBookGetPersonCount(addressBook);
	
	NSString *contactFirstLast = [[NSString alloc]init];
	
	masterList = [[NSMutableArray alloc] init];
	
	for (int i = 0; i < nPeople; i++)
	{
		ABRecordRef ref = CFArrayGetValueAtIndex(allPeople, i);
		
		
		
		CFStringRef firstName = ABRecordCopyValue(ref, kABPersonFirstNameProperty);
		CFStringRef lastName  = ABRecordCopyValue(ref, kABPersonLastNameProperty);
		
		if (firstName == nil)
		{
			contactFirstLast = [NSString stringWithFormat: @"%@", lastName];
		}
		else if (lastName == nil)
		{
			contactFirstLast = [NSString stringWithFormat: @"%@", firstName];
		}
	    else  
		{
			contactFirstLast = [NSString stringWithFormat: @"%@ %@", firstName,lastName];
		}
		
		[masterList addObject:contactFirstLast];
	}
	
	
	if (self.tabBarController.selectedIndex == 2)
	{
		UIBarButtonItem*	rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
																					 target:self 
																					 action:@selector(addNewContacts:)];
		self.navigationItem.rightBarButtonItem = rightButton;
	}
		
	if (self.tabBarController.selectedIndex == 0)
	{
		NSLog(@"hello tab");
		
		UIBarButtonItem*	leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
																					 target:self 
																					 action:@selector(dismissModalViews:)];
		self.navigationItem.leftBarButtonItem = leftButton;
	}
	
	_faceBookCont  = [[NSArray alloc] initWithArray:[[SharedObject sharedObj] sharedContacts]];
	
	[_table reloadData]; 
}

-(IBAction)dismissModalViews:(id)Sender
{
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return masterList.count;
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
	
    // Configure the cell...
	
	NSString* str  = [masterList objectAtIndex:indexPath.row];
	 
	//CGRect rect = CGRectMake(10, 10, 20, 20);
	UIImage* img = [UIImage imageNamed:@"image20.ico"];
	UIImageView* imageView = [[UIImageView alloc] initWithImage:img];
	
	[imageView setImage:img];
	
	//int i = indexPath.row;
	
	for (int i = 0; i < _faceBookCont.count; i++)
	{
		NSString* str1 = [_faceBookCont objectAtIndex:i]; 
			
		if ([str isEqualToString:str1]) 
		{
			if (indexPath.row == 2)
			{
				NSLog(@"%d",indexPath.row);
			}
			cell.accessoryView = imageView;  
		}
	}
		
	cell.textLabel.text = [masterList objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark -
#pragma mark tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Navigation logic may go here. Create and push another view controller.
	InfoViewController *infoViewController = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    
	[[SharedObject  sharedObj] setPersonNo:indexPath.row];
	
	// Pass the selected object to the new view controller.
	[self.navigationController pushViewController:infoViewController animated:YES];
	[infoViewController release];
	
	
	
	[[SharedObject sharedObj] addMutableArrayElements:[masterList objectAtIndex:indexPath.row]];
}


#pragma mark -
#pragma mark searchBar delegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
	[_searchBrar setShowsCancelButton:YES animated:YES];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	
	_view1.hidden = NO;
    _searchBrar.translucent = YES;
	return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	_view1.hidden = YES;
}

- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
	[_searchBrar setShowsCancelButton:NO animated:YES];
	[self.navigationController setNavigationBarHidden:NO animated:YES];
	_view1.hidden = YES;
	[_searchBrar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[_searchBrar resignFirstResponder];
}



#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods


#pragma mark -
#pragma mark memory managment

- (void)dealloc
{
    [super dealloc];
}


@end
