//
//  MainViewController.h
//  myDices
//
//  Created by AA AA on 12/12/03.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import "myDicesAppDelegate.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
  
  
  IBOutlet UILabel* diceLabel;
  IBOutlet UIImageView* diceImage;
  IBOutlet UIButton* diceButton;
   
  
  UIImage* imageD6[6];
  UIImage* imageD2[2];
  
  int face;
    
}

- (IBAction)showInfo:(id)sender;
- (IBAction) throwDice;


@end
