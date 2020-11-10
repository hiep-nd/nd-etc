//
//  NDValidator.h
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDUtils/NDUtils.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDValidatorProtocol)
@protocol NDValidator <NSObject>

@property(nonatomic, assign, getter=isValid, readonly) BOOL valid;

- (BOOL)validate;

@end

@interface NDValidator<__covariant Owner : NSObject*> : NDPossession <Owner>
<NDValidator>

    - (instancetype)initWithOwner : (Owner)owner NS_UNAVAILABLE;
- (instancetype)initWithOwner:(Owner)owner
                        valid:(BOOL)valid
                       tester:(BOOL (^)(Owner))tester
          validChangedHandler:(void (^_Nullable)(Owner))validChangedHandler
    NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithOwner:(Owner)owner
                       tester:(BOOL (^)(Owner))tester
          validChangedHandler:(void (^_Nullable)(Owner))validChangedHandler;

@property(nonatomic, assign, getter=isValid) BOOL valid;

- (void)setWithValid:(BOOL)valid NS_SWIFT_NAME(set(valid:));

@end

NS_ASSUME_NONNULL_END
