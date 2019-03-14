//
//  InboxListingTableViewController.m
//  Simple Inbox
//
//  Created by Clifton Gardner on 3/13/19.
//  Copyright © 2019 Clifton Gardner. All rights reserved.
//

#import "InboxListingTableViewController.h"

#import "InboxListing.h"
#import "InboxListingTableViewCell.h"

@import Localytics;

NSString *const inboxEndpoint =  @"https://sdk-assets.localytics.com/challenge/inbox.JSON";

@interface InboxListingTableViewController ()

@property (strong, nonatomic) NSMutableArray *inboxes;

@end

@implementation InboxListingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.inboxes = [NSMutableArray new];
    [self getInboxListings];
    
}



- (void) getInboxListings {
 
    __weak InboxListingTableViewController *wSelf = self;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:inboxEndpoint] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *inboxJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *inboxArray = [[NSArray alloc] initWithArray:[inboxJSON objectForKey:@"inboxes"]];
        
        for (NSDictionary *inbox in inboxArray) {
            InboxListing *tempInbox = [[InboxListing alloc] initWithTitle:[inbox objectForKey:@"listing_title"] Summary:[inbox objectForKey:@"listing_summary"] ThumbnailLocation:[inbox objectForKey:@"thumbnail_location"] andAttributes:[inbox objectForKey:@"attributes"]];
            [wSelf.inboxes addObject:tempInbox];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [wSelf.tableView reloadData];
        });
    }];
    [dataTask resume];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.inboxes.count > 0) {
        return self.inboxes.count;
    }
    
    return 0;
}


- (InboxListingTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InboxListingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InboxListingCell" forIndexPath:indexPath];
    
    InboxListing *tempListing = self.inboxes[indexPath.row];

    cell = [cell configureCellWithInboxListing:tempListing];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    InboxListing *inbox = self.inboxes[indexPath.row];
    [Localytics tagEvent:[NSString stringWithFormat:@"Tapped Inbox %ld", (long)indexPath.row] attributes:inbox.listingAttributes];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
