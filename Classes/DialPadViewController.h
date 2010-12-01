//
//  DialPadViewController.h
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface DialPadViewController : UIViewController <UIActionSheetDelegate, ABNewPersonViewControllerDelegate>
{

	IBOutlet UIButton* _btn;
	IBOutlet UIButton* _btn1;
	IBOutlet UIButton* _btn2;
	IBOutlet UIButton* _btn3;
	IBOutlet UIButton* _btn4;
	IBOutlet UIButton* _btn5;
	IBOutlet UIButton* _btn6;
	IBOutlet UIButton* _btn7;
	IBOutlet UIButton* _btn8;
	IBOutlet UIButton* _btn9;
	IBOutlet UIButton* _btn10;
	IBOutlet UIButton* _btn11;
	IBOutlet UIButton* _btn12;
	IBOutlet UIButton* _btn13;
	IBOutlet UIButton* _btn14;
	IBOutlet UIButton* _btn16;
	
	IBOutlet UITextField* _text;
	NSMutableArray* _phoneNOString;
}

-(IBAction)firstBttonTapped:(id)Sender;
-(IBAction)secondBttonTapped:(id)Sender;
-(IBAction)thirdBttonTapped:(id)Sender;
-(IBAction)fourthBttonTapped:(id)Sender;
-(IBAction)fifthBttonTapped:(id)Sender;
-(IBAction)sixthBttonTapped:(id)Sender;
-(IBAction)sevenBttonTapped:(id)Sender;
-(IBAction)eitghtBttonTapped:(id)Sender;
-(IBAction)ninthBttonTapped:(id)Sender;
-(IBAction)tenthBttonTapped:(id)Sender;
-(IBAction)elevenBttonTapped:(id)Sender;
-(IBAction)tweleveBttonTapped:(id)Sender;
-(IBAction)therteenBttonTapped:(id)Sender;
-(IBAction)fourteenBttonTapped:(id)Sender;

extern NSString * const notifying;

@end

@interface myButton : UIButton
{
	IBOutlet UIButton* _btn15;
	NSTimer* _holdTimer;
	NSTimer* _holdAnother;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void) touchesMoved:(NSSet*) touches withEvent:(UIEvent*)event;
- (void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event;

@end


