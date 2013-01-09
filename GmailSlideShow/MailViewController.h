//
//  MailViewController.h
//  GmailSlideShow
//
//  Created by Arata Okura on 1/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MailViewController : UIViewController

@property(nonatomic, strong) NSArray *mails;
@property (weak, nonatomic) IBOutlet UILabel *body;
@property (weak, nonatomic) IBOutlet UILabel *subject;
@property (weak, nonatomic) IBOutlet UILabel *from;


@end
