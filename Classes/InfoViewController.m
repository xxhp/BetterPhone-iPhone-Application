//
//  InfoViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"


@implementation InfoViewController

@synthesize rowNO = _rowNO;

-(void)viewDidLoad
{

}

-(void)viewWillAppear:(BOOL)animated
{
	ABAddressBookRef addressBookRef = ABAddressBookCreate(); 
	
	CFArrayRef allPeopleRef = ABAddressBookCopyArrayOfAllPeople(addressBookRef);  
		
	ABRecordRef recordRef   = CFArrayGetValueAtIndex(allPeopleRef, _rowNO);
		
	CFStringRef allRecordPhonesRef = ABRecordCopyValue(recordRef, kABPersonPhoneProperty);
		
	CFIndex nPhones = ABMultiValueGetCount(allRecordPhonesRef);
	
	//CFArrayRef array =   ABMultiValueCopyArrayOfAllValues(allRecordPhonesRef);
	
	switch (nPhones)
	{
		case 1:
			   currentPhoneNumberRef = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 0);
			   break;
		case 2:
			   currentPhoneNumberRef = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 0);
			   currentWorkNumberRef  = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 1);
			   break;
		case 3:
			   currentPhoneNumberRef = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 0);
			   currentWorkNumberRef  = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 1);
			   currentHomeNumberRef  = ABMultiValueCopyValueAtIndex(allRecordPhonesRef, 2);
	           break;
		case 0:
			   currentPhoneNumberRef = NULL;
			   currentWorkNumberRef  = NULL;
			   currentHomeNumberRef  = NULL;		
			   break;
	}
	
	
	[_table reloadData];
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
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.textColor = [[UIColor alloc]initWithRed:0.3 green:0.5 blue:0.7 alpha:1];
	
	NSString* str = [NSString stringWithFormat: @"mobile      %@",currentPhoneNumberRef]; 
	NSString* str1 = [NSString stringWithFormat:@"home        %@",currentHomeNumberRef];
	NSString* str2 = [NSString stringWithFormat:@"work         %@",currentWorkNumberRef];
	
    // Configure the cell...
	switch (indexPath.row)
	{
		case 0:
			   cell.textLabel.text = str1;
			   break;
	    case 1:
			  	cell.textLabel.text = str;
				break;
        case  2:
				cell.textLabel.text = str2;
			    break;
 		default:
			    NSLog(@"hello");
			    break;
	}
	  
    return cell;
}


#pragma mark -
#pragma mark memory managment

- (void)dealloc 
{
    [super dealloc];
}


@end

