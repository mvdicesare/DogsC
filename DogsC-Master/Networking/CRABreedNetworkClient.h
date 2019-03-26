//
//  CRABreedController.h
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/21/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>
//Classes needed for the Networking Client
@class CRABreed;
@class CRAImage;
@class CRASubBreed;

@interface CRABreedNetworkClient : NSObject

//Fetch a list of all breeds and sub breeds
- (void)fetchAllBreeds: (void (^) (NSArray *))completion;

//fetch breed image URLs
//https://dog.ceo/api/breed/hound/images
- (void)fetchBreedImageURLs:(CRABreed *)breed completion:(void (^) (NSArray *))completion;

//fetch subbreed image URLs
//https://dog.ceo/api/breed/hound/basset/images
- (void)fetchSubBreedImageURLs:(CRASubBreed *)subBreed breed:(CRABreed *)breed completion:(void (^) (NSArray *))completion;

//fetch image data
- (void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *imageData, NSError *error))completion;

//shared instance method
+ (CRABreedNetworkClient *)sharedController;

@end

