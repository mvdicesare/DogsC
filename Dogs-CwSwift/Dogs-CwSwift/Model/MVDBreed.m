//
//  MVDBreed.m
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDBreed.h"


static NSString * const kName = @"message";

@implementation MVDBreed

- (MVDBreed *)initWithName:(NSString *)name subBreed:(NSArray *)subBreed imageUrls:(NSArray *)imageUrls
{
    self = [super init];
    if (self)
    {
        _name = name;
        _subBreed = subBreed;
        _imageUrls = imageUrls;
    }
    return self;
}

@end
