//
//  MainViewController.m
//  myDices
//
//  Created by AA AA on 12/12/03.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

//when push button
//面数をチェックし表示を変える
- (IBAction) throwDice{
  
  myDicesAppDelegate *appDelegate ;
  appDelegate = (myDicesAppDelegate *)[[UIApplication sharedApplication] delegate];
  
  diceFaceType df = [appDelegate diceFace];
  
  switch (df) {
    case d2:
      face = 2;
      break;
    case d6:
      face = 6;
      break;

    default:
      face = 6;
      break;
  }
  

  int diceValue = rand()%face;
  
  NSString *xstring = [NSString stringWithFormat:@"%d",diceValue+1];
  
  switch (face) {
    case 2:
      [diceImage setImage:imageD2[diceValue]];
      break;
      
    default:
      [diceImage setImage:imageD6[diceValue]];
      break;
  }
  
  [diceLabel setText:xstring];
  
  
  
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  
  srand((unsigned) time(NULL));
  
  for(int i= 0;i<2;i++){
    imageD2[i] = [UIImage imageNamed:[NSString stringWithFormat:@"d2_%d.png",i+1]];
  }
  
  for(int i= 0;i<6;i++){
    imageD6[i] = [UIImage imageNamed:[NSString stringWithFormat:@"d6_%d.png",i+1]];
  }

}


- (void) viewDidAppear:(BOOL)animated{
  
  [super viewDidAppear:animated];
  [self becomeFirstResponder];
  
  
}

- (void) viewWillAppear:(BOOL)animated{
  
  [super viewWillAppear:animated];
  [diceLabel setText:NSLocalizedString(@"Welcome!!",@"welcome")];
  [diceButton setTitle:NSLocalizedString(@"Shake!!",@"shake") forState:(UIControlStateNormal)];
  
  
}

- (void) viewWillDisappear:(BOOL)animated{
  
  [self resignFirstResponder];
  [super viewWillDisappear:animated];
  
}

-(BOOL) canBecomeFirstResponder{
  return YES; 
}


- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
  if(event.type == UIEventSubtypeMotionShake){
    [self throwDice]; 
    
  }
  
  
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}


@end
