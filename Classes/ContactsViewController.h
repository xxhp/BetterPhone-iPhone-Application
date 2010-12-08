//
//  ContactsViewController.h
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
 


@interface ContactsViewController : UIViewController  < UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, 
														UISearchBarDelegate ,ABPersonViewControllerDelegate, ABNewPersonViewControllerDelegate>
{
	UITableView*			   _afterSearching;
	
	IBOutlet UITableView*      _table;
	IBOutlet UINavigationBar*  _navBar;
	
	// The saved state of the search UI if a memory warning removed the view.
    NSString*					_savedSearchTerm;
    NSInteger					_savedScopeButtonIndex;
    
	NSArray*					_listContent;			// The master content.
	NSArray*					_faceBookCont;
	NSArray*                   _masterLists;
		   
	BOOL						_canAddToFavourites;
	BOOL						_searchWasActive;
	BOOL                        _viewinDialPadPush;
	BOOL                         _viewPushed;
	
	NSMutableArray*             _recordIds;
	NSMutableArray*             _filteredRecordIds;
	NSMutableArray*				_filteredListContent;
}

@property (nonatomic) BOOL canAddToFavourites;

@end
