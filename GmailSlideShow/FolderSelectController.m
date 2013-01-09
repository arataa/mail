//
//  FolderSelectController.m
//  GmailSlideShow
//
//  Created by Arata Okura on 1/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FolderSelectController.h"
#import "mail.h"

@interface FolderSelectController()
@property(nonatomic, strong) NSArray *folders;
@property(nonatomic, strong) mail *mailObject;
@property(nonatomic, strong) NSArray *mails;
@end

@implementation FolderSelectController
@synthesize folders = _folders;
@synthesize mailObject = _mailObject;
@synthesize mails    = _mails;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mailObject = [[mail alloc] init];
    self.folders = [[NSArray alloc] initWithArray:[[self.mailObject getFolders] allObjects]];
    
    self.tableView.dataSource = self;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set the data for this cell:
    cell.textLabel.text = [self.folders objectAtIndex:indexPath.row];
    
    // set the accessory view:
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.folders count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.mails = [self.mailObject getMails:[self.folders objectAtIndex:self.tableView.indexPathForSelectedRow.row]];
    [[segue destinationViewController] setMails:self.mails ];
}

@end
