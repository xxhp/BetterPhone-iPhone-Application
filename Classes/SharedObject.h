//
//  SharedObject.h
//  BetterPhone
//
//  Created by Manish Jain  on 10/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SharedObject : NSObject 
{

	BOOL _repetion;
	
	int  _personNo; 
	
	NSMutableArray* _sharedList;
	
	NSMutableArray* _sharedContacts;
}

@property (nonatomic, readwrite) BOOL  repetion; 
@property (nonatomic, retain) NSMutableArray* sharedList; 
@property (nonatomic, retain) NSMutableArray* sharedContacts;
@property (nonatomic) int personNo; 

+ (SharedObject*) sharedObj;
-(void)addMutableArrayElements:(NSString*)str; 
-(void)addMutableArrayElements1:(NSString*)str;

@end
