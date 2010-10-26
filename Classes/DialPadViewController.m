//
//  DialPadViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DialPadViewController.h"


@implementation DialPadViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	UIImage* image = [UIImage imageNamed:@"cell"];
	
	UIImage* image1 = [UIImage imageNamed:@"calling image"];
			
	[_btn   setImage:image  forState:UIControlStateNormal];
	[_btn1  setImage:image  forState:UIControlStateNormal];
	[_btn2  setImage:image  forState:UIControlStateNormal];
	[_btn3  setImage:image  forState:UIControlStateNormal];
	[_btn4  setImage:image  forState:UIControlStateNormal];
	[_btn5  setImage:image  forState:UIControlStateNormal];
	[_btn6  setImage:image  forState:UIControlStateNormal];
	[_btn7  setImage:image  forState:UIControlStateNormal];
	[_btn8  setImage:image  forState:UIControlStateNormal];
	[_btn9  setImage:image  forState:UIControlStateNormal];
	[_btn10 setImage:image  forState:UIControlStateNormal];
	[_btn11 setImage:image  forState:UIControlStateNormal];
	[_btn12 setImage:image  forState:UIControlStateNormal];
	[_btn13 setImage:image  forState:UIControlStateNormal];
	[_btn14 setImage:image1 forState:UIControlStateNormal];
	[_btn15 setImage:image  forState:UIControlStateNormal];
	[_btn16 setImage:image  forState:UIControlStateNormal];
	
}

-(IBAction)bttonTapped:(id)Sender
{
	NSLog(@"btton pressed");
}


- (void)dealloc {
    [super dealloc];
}


@end
