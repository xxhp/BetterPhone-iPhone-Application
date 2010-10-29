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

@implementation ContactsViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//hiding subViews
	_view1.hidden = YES;
	
	//adding button on navigation bar
	UIBarButtonItem*	rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
																				 target:self 
																				 action:@selector(addNewContacts:)];
	self.navigationItem.rightBarButtonItem = rightButton;
	
	//creating address book
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
			contactFirstLast = [NSString stringWithFormat: @"%@  %@", firstName,lastName];
		}
		
		
	  //  NSString *contactFirstLast = [NSString stringWithFormat: @"%@  %@", lastName, firstName];
//		CFRelease(firstName);
//		CFRelease(lastName);
		
		[masterList addObject:contactFirstLast];
		//[contactFirstLast release];
	}
	
	//self.list = masterList;
	//[masterList release];
}

-(void)viewWillAppear:(BOOL)animated
{
	[_table reloadData]; 
}

-(IBAction)addNewContacts:(id)Sender
{
	ABNewPersonViewController *newPerson = [[ABNewPersonViewController alloc] init];
	
	newPerson.newPersonViewDelegate = self;
	
	UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:newPerson];
	
		
	[self presentModalViewController:navigation animated:YES];
	
	[newPerson release];
	[navigation release];	
}

-(IBAction)dismiss:(id)Sender
{
	
}

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
    
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.highlighted = NO; 
	
    // Configure the cell...
	
	cell.textLabel.text = [masterList objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
	[_searchBrar setShowsCancelButton:YES animated:YES];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	
	_view1.hidden = NO;
    _searchBrar.translucent = YES;
	return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
	
	
         	
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Navigation logic may go here. Create and push another view controller.
	
	 InfoViewController *infoViewController = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:infoViewController animated:YES];
	 [infoViewController release];
	 
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[_searchBrar resignFirstResponder];
}






- (void)dealloc
{
    [super dealloc];
}


@end
