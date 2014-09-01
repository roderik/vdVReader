//
//  MasterViewController.h
//  vdvReader
//
//  Created by Roderik van der Veer on 01/09/14.
//  Copyright (c) 2014 Kunstmaan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <MWFeedParserDelegate>

// Parsing
@property (nonatomic, strong) MWFeedParser *feedParser;
@property (nonatomic, strong) NSMutableArray *parsedItems;

// Displaying
@property (nonatomic, strong) NSArray *itemsToDisplay;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

