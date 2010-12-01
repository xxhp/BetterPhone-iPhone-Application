//
//  DataManager.h
//  BetterPhone
//
//  Created by Manish Jain  on 10/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataManager : NSObject 
{
	BOOL _repetion;
	BOOL _canAddToContacts;
	
	int  _personNo; 
	
	NSMutableArray* _sharedList;
	NSMutableArray* _sharedContacts;
	NSMutableArray* _sharedStatus;
	NSMutableArray* _masterList; 
	NSMutableArray* _masterContactList;
	NSMutableArray* _favouritesArray;
	NSString*		_mobileNumber;
	NSArray*        _messageData;
	
	NSMutableArray* _recordPersonId;
}

@property (nonatomic, readwrite) BOOL  repetion; 
@property (nonatomic) BOOL canAddToContacts;
@property (nonatomic, retain) NSMutableArray* sharedList; 
@property (nonatomic, retain) NSMutableArray* sharedContacts;
@property (nonatomic, retain) NSMutableArray* sharedStatus;
@property (nonatomic, retain) NSMutableArray* masterList;
@property (nonatomic, retain) NSMutableArray* masterContactList;
@property (nonatomic) int personNo; 
@property (nonatomic, retain) NSMutableArray* favouritesArray;
@property (nonatomic, retain) NSString* mobileNumber;
@property (nonatomic, retain) NSArray* messageData;
@property (nonatomic, retain) NSMutableArray* recordPersonId;

+ (DataManager*) sharedObj;



@end
