//
//  TBFourthViewController.h
//  TheBackgrounder
//
//  Created by Gustavo Ambrozio on 19/1/13.
//  Copyright (c) 2013 Gustavo Ambrozio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NewsstandKit/NewsstandKit.h>

@interface TBFourthViewController : UIViewController <NSURLConnectionDownloadDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtURL;
@property (strong, nonatomic) IBOutlet UIProgressView *progress;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
