//
//  MVDSubBreed.m
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDSubBreed.h"

@implementation MVDSubBreed

- (MVDSubBreed *)initWithName:(NSString *)name breedUrls:(NSArray *)breedUrls
{
    self = [super init];
    if (self)
    {
        _name = name;
        _breedUrls = breedUrls;
    }
    return self;
}


@end
