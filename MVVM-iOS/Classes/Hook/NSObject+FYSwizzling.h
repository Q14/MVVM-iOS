//
//  NSObject+FYSwizzling.h
//  MVVM-iOS
//
//  Created by Q14 on 2020/9/27.
// 

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FYSwizzling)

/**
 originSEL 被hook 的方法名字
 swizzledSEL hook 后的方法名字
 
 attention: 1.注意 originSEL 或者swizzledSEL为空 不要在swizzledSEL调用swizzledSEL
 2. originSEL swizzledSEL都有值 需要在swizzledSEL 调用swizzledSEL
 */
+ (BOOL)hookOrigInstanceMenthod:(SEL)originSEL swizzledMenthod:(SEL)swizzledSEL;

@end

NS_ASSUME_NONNULL_END
