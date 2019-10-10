//
//  MVDBreedTableViewController.m
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDBreedTableViewController.h"
#import "MVDBreed.h"
#import "MVDNetworkController.h"
#import "MVDSubBreedTableViewController.h"
#import "MVDImagesCollectionViewController.h"

@interface MVDBreedTableViewController ()
@property(nonatomic, copy) NSArray *breeds;
@end

@implementation MVDBreedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.breeds.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"breedCell" forIndexPath:indexPath];
   
    cell.textLabel.text = [[self.breeds[indexPath.row] name] capitalizedString];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVDBreed *breed = self.breeds[[[[self tableView] indexPathForSelectedRow] row]];
    if ([breed.subBreed count] > 0)
    {
        [self performSegueWithIdentifier:@"toSubBreedVC" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"toCollectionVC" sender:self];
    }
                        
}



#pragma mark - Navigation

//iiodd
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MVDBreed *breed = self.breeds[[[[self tableView] indexPathForSelectedRow] row]];
    if([segue.identifier isEqualToString:@"toSubBreedVC"])
    {
        MVDSubBreedTableViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;
    }
    else if ([segue.identifier isEqualToString:@"toCollectionVC"])
    {
        MVDImagesCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;
    }
}
@end
