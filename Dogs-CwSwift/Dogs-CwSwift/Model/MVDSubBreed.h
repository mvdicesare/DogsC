//
//  MVDSubBreed.h
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVDSubBreed : NSObject

@property(nonatomic, copy, readonly)NSString *name;
@property(nonatomic, copy, readonly)NSArray *breedUrls;

-(MVDSubBreed *)initWithName:(NSString *)name breedUrls:(NSArray *)breedUrls;

@end

NS_ASSUME_NONNULL_END
