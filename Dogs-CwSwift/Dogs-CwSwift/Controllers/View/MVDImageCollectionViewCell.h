//
//  MVDImageCollectionViewCell.h
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVDImageCollectionViewCell.h"
#import "MVDNetworkController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVDImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dogImageOnImage;
@property(nonatomic, strong) NSURL *imageURL;
@end

NS_ASSUME_NONNULL_END
