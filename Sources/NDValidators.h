//
//  NDValidators.h
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDEtc/NDValidator.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDValidators : NSObject <NDValidator>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithReferences:(NSArray<id<NDValidator>>*)references;

@end

NS_ASSUME_NONNULL_END
