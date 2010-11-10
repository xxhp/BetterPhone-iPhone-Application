//
//  DCFaceBookContacts.h
//  DC
//

#import "FBSession.h"
#import "FBRequest.h"
#import "FBConnect.h"

@interface FaceBookContacts : NSObject <FBSessionDelegate, FBRequestDelegate>
{
	FBSession*		_session;
	FBLoginDialog*	_loginDialog;
	FBRequest*       _req; 
	
	BOOL _posting;
	BOOL _testing;  
}

@property (nonatomic, retain) FBLoginDialog*	loginDialog;
@property (nonatomic, retain) FBSession*	    session;

- (void) showLoginDialog;
- (void) logout;
- (void) requestForMessages;

@end
