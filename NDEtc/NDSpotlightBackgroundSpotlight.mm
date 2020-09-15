//
//  NDSpotlightBackgroundSpotlight.mm
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import "NDSpotlightBackgroundSpotlight+Protected.h"

#import <NDEtc/NDSpotlightBackground.h>

@implementation NDSpotlightBackgroundSpotlight

- (void)setFrame:(CGRect)frame {
  if (CGRectEqualToRect(_frame, frame)) {
    return;
  }

  [_background setNeedsDisplayInRect:_frame];
  _frame = frame;
  _center = [self calculateCenter];
  [_background setNeedsDisplayInRect:frame];
}

- (void)setCenter:(CGPoint)center {
  if (CGPointEqualToPoint(_center, center)) {
    return;
  }

  [_background setNeedsDisplayInRect:_frame];
  _frame = CGRectMake(_frame.origin.x + (center.x - _center.x),
                      _frame.origin.y + (center.y - _center.y),
                      _frame.size.width, _frame.size.height);
  _center = center;
  [_background setNeedsDisplayInRect:_frame];
}

- (void)setArrowFrame:(CGRect)arrowFrame {
  if (CGRectEqualToRect(_arrowFrame, arrowFrame)) {
    return;
  }

  [_background setNeedsDisplayInRect:_arrowFrame];
  _arrowFrame = arrowFrame;
  [_background setNeedsDisplayInRect:_arrowFrame];
}

- (void)setArrowImage:(UIImage*)arrowImage {
  if (_arrowImage == arrowImage) {
    return;
  }
  _arrowImage = arrowImage;
  [_background setNeedsDisplayInRect:_arrowFrame];
}

- (CGPoint)calculateCenter {
  return CGPointMake(_frame.origin.x + _frame.size.width / 2,
                     _frame.origin.y + _frame.size.height / 2);
}

@end
