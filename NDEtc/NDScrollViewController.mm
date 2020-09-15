//
//  NDScrollViewController.mm
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDEtc/NDScrollViewController.h>

#import <NDAutolayoutUtils/NDAutolayoutUtils.h>
#import <NDLog/NDLog.h>
#import <NDUtils/NDUtils.h>

@interface NDScrollViewController () <UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView* scrollView;
@property(nonatomic, strong) UIView* contentView;
@property(nonatomic, strong) NSLayoutConstraint* verticalScrollConstraint;
@property(nonatomic, strong) NSLayoutConstraint* horizontalScrollConstraint;

@end

@implementation NDScrollViewController

- (void)manualInit {
  [super manualInit];

  self.scrollView = [[UIScrollView alloc] init];
  self.scrollView.backgroundColor = UIColor.clearColor;
  self.scrollView.delegate = self;
  [self.view nd_fillWithContentView:self.scrollView];

  self.contentView = [[UIView alloc] init];
  self.contentView.backgroundColor = UIColor.clearColor;
  [self.scrollView nd_fillWithContentView:self.contentView];

  self.verticalScrollEnabled = YES;
  self.horizontalScrollEnabled = NO;
}

- (void)setVerticalScrollEnabled:(BOOL)verticalScrollEnabled {
  _verticalScrollEnabled = verticalScrollEnabled;

  self.verticalScrollConstraint.active = NO;
  self.verticalScrollConstraint = [self.contentView.heightAnchor
      constraintEqualToAnchor:self.scrollView.heightAnchor];
  self.verticalScrollConstraint.priority = _verticalScrollEnabled ? 250 : 1000;
  self.verticalScrollConstraint.active = YES;
}

- (void)setHorizontalScrollEnabled:(BOOL)horizontalScrollEnabled {
  _horizontalScrollEnabled = horizontalScrollEnabled;

  self.horizontalScrollConstraint.active = NO;
  self.horizontalScrollConstraint = [self.contentView.widthAnchor
      constraintEqualToAnchor:self.scrollView.widthAnchor];
  self.horizontalScrollConstraint.priority =
      _horizontalScrollEnabled ? 250 : 1000;
  self.horizontalScrollConstraint.active = YES;
}

// MARK: - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didScrollHandler, self);
  }
}

- (void)scrollViewDidZoom:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didZoomHandler, self);
  }
}

- (void)scrollViewWillBeginDragging:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.willBeginDraggingHandler, self);
  }
}

- (void)scrollViewWillEndDragging:(UIScrollView*)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint*)targetContentOffset {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(
        self.willEndDraggingWithVelocityTargetContentOffsetHandler, self,
        velocity, targetContentOffset);
  }
}

- (void)scrollViewDidEndDragging:(UIScrollView*)scrollView
                  willDecelerate:(BOOL)decelerate {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didEndDraggingWillDecelerateHandler, self,
                         decelerate);
  }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.willBeginDeceleratingHandler, self);
  }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didEndDeceleratingHandler, self);
  }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didEndScrollingAnimationHandler, self);
  }
}

- (nullable UIView*)viewForZoomingInScrollView:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.viewForZoomingHandler, self);
  }
  return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView*)scrollView
                          withView:(nullable UIView*)view {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.willBeginZoomingWithViewHandler, self, view);
  }
}
- (void)scrollViewDidEndZooming:(UIScrollView*)scrollView
                       withView:(nullable UIView*)view
                        atScale:(CGFloat)scale {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didEndZoomingWithViewAtScaleHandler, self, view,
                         scale);
  }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.shouldScrollToTopHandler, self);
  }
  return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didScrollToTopHandler, self);
  }
}

- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView*)scrollView {
  if (self.scrollView != scrollView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didChangeAdjustedContentInsetHandler, self);
  }
}

@end
