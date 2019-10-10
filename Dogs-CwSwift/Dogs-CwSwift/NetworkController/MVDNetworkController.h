//
//  MVDNetworkController.h
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVDBreed.h"
#import "MVDSubBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVDNetworkController : NSObject


+(void)fetchAllBreeds:(void (^) (NSArray<MVDBreed *> *))completion;

+(void)fetchBreedImagesURLs:(MVDBreed*)breed completion:(void (^) (NSArray<MVDBreed *> *))completion;

+(void)fetchSubBreedsImagesURLs:(MVDSubBreed*)subBreed breed:(MVDBreed*)breed completion:(void (^) (NSArray<MVDSubBreed *> *))completion;

+(void)fetchImageData:(NSURL*)url completion:(void (^) (NSData *imageData, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
