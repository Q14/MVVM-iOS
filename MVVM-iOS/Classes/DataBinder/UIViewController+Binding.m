//
//  UIViewController+Binding.m
//  MVVM-iOS
//
//  Created by Q14 on 2020/9/27.
//

#import "UIViewController+Binding.h"
#import "NSObject+FYSwizzling.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface UIViewController()
//是否绑定过
@property (nonatomic, assign, getter=isBinded) BOOL binded;
@end

@implementation UIViewController (Binding)
+ (void)load {
    [self hookOrigInstanceMenthod:@selector(viewWillAppear:) swizzledMenthod:@selector(fy_viewWillAppear:)];
}

- (void)fy_viewWillAppear:(BOOL)animated {
    if (!self.isBinded) {
        //
        if ([self respondsToSelector:@selector(bindTransfrom)]) {
            [self bindTransfrom];
        }
    }
    [self fy_viewWillAppear:animated];
}

// 绑定
- (void)bindTransfrom {}

#pragma mark -SETTER&GETTER
- (void)setBinded:(BOOL)binded {
    objc_setAssociatedObject(self, @selector(isBinded), @(binded), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)isBinded {
    return  [objc_getAssociatedObject(self, @selector(isBinded)) boolValue];
    
}
@end
