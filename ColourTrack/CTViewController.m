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
    NSMutableArray* _colours;
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
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Red"]]; // 1/0/0
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Orange"]]; // 1/.5/0
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Yellow"]]; // 1/1/0
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Green"]]; // 0/1/0
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Blue"]]; // 0/0/1
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Indigo"]]; // 0/.5/1
        [_colourItems addObject:[CTColourItem ColourItemWithText:@"Violet"]]; // .5/0/.5
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
    _colours = [[NSMutableArray alloc] init];
    [_colours addObject: [UIColor colorWithRed:255/255.0f green:0/255.0f blue:0/255.0f alpha:1.0f]];
    [_colours addObject: [UIColor colorWithRed:255/255.0f green:128/255.0f blue:0/255.0f alpha:1.0f]];
    [_colours addObject: [UIColor colorWithRed:255/255.0f green:255/255.0f blue:0/255.0f alpha:1.0f]];
    [_colours addObject: [UIColor colorWithRed:0/255.0f green:255/255.0f blue:0/255.0f alpha:1.0f]];
    [_colours addObject: [UIColor colorWithRed:255/255.0f green:128/255.0f blue:255/255.0f alpha:1.0f]];
    [_colours addObject: [UIColor colorWithRed:0/255.0f green:128/255.0f blue:255/255.0f alpha:1.0f]];
    [_colours addObject: [UIColor colorWithRed:128/255.0f green:0/255.0f blue:128/255.0f alpha:1.0f]];
    [_colours addObject: @[@0.5,@0,@0.5]];
//    NSUInteger itemCount = _colourItems.count - 1;
//    float val = ((float)index / (float)itemCount) * 0.6;
//    return [UIColor colorWithRed: colour green: 0 blue: 1 alpha:1.0];
    return _colours[index];
}

#pragma mark - UITableViewDataDelegate protocol methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [self colorForIndex:indexPath.row];
}

@end
