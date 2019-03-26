//
//  CRASubBreed.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/23/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRASubBreed.h"

@implementation CRASubBreed

- (instancetype)initWithName: (NSString *)name imageURLs:(NSArray *)imageURLs
{
    
    self = [super init];
    if(self) {
        _name = name;
        _imageURLs = imageURLs;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"" imageURLs:[[NSArray alloc] init]];
}

@end
