//
//  KMContactInfo.h
//  KickMe
//

#import <AddressBook/AddressBook.h>

@interface ContactInfo : NSObject
{
	NSString*	_name;
}

@property (nonatomic, readonly)	NSString*	name;

+ (id) contactInfoFromRecordRef:(ABRecordRef)recordRef;
- (id) initFromRecordRef:(ABRecordRef)recordRef;

@end
