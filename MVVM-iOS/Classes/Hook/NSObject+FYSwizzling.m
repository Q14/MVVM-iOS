//
//  NSObject+FYSwizzling.m
//  MVVM-iOS
//
//  Created by Q14 on 2020/9/27.
//

#import "NSObject+FYSwizzling.h"
#import <objc/message.h>

@implementation NSObject (FYSwizzling)

/** 先保留 调试用
 struct objc_method {
    SEL name;
    const char *types;
    IMP imp;
};
 */

+ (BOOL)hookOrigInstanceMenthod:(SEL)originSEL swizzledMenthod:(SEL)swizzledSEL {
    Class cls = self;
    Method originMethod = class_getInstanceMethod(cls, originSEL);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSEL);
    
    //如果要交换的方法，则返回 originMethod不能判空 否则会误判 例如当前类没有不会查找父类
    if (!swizzledMethod ) {
        return NO;
    }
    

    // 用这个方法的原因是 class_addMethod这个方法的实现会覆盖父类的方法实现，但不会取代本类中已存在的实现，如果本类中包含一个同名的实现，则函数会返回NO
    BOOL didAddMethod = class_addMethod(cls, originSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    

    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzledMethod);
    }

    return YES;
}

@end
