//
//  mail.h
//  GmailSlideShow
//
//  Created by Arata Okura on 1/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MailCore/MailCore.h>

@interface mail : NSObject
@property(nonatomic, strong) CTCoreAccount *account;
-(NSSet *)getFolders;
-(NSArray *)getMails:(NSString *)folderStr;
@end
