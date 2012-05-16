//
//  MasterViewController.m
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
/*ADD--- FOR DATA ---ADD*/
@synthesize data = _data;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"Photo Albums", @"Photo albums title");
    [self setData:[[NSMutableOrderedSet alloc] init]];
    [[self data] addObject:@"A Sample Photo Album"];
    [[self data] addObject:@"Another Photo Album"];
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 
                                                            inSection:0] 
                                animated:NO 
                          scrollPosition:UITableViewScrollPositionMiddle];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] 
                    initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                        target:self 
                                action:@selector(add:)];
	/*ADD--- FOR addButton ---ADD*/
    [[self navigationItem] setRightBarButtonItem:addButton];
	/*ADD--- FOR editButtonItem ---ADD*/
    [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];

}
- (void)add:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NameEditorViewController *newController = [[NameEditorViewController alloc] initWithDefaultNib];
    [newController setDelegate:self];
    [newController setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentModalViewController:newController animated:YES];
    
}

-(void) nameEditorViewControllerDidFinish:(NameEditorViewController *)controller
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSString *newName = [[controller nameTextField] text];
    if (newName && [newName length] > 0) {
        if ([controller isEditing]) {
            [[self data] replaceObjectAtIndex:[[controller indexPath] row] 
                                   withObject:newName];
        } else {
            [[self data] addObject:newName];
        }
        [[self tableView] reloadData];
    } 
}

-(void) nameEditorViewControllerDidCancel:(NameEditorViewController *)controller
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num = [self.data count];
    return num;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        // Display the detail disclosure buton when the table is
        // in edit mode. This is the line you must add:
        [cell setEditingAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        [cell setShowsReorderControl:YES];
    }

    // Configure the cell.
    /*ADD---  ---ADD*/
    cell.textLabel.text = [self.data objectAtIndex:[indexPath row]];

    return cell;
}
- (void) tableView:(UITableView *)tableView 
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NameEditorViewController *newController = [[NameEditorViewController alloc] initWithDefaultNib];
    [newController setDelegate:self];
    [newController setEditing:YES];
    [newController setIndexPath:indexPath];
    NSString *name = [[self data] objectAtIndex:[indexPath row]];
    //Replace [[newController nameTextField] setText:name];
    [newController setDefaultNameText:name];
    [newController setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentModalViewController:newController animated:YES];
    
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
                {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
//确定删除表格中的某一行
- (void)tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [[self data] removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView 
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
      toIndexPath:(NSIndexPath *)toIndexPath
{
    [[self data] exchangeObjectAtIndex:[fromIndexPath row] 
                     withObjectAtIndex:[toIndexPath row]];
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *name = [[self data] objectAtIndex:[indexPath row]];
    [[self detailViewController] setDetailItem:name];
}

@end
