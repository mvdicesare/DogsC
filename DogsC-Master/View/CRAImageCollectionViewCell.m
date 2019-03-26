//
//  ImageCollectionViewCell.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRAImageCollectionViewCell.h"
#import "CRABreedNetworkClient.h"

@implementation CRAImageCollectionViewCell

- (void)prepareForReuse
{
    //when preparing for reuse, use the stock dog image
    [super prepareForReuse];
    self.imageView.image = [UIImage imageNamed:@"dog"];
}

//When ImageURL is set run this
- (void)setImageURL:(NSURL *)imageURL
{
    //fetch image data from imageURL
    [CRABreedNetworkClient.sharedController fetchImageData:imageURL completion:^(NSData *imageData, NSError *error) {
        if (error || !imageData) {
            NSLog(@"Error fetching image data %@", error);
            return;
        }
        //put back on main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            //set imageView
            self.imageView.image = [UIImage imageWithData:imageData];
        });
    }];
}

@end
