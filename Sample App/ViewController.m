//
//  ViewController.m
//  Sample App
//
//  Created by Hiroshi Hashiguchi on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MTStatusBarOverlay.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)start:(id)sender {
    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
    overlay.animation = MTStatusBarOverlayAnimationFallDown;  // MTStatusBarOverlayAnimationShrink
    overlay.detailViewMode = MTDetailViewModeHistory;         // enable automatic history-tracking and show in detail-view
    overlay.delegate = self;
    overlay.progress = 0.0;
    [overlay postMessage:@"Following @myell0w on Twitter…"];
    overlay.progress = 0.1;
    // ...
    [overlay postMessage:@"Following myell0w on Github…" animated:NO];
    overlay.progress = 0.5;
    // ...
    [overlay postImmediateFinishMessage:@"Following was a good idea!" duration:2.0 animated:YES];
    overlay.progress = 1.0;
}


// is called, when a gesture on the overlay is recognized
- (void)statusBarOverlayDidRecognizeGesture:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%s|%@", __PRETTY_FUNCTION__, gestureRecognizer);
}
// is called when the status bar overlay gets hidden
- (void)statusBarOverlayDidHide
{
    NSLog(@"%s|%@", __PRETTY_FUNCTION__, nil);
}
// is called, when the status bar overlay changed it's displayed message from one message to another
- (void)statusBarOverlayDidSwitchFromOldMessage:(NSString *)oldMessage toNewMessage:(NSString *)newMessage
{
    NSLog(@"%s|%@", __PRETTY_FUNCTION__, oldMessage);
    NSLog(@"%s|%@", __PRETTY_FUNCTION__, newMessage);
}
// is called when an immediate message gets posted and therefore messages in the queue get lost
// it tells the delegate the lost messages and the delegate can then enqueue the messages again
- (void)statusBarOverlayDidClearMessageQueue:(NSArray *)messageQueue
{
    NSLog(@"%s|%@", __PRETTY_FUNCTION__, messageQueue);
}

@end
