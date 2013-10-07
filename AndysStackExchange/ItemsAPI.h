//
//  ItemsAPI.h
//  AndysStackExchange
//
//  Created by Andrew Obusek on 10/5/13.
//  Copyright (c) 2013 Andrew Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ItemsAPIDelegate;

@class Items;

/**
 
 Central API for interacting with the /questions related REST resources on the stackoverflow API
 */
@interface ItemsAPI : NSObject

/**
 Delegate to send a message to once the loading is complete
 */
@property (weak) id<ItemsAPIDelegate> delegate;

/**
 Loads the questions
 
 Currently loads most recent questions asked on stackexchange.com with the tag "iphone"
 */
- (void) loadItems;

@end

@protocol ItemsAPIDelegate <NSObject>
@required
/**
 Message sent to the delegate once the items have loaded.
 
 @param The items that were loaded
 */
- (void) itemsLoaded:(NSArray *)items;
@end