//
//  MPOptionsViewController.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 11/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "MPOptionsViewController.h"

@interface MPOptionsViewController ()
{
    __weak IBOutlet UITextField *_sendTextField;
    __weak IBOutlet UIButton *_sendButton;
    __weak IBOutlet UILabel *_dataRecievedTextFeild;
    __weak IBOutlet UILabel *_peerListTextFeild;
}
@end

@implementation MPOptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self registerForMCSessionNotifications:YES];
    
#warning Just for demonstration
    Quiz *quiz = [[Quiz alloc] init];
    quiz.title = @"testTitle";
    [QuizBDC saveQuiz:quiz];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendTapped:(id)sender
{
    NSData *data = [_sendTextField.text dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    [[AppShared sharedInstance].mpcHandler.session sendData:data toPeers:[AppShared sharedInstance].mpcHandler.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
    
}

- (IBAction)advertiseTapped:(id)sender
{
    [[AppShared sharedInstance].mpcHandler setupPeerWithDisplayName:[UIDevice currentDevice].name];
    [[AppShared sharedInstance].mpcHandler setupSession];
    [[AppShared sharedInstance].mpcHandler advertiseSelf:YES];
}


- (IBAction)browseTapped:(id)sender
{
    if ([AppShared sharedInstance].mpcHandler.session != nil)
    {
        [[AppShared sharedInstance].mpcHandler setupBrowser];
        [AppShared sharedInstance].mpcHandler.browser.delegate = self;
         
        [self presentViewController:[AppShared sharedInstance].mpcHandler.browser
                           animated:YES
                         completion:nil];
    }
}


- (IBAction)disconnectTapped:(id)sender
{
    [[AppShared sharedInstance].mpcHandler.session disconnect];
}


-(void) registerForMCSessionNotifications:(BOOL)shouldRegister
{
    if (shouldRegister) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(peerChangedStateWithNotification:)
                                                     name:@"MPCDemo_DidChangeStateNotification"
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleReceivedDataWithNotification:)
                                                     name:@"MPCDemo_DidReceiveDataNotification"
                                                   object:nil];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MPCDemo_DidChangeStateNotification" object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MPCDemo_DidReceiveDataNotification" object:nil];
    }
}

- (void)handleReceivedDataWithNotification:(NSNotification *)notification {
    // Get the user info dictionary that was received along with the notification.
    NSDictionary *userInfoDict = [notification userInfo];
    
    // Convert the received data into a NSString object.
    NSData *receivedData = [userInfoDict objectForKey:@"data"];
    NSString *message = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    // Keep the sender's peerID and get its display name.
//    MCPeerID *senderPeerID = [userInfoDict objectForKey:@"peerID"];
//    NSString *senderDisplayName = senderPeerID.displayName;
    
    _dataRecievedTextFeild.text = [_dataRecievedTextFeild.text stringByAppendingString:[NSString stringWithFormat:@"\n%@",message]];
}

- (void)peerChangedStateWithNotification:(NSNotification *)notification {
    // Get the state of the peer.
    int state = [[[notification userInfo] objectForKey:@"state"] intValue];
    
    // We care only for the Connected and the Not Connected states.
    // The Connecting state will be simply ignored.
    if (state != MCSessionStateConnecting)
    {
        // We'll just display all the connected peers (players) to the text view.
        NSString *allPlayers = @"Other players connected with:\n\n";
        
        for (int i = 0; i < [AppShared sharedInstance].mpcHandler.session.connectedPeers.count; i++)
        {
            NSString *displayName = [[[AppShared sharedInstance].mpcHandler.session.connectedPeers objectAtIndex:i] displayName];
            
            allPlayers = [allPlayers stringByAppendingString:@"\n"];
            allPlayers = [allPlayers stringByAppendingString:displayName];
        }
        
        _peerListTextFeild.text = allPlayers;
    }
}

#pragma mark MCBrowserViewControllerDelegate methods
- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [[AppShared sharedInstance].mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [[AppShared sharedInstance].mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}

@end
