//
//  InboxListingTableViewCell.h
//  Simple Inbox
//
//  Created by Clifton Gardner on 3/13/19.
//  Copyright © 2019 Clifton Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InboxListing.h"

NS_ASSUME_NONNULL_BEGIN

@interface InboxListingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *inboxListingTitle;
@property (weak, nonatomic) IBOutlet UILabel *inboxListingSummary;
@property (weak, nonatomic) IBOutlet UIImageView *inboxListingThumbnail;

- (InboxListingTableViewCell *) configureCellWithInboxListing:(InboxListing *)inboxListing;

@end

NS_ASSUME_NONNULL_END
