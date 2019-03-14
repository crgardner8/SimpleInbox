//
//  InboxListing.m
//  Simple Inbox
//
//  Created by Clifton Gardner on 3/13/19.
//  Copyright © 2019 Clifton Gardner. All rights reserved.
//

#import "InboxListing.h"

@implementation InboxListing

-(instancetype)initWithTitle:(NSString *)title Summary:(nullable NSString *)summary ThumbnailLocation:(nullable NSString *)thumbnailLocString andAttributes:(nullable NSDictionary *)attributes {
    
    self = [super self];
    if (self) {
        
        self.listingTitle = title;
        
        if (summary) {
            self.listingSummary = summary;
        }
        
        if (thumbnailLocString) {
            self.listingThumbnailLoc = thumbnailLocString;
        }
        
        if (attributes) {
            self.listingAttributes = [NSDictionary dictionaryWithDictionary:attributes];
        }
    }
    
    return self;
}

@end
