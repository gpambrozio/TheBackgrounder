//
//  TBFirstViewController.h
//  TheBackgrounder
//
//  Created by Gustavo Ambrozio on 19/1/13.
//  Copyright (c) 2013 Gustavo Ambrozio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBFirstViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblMusicName;
@property (strong, nonatomic) IBOutlet UILabel *lblMusicTime;
@property (strong, nonatomic) IBOutlet UIButton *btnPlayPause;

- (IBAction)didTapPlayPause:(id)sender;
@end
