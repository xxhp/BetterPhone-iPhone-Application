//
//  FavouritesViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FavouritesViewController.h"
#import "ContactsViewController.h"


@implementation FavouritesViewController


-(void)viewDidLoad
{
	UIBarButtonItem*	rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
																				 target:self 
																				 action:@selector(addNewContacts:)];
	self.navigationItem.rightBarButtonItem = rightButton;
	
	self.navigationItem.leftBarButtonItem = ((UIViewController*)self).editButtonItem;
	
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated 
{	
	[super setEditing:editing animated:animated];	
	[_table setEditing:editing animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) 
		[_table reloadData];
	
//	
//	[_table removeObjectAtIndex:indexPath.row];
//	[_table reloadData];
	
}

-(IBAction)addNewContacts:(id)Sender
{
      ContactsViewController* contacts = [[ContactsViewController alloc] init];	
	
	  	UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:contacts];
      
	  [self.navigationController presentModalViewController:navigation animated:YES];
	
}


#pragma mark -
#pragma mark tableView DataSource

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	
	    
    return cell;
}



- (void)dealloc 
{
    [super dealloc];
}


@end
