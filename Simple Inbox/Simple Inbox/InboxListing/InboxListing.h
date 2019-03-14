//
//  InboxListing.h
//  Simple Inbox
//
//  Created by Clifton Gardner on 3/13/19.
//  Copyright © 2019 Clifton Gardner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InboxListing : NSObject

@property (strong, nonatomic) NSString *listingTitle;
@property (strong, nonatomic) NSString *listingSummary;
@property (strong, nonatomic) NSString *listingThumbnailLoc;
@property (strong, nonatomic) NSDictionary *listingAttributes;

-(instancetype)initWithTitle:(NSString *)title Summary:(nullable NSString *)summary ThumbnailLocation:(nullable NSString *)thumbnailLocString andAttributes:(nullable NSDictionary *)attributes;

@end

NS_ASSUME_NONNULL_END
