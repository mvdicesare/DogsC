//
//  ImagesCollectionViewController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRAImagesCollectionViewController.h"
#import "CRABreed.h"
#import "CRASubBreed.h"
#import "CRAImageCollectionViewCell.h"
#import "CRABreedNetworkClient.h"
#import "DogsC_Master-Swift.h"

@interface CRAImagesCollectionViewController ()

@end

@implementation CRAImagesCollectionViewController

//set a static constant for reuse Identifier
static NSString * const reuseIdentifier = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    //set title to dog's breed/subBreed name
    self.title = self.breed.name.capitalizedString;
    if(self.subBreed){
        NSString *title = [[self.subBreed.name.capitalizedString stringByAppendingString:@" "] stringByAppendingString:self.breed.name.capitalizedString];
        self.title = title;
    }
    //run URL fetch
    [self fetchImageURLs];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%li", self.imageURLs.count);
    return self.imageURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //use our custom cell
    CRAImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //create a URL from our string we have in our array
    NSURL *imageURL = [NSURL URLWithString:self.imageURLs[indexPath.row]];
    // cell will load image on it's own
    cell.imageURL = imageURL;
    return cell;
}


-(void)fetchImageURLs
{
    //If subBreed exists fetch the imageURLs for the subBreed given
    if(self.subBreed){
        [[CRABreedNetworkClient sharedController] fetchSubBreedImageURLs:self.subBreed breed:self.breed completion:^(NSArray *fetchedURLs) {
            //set source of Truth for file here so we only have to determine if we are fetching subBreed or Breed images once
            self.imageURLs = fetchedURLs;
            //get back on main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                //reload view
                [[self collectionView] reloadData];
            });
        }];
    }else{
        //If subBreed doesn't exist fetch the imageURLs for the Breed given
        [[CRABreedNetworkClient sharedController] fetchBreedImageURLs: self.breed completion:^(NSArray *fetchedURLs) {
            //set source of Truth for file here so we only have to determine if we are fetching subBreed or Breed images once
            self.imageURLs = fetchedURLs;
            //get back on main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                //reload view
                [[self collectionView] reloadData];
            });
        }];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toDetailVC"])
    {
        //get the first object from the array of indexPathsForSelected Items and make that our indexPath for our selected cell
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems]firstObject];
        //pull the string from that index and make it into a URL
        NSURL *dogImageURL = [NSURL URLWithString:self.imageURLs[indexPath.row]];
        //define our destination View Controller
        DetailViewController *destinationVC = segue.destinationViewController;
        //send the URL to the landing pad
        destinationVC.dogImageURL = dogImageURL;
        if(self.breed){
            //if breed is available send a breed
            destinationVC.breed = self.breed;
        }
        if(self.subBreed){
            //if sub-breed is available send a breed
            destinationVC.subBreed = self.subBreed;
        }
    }
}

@end
