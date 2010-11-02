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
 


@interface ContactsViewController : UIViewController  < ABNewPersonViewControllerDelegate ,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate >
{
	NSMutableArray* masterList;
	
	IBOutlet UITableView*      _table;
	IBOutlet UISearchBar*      _searchBrar;
	IBOutlet UINavigationBar*  _navBar;
	
	IBOutlet UIView* _view1;
	NSMutableArray	*filteredListContent;
	
	// The saved state of the search UI if a memory warning removed the view.
    NSString		*savedSearchTerm;
    NSInteger		savedScopeButtonIndex;
    BOOL			searchWasActive;
	
	NSArray*       _faceBookCont;
	
	
}

@end
