//
//  myDicesAppDelegate.h
//  myDices
//
//  Created by AA AA on 12/12/03.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


//diceFaceType型
typedef enum{d2,d4,d6,d8,d10,d12,d20} diceFaceType;

@class MainViewController;

@interface myDicesAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow *window;
  MainViewController *mainViewController;
  
  NSArray *diceFaces;
  diceFaceType diceFace;
  
  
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;
@property (nonatomic,readonly) NSArray *diceFaces;
@property diceFaceType diceFace;


@end

