//
//  ImagesCollectionViewController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "ImagesCollectionViewController.h"
#import "CRABreed.h"
#import "CRASubBreed.h"
#import "ImageCollectionViewCell.h"
#import "CRABreedController.h"

@interface ImagesCollectionViewController ()

@end

@implementation ImagesCollectionViewController

static NSString * const reuseIdentifier = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Register cell classes
    [self.collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self fetchImageURLs];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%li", _imageURLs.count);
    return _imageURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSURL *imageURL = [NSURL URLWithString:_imageURLs[indexPath.row]];
    [cell setBackgroundColor: [UIColor blueColor]];
    
    [CRABreedController.sharedController fetchImageData:imageURL completion:^(NSData *imageData, NSError *error) {
        if (error || !imageData) {
            NSLog(@"Error fetching image data %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (![indexPath isEqual:[collectionView indexPathForCell:cell]]) {
                return; // Cell has been reused for another photo
            }
            cell.imageView.image = [UIImage imageWithData:imageData];
            
        });
    }];
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {

}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 

-(void)fetchImageURLs
{
    
    if([_breed.subBreeds  count] > 0){
        //        [CRABreedController.sharedController fetchSubBreedImageURLs:_subBreed completion:^(NSArray *fetchedURLs) {
        //            self->_imageURLs = fetchedURLs;
        //            dispatch_group_leave(group);
        //            [[self collectionView] reloadData];
        //        }];
    }else{
        [CRABreedController.sharedController fetchBreedImageURLs: _breed completion:^(NSArray *fetchedURLs) {
            self->_imageURLs = fetchedURLs;
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self collectionView] reloadData];
            });
        }];
    }
}

//- (void)setBreed:(CRABreed *)breed
//{
//    [[self collectionView] reloadData];
//}
//- (void)setSubBreed:(CRASubBreed *)subBreed
//{
//    [[self collectionView] reloadData];
//}

@end
