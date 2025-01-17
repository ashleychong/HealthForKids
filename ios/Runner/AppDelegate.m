#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  [GMSServices provideAPIKey: @"AIzaSyB9o4Ot64vL-vMHiNeTzi-0VzyYwCG9DBo"];
  if(![[NSUserDefaults standardUserDefaults]objectForKey:@"Notification"]){
      [[UIApplication sharedApplication] cancelAllLocalNotifications];
      [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"Notification"];
  }
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
