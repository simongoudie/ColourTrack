//
//  CTViewController.m
//  ColourTrack
//
//  Created by Simon Goudie on 15/07/13.
//  Copyright (c) 2013 Simon Goudie. All rights reserved.
//

#import "CTViewController.h"
#import "CTColourItem.h"

@implementation CTViewController {
    // an array of colour items
    NSMutableArray* _colourItems;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CTTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // create a dummy colour list
        _colourItems = [[NSMutableArray alloc] init];
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Red"]];
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Orange"]];
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Yellow"]];
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Green"]];
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Blue"]];
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Indigo"]];
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Violet"]];
    }
    return self;
}

#pragma mark - UITableViewDataSource protocol methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _colourItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ident = @"cell";
    // re-use or create a cell
    CTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    // find the to-do item for this index
    int index = [indexPath row];
    CTColourItem *item = _colourItems[index];
    // set the text
    cell.textLabel.text = item.text;
    return cell;
}

-(UIColor*)colorForIndex:(NSInteger) index {
    NSUInteger itemCount = _colourItems.count - 1;
    float val = ((float)index / (float)itemCount) * 0.6;
    return [UIColor colorWithRed: 1.0 green:val blue: 0.0 alpha:1.0];
}

#pragma mark - UITableViewDataDelegate protocol methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [self colorForIndex:indexPath.row];
}

@end
