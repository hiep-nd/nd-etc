//
//  NDValidators.mm
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDEtc/NDValidators.h>

#import <vector>

@interface NDValidators ()
@end

@implementation NDValidators {
  std::vector<__weak id<NDValidator>> _references;
}

- (instancetype)initWithReferences:(NSArray<id<NDValidator>>*)references {
  self = [super init];
  if (self) {
    _references.resize(references.count);
    [references enumerateObjectsUsingBlock:^(id<NDValidator> obj,
                                             NSUInteger idx, BOOL*) {
      _references[idx] = obj;
    }];
  }
  return self;
}

- (BOOL)isValid {
  for (id<NDValidator> i : _references) {
    if (i && !i.isValid) {
      return NO;
    }
  }
  return YES;
}

- (BOOL)validate {
  for (id<NDValidator> i : _references) {
    if (i) {
      [i validate];
    }
  }
  return self.isValid;
}

@end
