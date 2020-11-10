//
//  NDValidator.mm
//  NDEtc
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDEtc/NDValidator.h>

#import <NDLog/NDLog.h>

@interface NDValidator ()

@property(nonatomic, copy) BOOL (^tester)(id _Nonnull);
@property(nonatomic, copy) void (^validChangedHandler)(id _Nonnull);

@end

@implementation NDValidator

- (instancetype)initWithOwner:(NSObject*)owner
                        valid:(BOOL)valid
                       tester:(BOOL (^)(NSObject*))tester
          validChangedHandler:(void (^)(NSObject*))validChangedHandler {
  self = [super initWithOwner:owner];
  if (self) {
    self.valid = valid;

    if (tester) {
      self.tester = tester;
    } else {
      NDAssertionFailure(@"Can not init with tester: '%@'.", tester);
    }

    if (validChangedHandler) {
      self.validChangedHandler = validChangedHandler;
    }
  }
  return self;
}

- (instancetype)initWithOwner:(NSObject*)owner
                       tester:(BOOL (^)(NSObject* _Nonnull))tester
          validChangedHandler:
              (void (^)(NSObject* _Nonnull))validChangedHandler {
  return [self initWithOwner:owner
                       valid:true
                      tester:tester
         validChangedHandler:validChangedHandler];
}

@synthesize valid;

- (void)setWithValid:(BOOL)valid {
  if (!self.owner) {
    NDAssertionFailure(@"Can not validate with owner: '%@'.", self.owner);
  }

  if (self.isValid != valid) {
    self.valid = valid;
    NDCallIfCan(self.validChangedHandler, self.owner);
  }
}

- (BOOL)validate {
  if (!self.owner || !self.tester) {
    NDAssertionFailure(@"Can not validate with owner: '%@' and tester: '%@'.",
                       self.owner, self.tester);
    return self.isValid;
  }

  auto isValid = self.tester(self.owner);
  [self setWithValid:isValid];
  return isValid;
}

@end
