//
//  CRADog.h
//  DogsAndCatsC-Master
//
//  Created by Cody on 2/4/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRABreed : NSObject
//ID, Name, CountryCode, BredFor, breedGroup, lifeSpan, temperment, id, url

//MARK: - Properties
@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, copy, readonly) NSArray * subBreeds;
@property (nonatomic, copy, readonly) NSArray * imageURLs;


//MARK: - Initialization

- (instancetype)initWithName:(NSString *)name subBreeds:(NSArray *)subBreeds imageURLs:(NSArray *)imageURLs NS_DESIGNATED_INITIALIZER;


@end

