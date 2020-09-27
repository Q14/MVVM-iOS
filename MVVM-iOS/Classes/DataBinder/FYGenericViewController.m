//
//  FYGenericViewController.m
//  MVVM-iOS
//
//  Created by Q14 on 2020/9/27.
//

#import "FYGenericViewController.h"
#import "DataBinderProtocol.h"

@interface FYGenericViewController ()

@end

@implementation FYGenericViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)bindTransfrom {
    if ([self conformsToProtocol:@protocol(DataBinderProtocol)] && [self respondsToSelector:@selector(bind:)]) {
        [((id <DataBinderProtocol>)self) bind:self.viewModel];
    }
}

@end
