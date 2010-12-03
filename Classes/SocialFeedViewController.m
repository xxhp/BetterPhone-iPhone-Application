//
//  SocialFeedViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SocialFeedViewController.h"
#import "FaceBookContacts.h"
#import "DataManager.h"
#import "FBRequest.h"


@interface SocialFeedViewController (privateMethod) 

- (NSString*) getRecentUpdateFriendWithName:(NSString*)string;
- (void) checkingContacts;

@end


@implementation SocialFeedViewController

-(void)viewDidLoad
{
	_contacts         = [[NSArray alloc] init];
	_faceBookContacts = [[NSArray alloc] init];
	_local            = [[NSArray alloc] init];
	
	[_activity startAnimating];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadDataofTable:)    name:@"notify" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changingViewData:)     name:@"connectionResponse" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chagingContentValue:)  name:@"connectionResponsepositive" object:nil];
	
	_table.hidden = NO;
	[self.view addSubview:_table]; 
}

-(void)viewWillAppear:(BOOL)animated
{
	[self performSelector:@selector(removeSpinner)   withObject:_activity   afterDelay:3.0];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"connectionNotice" object:nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"noticeFromSocialFeed" object:nil];
	
	_contacts          = [[DataManager sharedObj] masterContactList];
	_faceBookContacts  = [[NSArray alloc] initWithArray:[[DataManager sharedObj] sharedContacts]];
	_local             = [[DataManager sharedObj] messageData];
	
	
	if (_tableContent == NO)
	{
		[self checkingContacts];
	}
	[_table reloadData]; 
}

-(void) changingViewData:(NSNotification*)notification
{
	[self.view  addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"feed_not_connected.png"]]]; 
	_tableContent = YES;
	_table.hidden = YES;
}

-(void) chagingContentValue:(NSNotification*)notification
{
	_tableContent = NO;
}

- (void)removeSpinner
{
    [_activity stopAnimating];
    [_activity removeFromSuperview];
}

-(IBAction)reloadDataofTable:(id)Sender
{
	[self viewWillAppear:YES];
}

#pragma mark -
#pragma mark table datasource

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	 return _contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
	cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
	}
	
	cell.accessoryView = nil;
	cell.detailTextLabel.text = nil;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.highlighted = NO; 
	
	// Configure the cell...
	
	_local = [[DataManager sharedObj] messageData];
	
	NSString* str = [_contacts objectAtIndex:indexPath.row];
	
	UIImage* img = [UIImage imageNamed:@"image20.ico"];
	UIImageView* imageView = [[UIImageView alloc] initWithImage:img];
	
	[imageView setImage:img];
	
	for (int i = 0; i < _faceBookContacts.count; i++)
	{
		NSString* str1 = [_faceBookContacts objectAtIndex:i]; 
	
			if ([str isEqualToString:str1]) 
			{
				_counts = _counts + 1;
				
				if (_local.count > 0)
				{
					cell.detailTextLabel.text = [self getRecentUpdateFriendWithName:str];
				}

				cell.accessoryView = imageView; 
			}
	}
	
	cell.textLabel.text = [_contacts objectAtIndex:indexPath.row];
	return cell;
}

- (NSString*) getRecentUpdateFriendWithName:(NSString*)string
{
	for (id friend in _local)
	{
		NSString* name = [friend valueForKey:@"name"];
		if ([name isKindOfClass:[NSNull class]])
			 return @"";
			 
		if (name && [name isEqualToString:string])
		{
			NSDictionary* status = [friend objectForKey:@"status"];
			NSString* statusMessage = [status valueForKey:@"message"];

			return ([statusMessage isKindOfClass:[NSNull class]]) ? @"" : statusMessage;
		}
	}
	return @"";
}


-(void) checkingContacts
{
	_counts = 0;
	for (int i = 0; i < _contacts.count; i++)
	{
		NSString* string = [_contacts objectAtIndex:i];
		
		for (int j = 0; j < _faceBookContacts.count; j++)
		{
			NSString* string1 = [_faceBookContacts objectAtIndex:j]; 
			
			if ([string isEqualToString:string1]) 
			{
				_counts = _counts + 1;
			}
		}
	}
	if (_counts == 0)
	{
		_table.hidden = YES;
		[self.view  addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"feed_no_match.png"]]]; 
	}
	else
	{
		_table.hidden = NO;
		[self.view addSubview:_table];
	}
}

#pragma mark -
#pragma mark memory managment

- (void)dealloc
{
    [super dealloc];
	_ReleaseObject(_faceBookContacts);
	_ReleaseObject(_contacts);
}


@end
