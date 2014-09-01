//
//  DetailViewController.m
//  vdvReader
//
//  Created by Roderik van der Veer on 01/09/14.
//  Copyright (c) 2014 Kunstmaan. All rights reserved.
//

#import "DetailViewController.h"
#import "MWFeedItem.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
            
#pragma mark - Managing the detail item

- (void)setDetailItem:(MWFeedItem *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {

    _detailTitle.title = [_detailItem title];
    
    UIFont *fontContent = [UIFont systemFontOfSize:14];
    UIColor *tintColor = self.view.tintColor;

    
    NSString *content = [NSString stringWithFormat:@"<html>"
                         "<head>"
                         "<style type=\"text/css\">"
                         "body {font-family: \"%@\"; font-size: %@; max-width: 100%%; padding: 0 margin: 0}"
                         "img {max-width: 100%%}"
                         "pre { overflow:scroll; }"
                         " a {color: %@; }"
                         "</style> \n"
                         "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://vanderveer.be/assets/css/prism.css\"/>"
                         "</head>"
                         "<body id=\"content\">"
                         "%@"
                         "<script type=\"text/javascript\" src=\"http://vanderveer.be/public/jquery.min.js\"></script>"
                         "<script type=\"text/javascript\" src=\"http://vanderveer.be/assets/js/jquery.fitvids.js\"></script>"
                         "<script type=\"text/javascript\" src=\"http://vanderveer.be/assets/js/prism.js\"></script>"
                         "<script>"
                         "$(document).ready(function(){"
                         "$(\"#content\").fitVids();"
                         "});"
                         "</script>"
                         "</body>"
                         "</html>",
                         fontContent.familyName,
                         [NSNumber numberWithInt:fontContent.pointSize],
                         [self colorToWeb:tintColor],
                         [_detailItem summary]];
                         
    [_webView loadHTMLString:content baseURL:nil];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    // This practically disables web navigation from the webView.
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        [[UIApplication sharedApplication] openURL:[request URL]];
        return FALSE;
    }
    return TRUE;
}


- (NSString*)colorToWeb:(UIColor*)color
{
    NSString *webColor = nil;
    
    // This method only works for RGB colors
    if (color &&
        CGColorGetNumberOfComponents(color.CGColor) == 4)
    {
        // Get the red, green and blue components
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        
        // These components range from 0.0 till 1.0 and need to be converted to 0 till 255
        CGFloat red, green, blue;
        red = roundf(components[0] * 255.0);
        green = roundf(components[1] * 255.0);
        blue = roundf(components[2] * 255.0);
        
        // Convert with %02x (use 02 to always get two chars)
        webColor = [[NSString alloc]initWithFormat:@"%02x%02x%02x", (int)red, (int)green, (int)blue];
    }
    
    return webColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _webView.delegate = self;
    
    NSLog(@"Load sub");

    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
