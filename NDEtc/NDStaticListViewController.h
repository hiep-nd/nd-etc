//
//  NDStaticListViewController.h
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDEtc/NDScrollViewController.h>

#import <NDMVVM/NDMVVM.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDStaticListViewController : NDScrollViewController <NDListView>

@property(nonatomic, strong, readonly) NSArray<__kindof NDView*>* itemViews;

- (void)registerClass:(Class)cls identifier:(NSString*)identifier;
- (void)registerClasses:(NSDictionary<NSString*, Class>*)classes;

@property(nonatomic, copy) __kindof NDView* (^_Nullable viewForItemHandler)
    (__kindof NDStaticListViewController*, NSInteger);

@end

@interface NDVerticalStaticMutableListViewController
    : NDScrollViewController <NDMutableListView>

@property(nonatomic, strong, readonly) NSArray<UIView*>* itemViews;
- (void)layoutItemViews;

@end

NS_ASSUME_NONNULL_END
