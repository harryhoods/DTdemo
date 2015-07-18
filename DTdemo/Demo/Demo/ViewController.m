//
//  ViewController.m
//  Demo
//
//  Created by Prabhakaran, Hariprasad on 7/15/15.
//  Copyright (c) 2015 Hari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize tableView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //mapvc = [storyboard instantiateViewControllerWithIdentifier:@"mapView"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NS_ENUM(NSUInteger, eCITIES){
    SAN_FRANSISCO,
    NEW_YORK,
    LONDON,
    TOKYO,
    CITY_COUNT
};

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch(section){
        case 0:
            return 0;
        case 1:
            return CITY_COUNT;
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 22; // sepration between other sections
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - Table view delegate
- (UIView *)tableView:(UITableView *)myTableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, myTableView.bounds.size.width, 50)];
    UILabel *sectionHeader = [[UILabel alloc] initWithFrame:CGRectMake(12, -20, myTableView.bounds.size.width, 50)];
    sectionHeader.backgroundColor = [UIColor clearColor];
    sectionHeader.textAlignment = NSTextAlignmentLeft;
    sectionHeader.font = [UIFont systemFontOfSize:14];
    sectionHeader.textColor = [UIColor blackColor];
    [sectionView addSubview:sectionHeader];
    
    switch (section) {
        case 1:
            sectionHeader.text = NSLocalizedString(@"Choose a city:", @"Choose a city");
            break;
        default:
            break;
    }
    return sectionView;
    
}

// Create initial view of the settings Menu
- (UITableViewCell*) tableView:(UITableView *)myTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"city"];
    
    [cell.textLabel setTextColor:[UIColor darkGrayColor]];
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    cell.textLabel.backgroundColor=[UIColor clearColor]; // Nullifying any unintended settings
    [cell setSelected:NO]; //Default unselected
    
    cell.tintColor = [UIColor grayColor];
    
    switch (indexPath.section) {
        case 1:
            switch (indexPath.row) {
                case SAN_FRANSISCO:{
                    cell.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"%@",@"San Fransisco, CA"), NSLocalizedString(@"San Fransisco, CA", nil)];
                    break;
                }
                case NEW_YORK:
                    cell.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"%@", @"New York"), NSLocalizedString(@"New York", nil)];
                    break;
                case LONDON:
                    cell.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"%@", @"London"), NSLocalizedString(@"London", "London")];
                    //default choice?
                    //[cell setSelected:YES];
                    //self.debugLabel.text=choice;
                    break;
                case TOKYO:
                    cell.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"%@", @"Tokyo"), NSLocalizedString(@"Tokyo", "Region")];
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    
    if(cell.selected)
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType=UITableViewCellAccessoryNone;
    return cell;
}

// When user interacts with the table
- (void) tableView:(UITableView *)myTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *selectedCell = [myTableView cellForRowAtIndexPath:indexPath];
    NSIndexPath *toggleCellIndex = nil;
    choice = nil;
    
        switch (indexPath.section) {
            case 1:
                switch (indexPath.row) {
                    case SAN_FRANSISCO:
                        //set street NO
                        // if steet number is selected, unselect steet name only option and vice versa.
                        if(selectedCell.accessoryType==UITableViewCellAccessoryNone){
                            toggleCellIndex = [NSIndexPath indexPathForRow:SAN_FRANSISCO inSection:0];
                            [myTableView deselectRowAtIndexPath:toggleCellIndex animated:YES];
                            [[myTableView cellForRowAtIndexPath:toggleCellIndex] setAccessoryType:UITableViewCellAccessoryNone];
                        }
                        break;
                    case NEW_YORK:
                        //set street name
                        // if steet number is selected, unselect steet name only option and vice versa.
                        if(selectedCell.accessoryType==UITableViewCellAccessoryNone){
                            toggleCellIndex = [NSIndexPath indexPathForRow:NEW_YORK inSection:0];
                            [tableView deselectRowAtIndexPath:toggleCellIndex animated:YES];
                            [[tableView cellForRowAtIndexPath:toggleCellIndex] setAccessoryType:UITableViewCellAccessoryNone];
                        }
                        break;
                    case LONDON:
                        //set city and state
                        // if steet number is selected, unselect steet name only option and vice versa.
                        if(selectedCell.accessoryType==UITableViewCellAccessoryNone){
                            toggleCellIndex = [NSIndexPath indexPathForRow:LONDON inSection:0];
                            [tableView deselectRowAtIndexPath:toggleCellIndex animated:YES];
                            [[tableView cellForRowAtIndexPath:toggleCellIndex] setAccessoryType:UITableViewCellAccessoryNone];
                        }
                        break;
                    case TOKYO:
                        //set state only
                        // if steet number is selected, unselect steet name only option and vice versa.
                        if(selectedCell.accessoryType==UITableViewCellAccessoryNone){
                            toggleCellIndex = [NSIndexPath indexPathForRow:TOKYO inSection:0];
                            [tableView deselectRowAtIndexPath:toggleCellIndex animated:YES];
                            [[tableView cellForRowAtIndexPath:toggleCellIndex] setAccessoryType:UITableViewCellAccessoryNone];
                        }
                        break;
                    default:
                        break;
                }
                break;
            default:
                break;
        }
        
        if(selectedCell.accessoryType==UITableViewCellAccessoryCheckmark){
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            [selectedCell setAccessoryType:UITableViewCellAccessoryNone];
        }
        else{
            [selectedCell setAccessoryType:UITableViewCellAccessoryCheckmark];
            choice=[NSString stringWithFormat:@"%@",selectedCell.textLabel.text];

            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            mapvc = [storyboard instantiateViewControllerWithIdentifier:@"mapView"];
            mapvc.choiceValue = choice;
            [self presentViewController:mapvc animated:YES completion:nil];
        }
    //NSLog(@"[TableViewController] choice:%@",choice);
}

-(NSString*) getChoice{
    return choice;
}

@end
