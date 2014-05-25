//
//  MPCHandler.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 11/05/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "MPCHandler.h"

@implementation MPCHandler

- (void)setupPeerWithDisplayName:(NSString *)displayName
{
    self.peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
}

- (void)setupSession
{
    if (!self.session)
    {
        self.session = [[MCSession alloc] initWithPeer:self.peerID];
        self.session.delegate = self;
    }
}

- (void)setupBrowser
{
    if (!self.browser)
    {
        self.browser = [[MCBrowserViewController alloc] initWithServiceType:@"my-game" session:_session];
    }

}

- (void)advertiseSelf:(BOOL)advertise
{
    if (advertise)
    {
        self.advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"my-game" discoveryInfo:nil session:self.session];
        [self.advertiser start];
        
    }
    else
    {
        [self.advertiser stop];
        self.advertiser = nil;
    }
}


#pragma mark MCSession delegate

- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    NSDictionary *userInfo = @{ @"peerID": peerID,
                                @"state" : @(state) };
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidChangeStateNotification"
                                                            object:nil
                                                          userInfo:userInfo];
    });
}

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSDictionary *userInfo = @{ @"data": data,
                                @"peerID": peerID };
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidReceiveDataNotification"
                                                            object:nil
                                                          userInfo:userInfo];
    });
}


#pragma mark Unused Delegate methods
- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {
    
}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {
    
}

- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {
    
}

@end
