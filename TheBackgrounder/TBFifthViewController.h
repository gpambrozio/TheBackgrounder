//
//  TBFifthViewController.h
//  TheBackgrounder
//
//  Created by Gustavo Ambrozio on 19/1/13.
//  Copyright (c) 2013 Gustavo Ambrozio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBFifthViewController : UIViewController<NSStreamDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtIP;
@property (strong, nonatomic) IBOutlet UITextField *txtPort;
@property (strong, nonatomic) IBOutlet UITextView *txtReceivedData;

- (IBAction)didTapConnect:(id)sender;

@end
