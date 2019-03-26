//
//  SubBreedsListTableViewController.h
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CRABreed;

NS_ASSUME_NONNULL_BEGIN

@interface CRASubBreedsListTableViewController : UITableViewController
//landing pad property
@property (nonatomic, strong) CRABreed * breed;

@end

NS_ASSUME_NONNULL_END
