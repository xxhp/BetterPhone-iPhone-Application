//
//  KMContactInfo.m
//  KickMe
//

#import "ContactInfo.h"


@implementation ContactInfo

@synthesize name = _name;

+ (id) contactInfoFromRecordRef:(ABRecordRef)recordRef
{
	assert(recordRef);
	
	ContactInfo* contactInfo = [[ContactInfo alloc] initFromRecordRef:recordRef];
	assert(contactInfo);
	
	return [contactInfo	autorelease];
}

- (id) initFromRecordRef:(ABRecordRef)recordRef
{
	assert(recordRef);
	
	if (self = [super init])
	{
		CFTypeRef firstName = ABRecordCopyValue(recordRef, kABPersonFirstNameProperty);
		CFTypeRef lastName = ABRecordCopyValue(recordRef, kABPersonLastNameProperty);
		CFTypeRef nickName = ABRecordCopyValue(recordRef, kABPersonNicknameProperty);
		id nameString = nil;
		
		if (firstName)
		{
			nameString = [[NSMutableString alloc] initWithFormat:@"%@", firstName];
			if (lastName)
				[nameString appendFormat:@" %@", lastName];
		}
		else if (lastName)
		{
			nameString = [[NSString alloc] initWithFormat:@"%@", lastName];
		}
		else if (nickName)
		{
			nameString = [[NSString alloc] initWithFormat:@"%@", nickName];
		}
		else
		{
			nameString = [[NSString alloc] initWithFormat:@"No Name"];
		}

		_name = [nameString retain];
		
		[nameString release];
	}
	
	return self;	
}

- (void) dealloc
{
	[_name	release];	
	[super dealloc];
}

@end
