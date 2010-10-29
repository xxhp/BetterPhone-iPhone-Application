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
}

@property (nonatomic, readwrite) BOOL  repetion; 

+ (SharedObject*) sharedObj;

@end
