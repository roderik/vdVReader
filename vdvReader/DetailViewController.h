//
//  DetailViewController.h
//  vdvReader
//
//  Created by Roderik van der Veer on 01/09/14.
//  Copyright (c) 2014 Kunstmaan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

