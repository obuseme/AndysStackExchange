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

@interface ItemsAPI : NSObject

@property (weak) id<ItemsAPIDelegate> delegate;

- (void) loadItems;

@end

@protocol ItemsAPIDelegate <NSObject>
@required
- (void) itemsLoaded:(NSArray *)items;
@end