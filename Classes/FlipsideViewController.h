//
//  FlipsideViewController.h
//  myDices
//
//  Created by AA AA on 12/12/03.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myDicesAppDelegate.h"



@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController <UITableViewDelegate,UITableViewDataSource> {
	id <FlipsideViewControllerDelegate> delegate;
  UIAlertView *notice;
  IBOutlet UINavigationItem* diceNI;
  
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done:(id)sender;
@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end



