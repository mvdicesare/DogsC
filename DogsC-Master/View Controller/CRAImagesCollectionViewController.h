//
//  ImagesCollectionViewController.h
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRABreed.h"
#import "CRASubBreed.h"
#import "CRAImageCollectionViewCell.h"
#import "CRABreedNetworkClient.h"
#import "DogsC_Master-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@class CRABreed;
@class CRASubBreed;

@interface CRAImagesCollectionViewController : UICollectionViewController
//properties
@property (nonatomic, strong) CRABreed * breed;
@property (nonatomic, strong) CRASubBreed * subBreed;
@property (nonatomic) NSArray * imageURLs;

//functions
-(void)fetchImageURLs;

@end

NS_ASSUME_NONNULL_END
