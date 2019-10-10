//
//  MVDImagesCollectionViewController.h
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVDBreed.h"
#import "MVDSubBreed.h"
#import "MVDImageCollectionViewCell.h"
#import "MVDNetworkController.h"
//#import "Dogs-CwSwift-Bridging-Header.h"


NS_ASSUME_NONNULL_BEGIN

@class MVDBreed;
@class MVDSubBreed;
@class MVDNetworkController;

@interface MVDImagesCollectionViewController : UICollectionViewController

@property (nonatomic, strong) MVDBreed *breed;
@property (nonatomic, strong) MVDSubBreed *subBreed;
@property (nonatomic) NSArray *imageUrls;
@property (nonatomic, strong) MVDNetworkController *MVDBreed;
@property (nonatomic, strong) MVDNetworkController *MVDSubBreed;
-(void)fetchImageData;

@end

NS_ASSUME_NONNULL_END
