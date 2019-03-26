//
//  ImageCollectionViewCell.h
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRAImageCollectionViewCell : UICollectionViewCell
//properties
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSURL * imageURL;
@end

NS_ASSUME_NONNULL_END
