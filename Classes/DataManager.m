//
//  DataManager.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"

static DataManager*	sDataManager = nil;

@implementation DataManager

@synthesize repetion					= _repetion;
@synthesize canAddToContacts			= _canAddToContacts;
@synthesize personNo					= _personNo;
@synthesize sharedList					= _sharedList;
@synthesize sharedContacts				= _sharedContacts;
@synthesize sharedStatus				= _sharedStatus;
@synthesize masterList					= _masterList;
@synthesize masterContactList			= _masterContactList;
@synthesize favouritesArray				= _favouritesArray;
@synthesize mobileNumber				= _mobileNumber;
@synthesize messageData					= _messageData;
@synthesize recordPersonId				= _recordPersonId;
@synthesize isShowAddScreen				= _isShowAddScreen;
@synthesize ref							= _ref;
@synthesize indexarrayForFaviourites	= _indexarrayForFaviourites;
@synthesize isfirstTabActivated         = _isfirstTabActivated;


+ (DataManager*) sharedObj
{
	@synchronized(self) 
	{
		if (sDataManager == nil)
		{
			sDataManager = [[DataManager alloc] init];
		}
	}
	return sDataManager;
}

- (id) init
{
	if (self = [super init])
	{
		_sharedList		   = [[NSMutableArray alloc] init];
	    _sharedContacts    = [[NSMutableArray alloc] init];
		_sharedStatus      = [[NSMutableArray alloc] init];
		_masterList        = [[NSMutableArray alloc] init];
		_masterContactList = [[NSMutableArray alloc] init];
		_favouritesArray   = [[NSMutableArray alloc] init];
		_messageData       = [[NSArray alloc] init];
		_recordPersonId    = [[NSMutableArray alloc] init];
		_indexarrayForFaviourites = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void)dealloc 
{
    _ReleaseObject(_sharedList);
	_ReleaseObject(_sharedContacts);
	_ReleaseObject(_sharedStatus);
	_ReleaseObject(_masterList);
	_ReleaseObject(_masterContactList);
	_ReleaseObject(_favouritesArray);
	_ReleaseObject(_messageData);
	_ReleaseObject(_recordPersonId);
	_ReleaseObject(_indexarrayForFaviourites); 
	[super dealloc];
}

@end
