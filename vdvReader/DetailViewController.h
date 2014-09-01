//
//  DetailViewController.h
//  vdvReader
//
//  Created by Roderik van der Veer on 01/09/14.
//  Copyright (c) 2014 Kunstmaan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedItem.h"

@interface DetailViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) MWFeedItem *detailItem;
@property (strong, nonatomic) IBOutlet UINavigationItem *detailTitle;

@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end

