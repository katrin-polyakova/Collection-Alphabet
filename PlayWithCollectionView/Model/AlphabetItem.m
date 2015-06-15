//
// Created by Kate Polyakova on 5/16/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "AlphabetItem.h"


@implementation AlphabetItem {

}
- (instancetype)initWithImageName:(NSString *)imageName letter:(NSString *)letter color:(UIColor *)color itemDescription:(NSString *)itemDescription {
    self = [super init];
    if (self) {
        self.imageName = imageName;
        self.letter = letter;
        self.color = color;
        self.itemDescription = itemDescription;
    }

    return self;
}

+ (instancetype)itemWithImageName:(NSString *)imageName letter:(NSString *)letter color:(UIColor *)color {
    return [[self alloc] initWithImageName:imageName letter:letter color:color itemDescription:nil];
}

@end





