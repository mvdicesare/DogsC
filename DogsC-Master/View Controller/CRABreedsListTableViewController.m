//
//  BreedsListTableViewController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/23/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRABreedsListTableViewController.h"
#import "CRABreed.h"
#import "CRABreedNetworkClient.h"
#import "CRASubBreedsListTableViewController.h"
#import "CRAImagesCollectionViewController.h"

@interface CRABreedsListTableViewController ()
@property (nonatomic, copy) NSArray *breeds;

@end

@implementation CRABreedsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //fetch breeds on first load
    [[CRABreedNetworkClient sharedController] fetchAllBreeds:^(NSArray *breeds) {
        self.breeds = breeds;
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self tableView] reloadData];
        });
    }];
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
    cell.textLabel.text = [[self.breeds[indexPath.row] name] capitalizedString];;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //When row is selected determine if the selected Breed has Sub-Breeds
    CRABreed * breed = self.breeds[[[[self tableView] indexPathForSelectedRow] row]];
    if( [breed.subBreeds count] > 0){
        //if there are subBreeds go to the SubBreedTableViewController
        [self performSegueWithIdentifier:@"toSubBreedVC" sender:self];
    }else{
        //if not, go to the ImageCollectionView
        [self performSegueWithIdentifier:@"toCollectionVC" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CRABreed * breed = self.breeds[[[[self tableView] indexPathForSelectedRow] row]];
     //When the segue is about to be performed, determine if the selected Breed has Sub-Breeds
    if([segue.identifier  isEqualToString: @"toSubBreedVC"])
    {
        //If it's to the SubBreedTableViewController. Send the breed to that landing pad.
        CRASubBreedsListTableViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;
        
    }else if([segue.identifier  isEqualToString: @"toCollectionVC"]){
        //If it's to the ImageCollectionView send the breed to that landing pad.
        CRAImagesCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;
    }
}

@end
