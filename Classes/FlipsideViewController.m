//
//  FlipsideViewController.m
//  myDices
//
//  Created by AA AA on 12/12/03.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate;

static NSString *reuseIdentifier = @"FlipsideCellIdentifier";




//セクション内の行の数(diceの種類)
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
  
  myDicesAppDelegate *appDeegate = (myDicesAppDelegate *) [[UIApplication sharedApplication] delegate];
  
  return [appDeegate.diceFaces count];

}

//テーブルビューにセルを表示する(選択したdiceの面数を抽出)
- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
  UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:reuseIdentifier];
  
  if(cell == nil){
    cell =[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];
    
  }
  
  myDicesAppDelegate *appDelegate = (myDicesAppDelegate *) [[UIApplication sharedApplication] delegate];
  
  
  cell.textLabel.text = [appDelegate.diceFaces objectAtIndex:indexPath.row];
  
  //現在選択されているものにチェックマーク
  if(((int)[appDelegate diceFace]) == indexPath.row){
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  }
  
  return cell ;
  
  
}

//行が選択されたときに呼ばれるメソッド(セルのチェックを付け足す＋他のセルのチェックを外す)
- (void)tableView:(UITableView *)table didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath{
  
  myDicesAppDelegate *appDelegate = (myDicesAppDelegate *) [[UIApplication sharedApplication] delegate];
  
  //元のdiceFaceの値を参照し現在選択中のインデックスを得る
  NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:((int)[appDelegate diceFace]) inSection:0];
  
  //現在のチェックマークを外す
  [[table cellForRowAtIndexPath:oldIndexPath] setAccessoryType:UITableViewCellAccessoryNone];
  
  //新しくタップされたセルにチェックマークを入れる
  [[table cellForRowAtIndexPath:newIndexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
  
  //新しくタップされたセルの選択をアニメーション付きで外す
  [table deselectRowAtIndexPath:newIndexPath animated:YES];
  
  switch (newIndexPath.row) {
    case 0:
      [appDelegate setDiceFace:d2];
      break;
    case 1:
      [notice show];
      [appDelegate setDiceFace:d4];
      break;
    case 2:
      [appDelegate setDiceFace:d6];
      break;
    case 3:
      [notice show];
      [appDelegate setDiceFace:d8];
      break;
    case 4:
      [notice show];
      [appDelegate setDiceFace:d10];
      break;
    case 5:
      [notice show];
      [appDelegate setDiceFace:d12];
      break;
    case 6:
      [notice show];
      [appDelegate setDiceFace:d20];
      break;
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
  [super viewDidLoad];
  self.view.backgroundColor =[UIColor viewFlipsideBackgroundColor];
  notice = [[UIAlertView alloc] init];
  notice.title = NSLocalizedString(@"about faces", @"aboutFaces") ;
  notice.message =NSLocalizedString(@"Only the Coin", @"beWorkNow");
  notice.delegate = self;
  [notice addButtonWithTitle:NSLocalizedString(@"Okay", @"okay")];
  
  
}


- (IBAction)done:(id)sender {
	[self.delegate flipsideViewControllerDidFinish:self];	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    
  
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  
  return NSLocalizedString(@"Setting",@"setting");
  
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}


@end
