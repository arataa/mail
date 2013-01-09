//  mail.m
//  GmailSlideShow
//
//  Created by Arata Okura on 1/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "mail.h"
#import "GrobalResource.h"

@interface mail()
-(CTCoreAccount *)connect;
@end

@implementation mail
@synthesize account = _account;

-(CTCoreAccount *)connect
{
    CTCoreAccount *accountTmp = [[CTCoreAccount alloc] init];
    BOOL success = [accountTmp connectToServer:@"imap.gmail.com"
                                       port:993
                             connectionType:CTConnectionTypeTLS
                                   authType:CTImapAuthTypePlain
                                      login:@"okura.arata"
                                   password:@"arata214"];
    if (!success) {
        // Display the error contained in account.lastError
    }
   
    return accountTmp;
}

-(NSSet *)getFolders
{
    return [self.account allFolders];
}

-(NSArray *)getMails:(NSString *)folderStr
{
    CTCoreFolder *folder = [self.account folderWithPath:folderStr];
    return [folder messagesFromSequenceNumber:1 to:0 withFetchAttributes:CTFetchAttrEnvelope];
}

-(CTCoreAccount*)account
{
    return [self connect];
}

@end
