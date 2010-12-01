
#pragma mark -

#define _RetainObject(obj)					if (obj) [obj retain]
#define	_ReleaseObject(obj)					if (obj) { [obj release]; obj = nil; }
#define	_AutoReleaseObject(obj)				if (obj) { [obj autorelease]; obj = nil; }
#define _SetRetained(obj, anotherObj)		if (obj != anotherObj) { _ReleaseObject(obj); if (anotherObj) obj = [anotherObj retain]; }

//FaceBook api for connection
#define kFacebookApiKey				@"a3f05ed9a29f396135f4ebe9d051dba2"
#define kFacebookSecretKey			@"a77d1e8c392104af526e8d40b7108547"
#define kFacebookSessionProxy		nil