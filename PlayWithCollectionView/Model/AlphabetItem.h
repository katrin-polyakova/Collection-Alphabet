//
// Created by Kate Polyakova on 5/16/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AlphabetItem : NSObject
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *itemDescription;
@property (strong, nonatomic) NSString *letter;
@property (strong, nonatomic) UIColor *color;

- (instancetype)initWithImageName:(NSString *)imageName letter:(NSString *)letter color:(UIColor *)color itemDescription:(NSString *)itemDescription;

+ (instancetype)itemWithImageName:(NSString *)imageName letter:(NSString *)letter color:(UIColor *)color;


@end







