//
//  NDSpotlightBackground.h
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NDSpotlightBackgroundSpotlight;

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface NDSpotlightBackground : UIView

- (void)addSpotlight:(NDSpotlightBackgroundSpotlight*)spotlight;

@end

NS_ASSUME_NONNULL_END
