//
//  DataBinderProtocol.h
//  Pods
//
//  Created by Q14 on 2020/9/27.
//

#ifndef DataBinderProtocol_h
#define DataBinderProtocol_h
@protocol DataBinderProtocol <NSObject>
- (void)bind:(id<DataBinderProtocol>)viewModel; // id -> viewModel
@end

#endif /* DataBinderProtocol_h */
