//
//  NDSpotlightBackground.m
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDEtc/NDSpotlightBackground.h>

#import "NDSpotlightBackgroundSpotlight+Protected.h"

@interface NDSpotlightBackground ()

@property(nonatomic, strong)
    NSArray<NDSpotlightBackgroundSpotlight*>* spotlights;

@end

@implementation NDSpotlightBackground

- (void)addSpotlight:(NDSpotlightBackgroundSpotlight*)spotlight {
  self.spotlights = self.spotlights
                        ? [self.spotlights arrayByAddingObject:spotlight]
                        : @[ spotlight ];
  spotlight.background = self;
  [self setNeedsDisplayInRect:spotlight.frame];
}

- (void)drawRect:(CGRect)rect {
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(ctx, self.backgroundColor.CGColor);
  CGContextAddRect(ctx, rect);
  CGContextFillPath(ctx);
  for (NDSpotlightBackgroundSpotlight* spotlight in self.spotlights) {
    auto frame = spotlight.frame;
    if (CGRectIntersectsRect(rect, frame)) {
      CGContextSetBlendMode(ctx, kCGBlendModeClear);
      // TODO: - check the clip to rect
      CGContextAddEllipseInRect(ctx, frame);
      CGContextFillPath(ctx);
    }

    auto arrowFrame = spotlight.arrowFrame;
    if (CGRectIntersectsRect(rect, arrowFrame)) {
      CGContextSaveGState(ctx);
      CGContextTranslateCTM(ctx, arrowFrame.origin.x,
                            CGRectGetMaxY(arrowFrame));
      CGContextScaleCTM(ctx, 1.0, -1.0);
      CGContextSetBlendMode(ctx, kCGBlendModeNormal);
      CGContextDrawImage(
          ctx, CGRectMake(0, 0, arrowFrame.size.width, arrowFrame.size.height),
          spotlight.arrowImage.CGImage);
      CGContextRestoreGState(ctx);
    }
  }
}

- (void)prepareForInterfaceBuilder {
  self.backgroundColor = UIColor.blueColor;

  auto spotlight = [[NDSpotlightBackgroundSpotlight alloc] init];
  spotlight.frame = CGRectMake(50, 50, 100, 100);
  [self addSpotlight:spotlight];
}

@end
