//
//  ViewController.h
//  Sample App
//
//  Created by Hiroshi Hashiguchi on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MTStatusBarOverlay.h"

@interface ViewController : UIViewController <MTStatusBarOverlayDelegate>
- (IBAction)start:(id)sender;

@end
