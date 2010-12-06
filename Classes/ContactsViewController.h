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
 


@interface ContactsViewController : UIViewController  < UITableViewDataSource, UITableViewDelegate, 
														UISearchDisplayDelegate, UISearchBarDelegate ,ABPersonViewControllerDelegate, ABNewPersonViewControllerDelegate>
{
	NSArray*                   _masterLists;
	UITableView*			   _afterSearching;
	
	IBOutlet UITableView*      _table;
	IBOutlet UINavigationBar*  _navBar;
	
	NSMutableArray			   *filteredListContent;
	
	// The saved state of the search UI if a memory warning removed the view.
    NSString*					_savedSearchTerm;
    NSInteger					_savedScopeButtonIndex;
    
	
	NSArray*					_faceBookCont;
	NSMutableArray*             _recordIds;
	NSMutableArray*             _filteredRecordIds;
	   
	BOOL						_canAddToFavourites;
	BOOL						_searchWasActive;
	
	BOOL                        _viewinDialPadPush;
	
	BOOL                         _viewPushed;
	
	NSArray*					_listContent;			// The master content.
	NSMutableArray*				_filteredListContent;
}

@property (nonatomic) BOOL canAddToFavourites;

@end
