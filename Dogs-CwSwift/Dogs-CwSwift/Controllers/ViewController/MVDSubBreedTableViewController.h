//
//  MVDSubBreedTableViewController.h
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <UIKit/UIKit.h>
//needed for landing pad
@class MVDBreed;

NS_ASSUME_NONNULL_BEGIN

@interface MVDSubBreedTableViewController : UITableViewController
// landing pad
@property(nonatomic, strong) MVDBreed *breed;

@end

NS_ASSUME_NONNULL_END
