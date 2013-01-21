//
//  TBFourthViewController.m
//  TheBackgrounder
//
//  Created by Gustavo Ambrozio on 19/1/13.
//  Copyright (c) 2013 Gustavo Ambrozio. All rights reserved.
//

#import "TBFourthViewController.h"

@interface TBFourthViewController ()

@property (nonatomic, strong) NKIssue *currentIssue;
@property (nonatomic, strong) NSString *issueFilename;

@end

@implementation TBFourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Newsstand", @"Newsstand");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appBecameActive)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)appBecameActive
{
    if (self.currentIssue && self.currentIssue.downloadingAssets.count == 0 && self.webView.hidden)
    {
        [self updateWebView];
    }
}

- (void)updateWebView
{
    self.webView.hidden = NO;
    self.progress.hidden = YES;
    NSURL *fileURL = [self.currentIssue.contentURL URLByAppendingPathComponent:self.issueFilename];
    [self.webView loadRequest:[NSURLRequest requestWithURL:fileURL]];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.webView.hidden = YES;
    self.progress.progress = 0.0f;
    self.progress.hidden = NO;
    
    NKLibrary *library = [NKLibrary sharedLibrary];
    for (NKIssue *issue in [library.issues copy])
    {
        [library removeIssue:issue];
    }
    self.currentIssue = [library addIssueWithName:@"test" date:[NSDate date]];
    
    NSURL *downloadURL = [[NSURL alloc] initWithString:self.txtURL.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:downloadURL];
    NKAssetDownload *assetDownload = [self.currentIssue addAssetWithRequest:request];
    [assetDownload downloadWithDelegate:self];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - NSURLConnectionDownloadDelegate

- (void)connection:(NSURLConnection *)connection
      didWriteData:(long long)bytesWritten
 totalBytesWritten:(long long)totalBytesWritten
expectedTotalBytes:(long long)expectedTotalBytes
{
    float progress = (float)totalBytesWritten / (float)expectedTotalBytes;
    if (UIApplication.sharedApplication.applicationState == UIApplicationStateActive)
    {
        self.progress.progress = progress;
    }
    else
    {
        NSLog(@"App is backgrounded. Progress = %.1f", progress);
    }
}

- (void)connectionDidFinishDownloading:(NSURLConnection *)connection
                        destinationURL:(NSURL *)destinationURL
{
    self.issueFilename = destinationURL.pathComponents.lastObject;
    NSURL *fileURL = [self.currentIssue.contentURL URLByAppendingPathComponent:self.issueFilename];
    
    [[NSFileManager defaultManager] moveItemAtURL:destinationURL
                                            toURL:fileURL
                                            error:nil];
    
    if (UIApplication.sharedApplication.applicationState == UIApplicationStateActive)
    {
        [self updateWebView];
    }
    else
    {
        NSLog(@"App is backgrounded. Download finished");
    }
}

@end
