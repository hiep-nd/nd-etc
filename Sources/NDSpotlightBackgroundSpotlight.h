//
//  NDSpotlightBackgroundSpotlight.h
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDSpotlightBackgroundSpotlight : NSObject

@property(nonatomic, assign) CGRect frame;
@property(nonatomic, assign) CGPoint center;
@property(nonatomic, strong) UIImage* arrowImage;
@property(nonatomic, assign) CGRect arrowFrame;

@end
NS_ASSUME_NONNULL_END
