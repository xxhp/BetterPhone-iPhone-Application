//
// FavouritesViewController.h
// BetterPhone
//
// Created by Manish Jain  on 10/22/10.
// Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface FavouritesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate >
{
	IBOutlet UITableView*	_table;
	
	NSArray*				_favContacts;
	NSArray*                _favIndex;
	NSArray*                _recordIds;
}

@end