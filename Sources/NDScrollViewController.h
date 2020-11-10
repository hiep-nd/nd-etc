//
//  NDScrollViewController.h
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/NDManualObjects.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDScrollViewController : NDManualViewController

@property(nonatomic, strong, readonly) UIScrollView* scrollView;
@property(nonatomic, strong, readonly) UIView* contentView;

@property(nonatomic, assign, getter=isVerticalScrollEnabled)
    BOOL verticalScrollEnabled;
@property(nonatomic, assign, getter=isHorizontalScrollEnabled)
    BOOL horizontalScrollEnabled;

// MARK: - scrollView's scroll delegate handlers
/// any offset changes
@property(nonatomic, copy) void (^_Nullable didScrollHandler)
    (__kindof NDScrollViewController*);

/// any zoom scale changes
@property(nonatomic, copy) void (^_Nullable didZoomHandler)
    (__kindof NDScrollViewController*);

/// called on start of dragging (may require some time and or distance to move)
@property(nonatomic, copy) void (^_Nullable willBeginDraggingHandler)
    (__kindof NDScrollViewController*);

/// called on finger up if the user dragged. velocity is in points/millisecond.
/// targetContentOffset may be changed to adjust where the scroll view comes to
/// rest
@property(nonatomic, copy)
    void (^_Nullable willEndDraggingWithVelocityTargetContentOffsetHandler)
        (__kindof NDScrollViewController*, CGPoint, CGPoint*);

/// called on finger up if the user dragged. decelerate is true if it will
/// continue moving afterwards
@property(nonatomic, copy) void (^_Nullable didEndDraggingWillDecelerateHandler)
    (__kindof NDScrollViewController*, BOOL);

/// called on finger up as we are moving
@property(nonatomic, copy) void (^_Nullable willBeginDeceleratingHandler)
    (__kindof NDScrollViewController*);

/// called when scroll view grinds to a halt
@property(nonatomic, copy) void (^_Nullable didEndDeceleratingHandler)
    (__kindof NDScrollViewController*);

/// called when setContentOffset/scrollRectVisible:animated: finishes. not
/// called if not animating
@property(nonatomic, copy) void (^_Nullable didEndScrollingAnimationHandler)
    (__kindof NDScrollViewController*);

/// return a view that will be scaled. if delegate returns nil, nothing happens
@property(nonatomic, copy) UIView* _Nullable (^_Nullable viewForZoomingHandler)
    (__kindof NDScrollViewController*);

/// called before the scroll view begins zooming its content
@property(nonatomic, copy) void (^_Nullable willBeginZoomingWithViewHandler)
    (__kindof NDScrollViewController*, UIView* _Nullable);

/// scale between minimum and maximum. called after any 'bounce' animations
@property(nonatomic, copy) void (^_Nullable didEndZoomingWithViewAtScaleHandler)
    (__kindof NDScrollViewController*, UIView* _Nullable, CGFloat);

/// return a yes if you want to scroll to the top. if not defined, assumes YES
@property(nonatomic, copy) BOOL (^_Nullable shouldScrollToTopHandler)
    (__kindof NDScrollViewController*);

/// called when scrolling animation finished. may be called immediately if
/// already at top
@property(nonatomic, copy) void (^_Nullable didScrollToTopHandler)
    (__kindof NDScrollViewController*);

/// Also see -[UIScrollView adjustedContentInsetDidChange]
@property(nonatomic, copy)
    void (^_Nullable didChangeAdjustedContentInsetHandler)
        (__kindof NDScrollViewController*);

@end

NS_ASSUME_NONNULL_END
