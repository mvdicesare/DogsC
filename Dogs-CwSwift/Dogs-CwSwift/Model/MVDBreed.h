//
//  MVDBreed.h
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVDBreed : NSObject

@property(nonatomic, readonly, copy)NSString *name;
@property(nonatomic, readonly, copy)NSArray *subBreed;
@property(nonatomic, readonly, copy)NSArray *imageUrls;

-(MVDBreed *)initWithName:(NSString *)name subBreed:(NSArray *)subBreed imageUrls:(NSArray *)imageUrls;

@end

NS_ASSUME_NONNULL_END
