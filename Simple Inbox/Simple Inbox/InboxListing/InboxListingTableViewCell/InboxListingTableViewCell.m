//
//  InboxListingTableViewCell.m
//  Simple Inbox
//
//  Created by Clifton Gardner on 3/13/19.
//  Copyright © 2019 Clifton Gardner. All rights reserved.
//

#import "InboxListingTableViewCell.h"
#import "InboxListing.h"

@implementation InboxListingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (InboxListingTableViewCell *) configureCellWithInboxListing:(InboxListing *)inboxListing {
    
    self.inboxListingTitle.text = inboxListing.listingTitle;
    
    if (inboxListing.listingSummary) {
        self.inboxListingSummary.text = inboxListing.listingSummary;
    }
    
    if (inboxListing.listingThumbnailLoc) {
        NSData *listingThumbnailData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:inboxListing.listingThumbnailLoc]];
        
        self.inboxListingThumbnail.image = [UIImage imageWithData:listingThumbnailData];
    }
    
    return self;
}

@end
