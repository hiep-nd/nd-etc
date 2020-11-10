//
//  NDStaticListViewController.mm
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import "NDStaticListViewController.h"

#import <NDLog/NDLog.h>
#import <NDMVVM/NDMVVM.h>

/*
@interface NDStaticListViewController()

@property(nonatomic, strong) NSArray<__kindof NDView*>* itemViews;
@property (nonatomic, strong) NSMutableDictionary<NSString*, Class>* classes;

@end

@implementation NDStaticListViewController

- (void)registerClass:(Class)cls identifier:(NSString*)identifier {
  if (!identifier) {
    NDAssertionFailure(@"Can not register class: '%@' with identifier: '%@'.",
cls, identifier); return;
  }

  self.classes[identifier] = cls;
}

- (void)registerClasses:(NSDictionary<NSString*, Class>*)classes {
  [classes
      enumerateKeysAndObjectsUsingBlock:^(NSString* key, Class obj, BOOL*) {
        [self registerClass:obj identifier:key];
      }];
}

@synthesize viewModel;

- (void)didSetViewModelFromOldViewModel:(__kindof id<NDViewModel>
_Nullable)oldViewModel { auto count = ViewModel(self).numberOfItems; auto
itemViews = [[NSMutableArray alloc] initWithCapacity:count]; for (NSInteger i =
0; i < count; i++) { auto viewModel = [ViewModel(self) viewModelForItem:i]; auto
identifier = viewModel.identifier; Class cls = nil; if (identifier) { cls =
self.classes[identifier]; if (!cls) { NDAssertionFailure(@"Can not dequeue class
for identifier: '%@'.", identifier);
      }
    } else {
      NDAssertionFailure(@"Item view model: '%@' has invalid identifier: '%@'.",
viewModel, identifier);

    }

    NDView* view = cls ? [[cls alloc] init] : [[NDView alloc] init];
    NDRoute(viewModel, view);
    [itemViews addObject:view];
  }
  self.itemViews = itemViews.copy;
}

- (BOOL)validateViewModel:(nonnull __kindof id<NDViewModel>)viewModel {
  return [viewModel conformsToProtocol:@protocol(NDListViewModel)];
}

- (void)manualInit {
  [super manualInit];
  self.classes = [[NSMutableDictionary alloc] init];
}

ViewModel_Default_Impl(NDListViewModel);

@end
*/
