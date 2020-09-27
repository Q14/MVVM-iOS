//
//  FYGenericViewController.h
//  MVVM-iOS
//
//  Created by Q14 on 2020/9/27.
//

#import <UIKit/UIKit.h>
#import "DataBinderProtocol.h"

NS_ASSUME_NONNULL_BEGIN
//只接受满足DataBinderProtocol 协议的泛型
@interface FYGenericViewController<ViewModelType: id<DataBinderProtocol>> : UIViewController
@property (nonatomic, strong) ViewModelType viewModel;
@end

NS_ASSUME_NONNULL_END
