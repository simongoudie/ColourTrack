//
//  CTViewController.h
//  ColourTrack
//
//  Created by Simon Goudie on 15/07/13.
//  Copyright (c) 2013 Simon Goudie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTTableViewCell.h"

@interface CTViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
