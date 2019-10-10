//
//  MVDNetworkController.m
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDNetworkController.h"

static NSString * const kBaseUrl = @"https://dog.ceo/api";
static NSString * const kBreeds = @"breeds/list/all";
static NSString * const kbaseBreedImage = @"https://dog.ceo/api/breed/";
static NSString * const kImageComponet =@"images";

@implementation MVDNetworkController

+ (void)fetchAllBreeds:(void (^)(NSArray<MVDBreed *> * _Nonnull))completion
{
    NSURL *url = [NSURL URLWithString:kBaseUrl];
    NSURL *finalURL = [url URLByAppendingPathComponent:kBreeds];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error fetching data %@", error);
            completion([NSArray new]);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (!data)
        {
            NSLog(@"error with fetching data");
            completion([[NSArray alloc] init]);
            return;
        }
        
        NSDictionary *topLevelDict = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        if (error)
        {
            NSLog(@"Error fetching data %@", error);
            completion([NSArray new]);
            return;
        }
        NSDictionary *messageDict = topLevelDict[@"message"];
        
        NSMutableArray *arrayOfBreeds = [NSMutableArray new];
        for (id key in messageDict)
        {
            NSMutableArray *subBreeds = [NSMutableArray new];
            for (NSString *name in messageDict[key])
            {
                MVDSubBreed *subBreed = [[MVDSubBreed alloc] initWithName:name breedUrls:[NSMutableArray new]];
                [arrayOfBreeds addObject:subBreed];
            }
                
                MVDBreed *breed = [[MVDBreed alloc] initWithName:key subBreed:subBreeds imageUrls:[NSMutableArray new]];
            [arrayOfBreeds addObject:breed];
                
        }
        completion(arrayOfBreeds);
        
    }] resume];
}
+ (void)fetchBreedImagesURLs:(MVDBreed *)breed completion:(void (^)(NSArray<MVDBreed *> * _Nonnull))completion
{
    NSURL *url = [NSURL URLWithString:kbaseBreedImage];
    NSURL *breedPassedinUrl = [url URLByAppendingPathComponent:breed.name];
    NSURL *finalUrl = [breedPassedinUrl URLByAppendingPathComponent:kImageComponet];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
    if (error)
        {
            NSLog(@"Error fetching data %@", error);
            completion([NSArray new]);
            return;
        }
        if (!data)
        {
            NSLog(@"error with fetching data");
            completion([[NSArray alloc] init]);
            return;
        }
        NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        if (error)
        {
            NSLog(@"Error fetching data %@", error);
            completion([NSArray new]);
            return;
        }
        NSMutableArray *image = JSONDictionary[@"message"];
        completion(image);
        
    }]resume];
    
}
+ (void)fetchSubBreedsImagesURLs:(MVDSubBreed *)subBreed breed:(MVDBreed *)breed completion:(void (^)(NSArray<MVDSubBreed *> * _Nonnull))completion
{
    NSURL *url = [NSURL URLWithString:kbaseBreedImage];
    NSURL *breedPassIn = [url URLByAppendingPathComponent:breed.name];
    NSURL *subBreedPassedIn = [breedPassIn URLByAppendingPathComponent:subBreed.name];
    NSURL *finalUrl = [subBreedPassedIn URLByAppendingPathComponent:kbaseBreedImage];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
    if (error)
    {
        NSLog(@"Error fetching data %@", error);
        completion([NSArray new]);
        return;
    }
    if (!data)
    {
        NSLog(@"error with fetching data");
        completion([[NSArray alloc] init]);
        return;
    }
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
    if (error)
    {
        NSLog(@"Error fetching data %@", error);
        completion([NSArray new]);
        return;
    }
    NSMutableArray *image = JSONDictionary[@"message"];
    completion(image);
        
    }] resume];
}
+ (void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *imageData, NSError *error))completion
{
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error)
        {
            NSLog(@"Error fetching breds from search term %@", error);
            completion(nil, error);
            return;
        }
        if (!data)
        {
            NSLog(@"Error fetching breds from search term %@", data);
            return;
        }
          //  completion(UIImage);
        completion(data, nil );
    }] resume];
}
@end
