//
//  MailViewController.m
//  GmailSlideShow
//
//  Created by Arata Okura on 1/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MailViewController.h"
#import "mail.h"

@implementation MailViewController
@synthesize mails = _mails;
@synthesize body = _body;
@synthesize subject = _subject;
@synthesize from = _from;

-(void)viewDidLoad
{
    CTCoreMessage *msg = [self.mails objectAtIndex:0];
    self.body.text = msg.body;
    self.subject.text = msg.subject;
    //self.from.text = [[msg.from allObjects] objectAtIndex:0];
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [self setBody:nil];
    [self setSubject:nil];
    [self setFrom:nil];
    [super viewDidUnload];
}
@end
