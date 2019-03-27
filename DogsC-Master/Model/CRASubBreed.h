//
//  CRASubBreed.h
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/23/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRASubBreed : NSObject

//MARK: - Properties
@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, copy, readonly) NSArray * imageURLs;

//MARK: - Initialization

- (instancetype)initWithName:(NSString *)name imageURLs:(NSArray *)imageURLs;

@end
