//
//  SocialFeedViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SocialFeedViewController.h"




@implementation SocialFeedViewController

-(void)viewDidLoad
{
	faceBooks1 = [[FaceBookContacts alloc] init];
}

-(void)viewWillAppear:(BOOL)animated
{
	
    [faceBooks1 requestForMessages];
}




- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	//return favContacts.count;
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
	
	//cell.textLabel.text = [favContacts objectAtIndex:indexPath.row];    
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
}

#pragma mark -

- (void) session:(FBSession*)session didLogin:(FBUID)uid
{
	//NSString* msg = @"You have sucecessfully logged in";
	//UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message: msg
	//  delegate:self cancelButtonTitle: @"OK" otherButtonTitles: nil];
	//	[alert show];
	



}


- (void) request:(FBRequest*)request didLoad:(id)result
{
//	NSArray* friends = result;
//    
//	NSDictionary* friend = nil;
//	for (friend in friends)
//	{
//		NSString* name = [[friend objectForKey:@"name"] retain];
//		
//		NSArray* data = [[NSArray alloc] initWithArray:[[SharedObject sharedObj] sharedContacts]];
//		
//		if(data.count == 0)
//		{
//			[[SharedObject sharedObj] addMutableArrayElements1:name];
//		}
//		else
//		{
//			for (int i = 0; i < data.count ; i++)
//		    {
//			    NSString* str = [data objectAtIndex:i];
//				
//				if (![str isEqualToString:name])
//			    {
//					NSLog(@"%d",i);
//					_testing = YES;
//				}
//				else
//				{
//					_testing = NO;
//					break;
//				}
//			}
//		}
//		
//		if (_testing == YES)
//		{
//			[[SharedObject sharedObj] addMutableArrayElements1:name];
//		}
//	}	
}



- (void)dealloc
{
    [super dealloc];
}


@end
