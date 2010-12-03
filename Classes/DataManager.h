//
//  DataManager.h
//  BetterPhone
//
//  Created by Manish Jain  on 10/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#include <AddressBook/AddressBook.h>

#import <Foundation/Foundation.h>


@interface DataManager : NSObject 
{
	BOOL _repetion;
	BOOL _canAddToContacts;
	BOOL _isShowAddScreen;
	BOOL _isfirstTabActivated;
	
	int  _personNo; 
	
	NSMutableArray*		_sharedList;
	NSMutableArray*		_sharedContacts;
	NSMutableArray*		_sharedStatus;
	NSMutableArray*		_masterList; 
	NSMutableArray*		_masterContactList;
	NSMutableArray*		_favouritesArray;
	NSMutableArray*     _indexarrayForFaviourites;
	NSString*			_mobileNumber;
	NSArray*			_messageData;
	
	NSMutableArray*		_recordPersonId;
	ABAddressBookRef	_ref;
	
	
}


@property (nonatomic, retain) NSMutableArray* sharedList; 
@property (nonatomic, retain) NSMutableArray* sharedContacts;
@property (nonatomic, retain) NSMutableArray* indexarrayForFaviourites;
@property (nonatomic, retain) NSMutableArray* sharedStatus;
@property (nonatomic, retain) NSMutableArray* masterList;
@property (nonatomic, retain) NSMutableArray* masterContactList;
@property (nonatomic, retain) NSMutableArray* favouritesArray;
@property (nonatomic, retain) NSString* mobileNumber;
@property (nonatomic, retain) NSArray* messageData;
@property (nonatomic, retain) NSMutableArray* recordPersonId;
@property (nonatomic) BOOL    isShowAddScreen;
@property (nonatomic) BOOL    canAddToContacts;
@property (nonatomic) BOOL        isfirstTabActivated;
@property (nonatomic) BOOL    repetion; 
@property (nonatomic) int     personNo; 
@property (nonatomic)         ABAddressBookRef ref;

+ (DataManager*) sharedObj;



@end
