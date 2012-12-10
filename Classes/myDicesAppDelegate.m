//
//  myDicesAppDelegate.m
//  myDices
//
//  Created by AA AA on 12/12/03.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "myDicesAppDelegate.h"
#import "MainViewController.h"


//デフォルト値保存用キー名
static NSString *MyDicesSignatureKey = @"MyDicesSignatureKey";


@implementation myDicesAppDelegate


@synthesize window;
@synthesize mainViewController;
@synthesize diceFaces;
@synthesize diceFace;


NSDictionary *resourceDict;
NSNumber *defaultDiceFace;


+ (void) initialize{
    
    //d6
    defaultDiceFace = [NSNumber numberWithInt:(int)d6];
    
    //辞書をNSNumberオブジェクトとキーで作成
    resourceDict = [NSDictionary dictionaryWithObject:defaultDiceFace forKey:MyDicesSignatureKey];
    
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:resourceDict];
    
    
}


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
  // Override point for customization after application launch.
	MainViewController *aController ;
	

  //dicceの文字列
  diceFaces = [[NSArray alloc] initWithObjects:NSLocalizedString(@"Coin", @"2 faces") ,
               NSLocalizedString(@"Tetrahedron", @"4 faces"),NSLocalizedString(@"Cube", @"6 faces"),
               NSLocalizedString(@"Octahedron", @"8 faces"),NSLocalizedString(@"Decahedron", @"10 faces"),
               NSLocalizedString(@"Dodecahedron", @"12 faces"),NSLocalizedString(@"Icosahedron", @"20 faces"),nil];
  
  aController =[[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
  self.mainViewController = aController;
  
  //self.window.rootViewController = self.mainViewController;
  
  [aController release];
  
  
  //shake
  application.applicationSupportsShakeToEdit = YES;
  

  mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
  
  [window addSubview:[mainViewController view]];
  
  
  
  
  // Set the main view controller as the window's root view controller and display.
  
  [self.window makeKeyAndVisible];
  
  //initializeで登録された情報に従ってキー値から値を取得
  int restoredSignature = [[NSUserDefaults standardUserDefaults] integerForKey:MyDicesSignatureKey];
  
  
  if((restoredSignature >=d2) && (restoredSignature <=d20)){
    
    self.diceFace = (diceFaceType)restoredSignature;
    
  }
  
  
  
    
  //self.diceFace = d6;
  
      return YES;
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
  [[NSUserDefaults standardUserDefaults] setInteger:self.diceFace forKey:MyDicesSignatureKey];

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
  
  // デフォルト値管理クラスにキー値と値のペアを渡して保存させる
  [[NSUserDefaults standardUserDefaults] setInteger:self.diceFace forKey:MyDicesSignatureKey];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
  [diceFaces release];
  [mainViewController release];
  [window release];
  [super dealloc];
}

@end
