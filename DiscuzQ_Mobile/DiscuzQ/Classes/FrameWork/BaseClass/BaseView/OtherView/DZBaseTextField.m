//
//  DZBaseTextField.m
//  DiscuzQ
//
//  Created by WebersonGao on 2017/7/14.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseTextField.h"

@implementation DZBaseTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commitInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commitInit];
    }
    return self;
}

- (void)commitInit {
    UIToolbar *keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneClicked:)];
    UIBarButtonItem *fix = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:fix,doneButton, nil]];
    self.inputAccessoryView = keyboardDoneButtonView;
}

- (void)doneClicked:(UIBarButtonItem *)sender {
    [self resignFirstResponder];
}



@end
