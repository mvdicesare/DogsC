//
//  MVDImagesCollectionViewController.m
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDImagesCollectionViewController.h"


@interface MVDImagesCollectionViewController ()

@end

@implementation MVDImagesCollectionViewController

static NSString * const reuseIdentifier = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.breed.name.capitalizedString;
    if(self.subBreed)
    {
    NSString *title = [[self.subBreed.name.capitalizedString stringByAppendingString:@" "]
                       stringByAppendingString:self.breed.name.capitalizedString];
        self.title = title;
    }
    [self fetchImageData];
    
  
}
//- (void)setMVDBreed:(MVDNetworkController *)MVDBreed
//{
//    if(MVDBreed != _MVDBreed)
//    {
//        _MVDBreed != MVDBreed;
//        [self.collectionView reloadData];
//    }
//}
//- (void)setSubBreed:(MVDSubBreed *)subBreed
//{
//    if(MVDSubBreed != _MVDSubBreed)
//    {
//        _MVDSubBreed != MVDSubBreed
//        [self.collectionView reloadData];
//    }
//}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageUrls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MVDImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSURL *imageUrl = [NSURL URLWithString:self.imageUrls[indexPath.row]];
    cell.imageURL = imageUrl;
    return cell;
}
- (void)fetchImageData
{
    if(self.subBreed)
    {
        [MVDNetworkController fetchSubBreedsImagesURLs:self.subBreed breed:self.breed completion:^(NSArray<MVDSubBreed *> * fetchURL) {
            self.imageUrls = fetchURL;
            dispatch_async(dispatch_get_main_queue(), ^
            {
                [[self collectionView] reloadData];
            });
            
        }];
        
    }
    else
    {
        [MVDNetworkController fetchBreedImagesURLs:self.breed completion:^(NSArray<MVDBreed *> * fetchedUrls)
        {
            self.imageUrls = fetchedUrls;
            dispatch_async(dispatch_get_main_queue(), ^
            {
            [[self collectionView] reloadData];
            });
        }];
    }
}
    
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toDetailVC"])
    {
        NSIndexPath *indexpath = [[self.collectionView indexPathsForSelectedItems]firstObject];
        NSURL *dogImageURL = [NSURL URLWithString:self.imageUrls[indexpath.row]];
        MVDDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.dogimageURL = dogImageURL;
        if(self.breed)
        {
            destinationVC.breed = self.breed;
        }
        if(self.subBreed)
        {
            destinationVC.subBreed = self.subBreed;
        }
    }
}
    
    
    
    


@end
