//
// Created by Kate Polyakova on 5/30/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AlphabetItem;

@protocol ModelConsumer <NSObject>

- (void)setupWithModel:(AlphabetItem *)model;

@end