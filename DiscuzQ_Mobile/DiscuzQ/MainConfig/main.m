//
//  main.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/2/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZQDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([DZQDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
