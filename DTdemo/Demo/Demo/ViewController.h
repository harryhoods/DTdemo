//
//  ViewController.h
//  Demo
//
//  Created by Prabhakaran, Hariprasad on 7/15/15.
//  Copyright (c) 2015 Hari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface ViewController :  UITableViewController{
    NSString *choice;
    UIStoryboard *storyboard;
    MapViewController *mapvc;
}
-(NSString*) getChoice;
@property (strong, nonatomic) IBOutlet UITableView *choiceTableView;

@end

