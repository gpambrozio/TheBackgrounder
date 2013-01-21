//
//  TBThirdViewController.h
//  TheBackgrounder
//
//  Created by Gustavo Ambrozio on 19/1/13.
//  Copyright (c) 2013 Gustavo Ambrozio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBThirdViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnPlayPause;
@property (strong, nonatomic) IBOutlet UITextView *txtResult;

- (IBAction)didTapPlayPause:(id)sender;

@end
