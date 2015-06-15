//
//  AlphabetTextCollectionViewCell.m
//  PlayWithCollectionView
//
//  Created by Kate Polyakova on 5/30/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "AlphabetTextCollectionViewCell.h"
#import "AlphabetItem.h"

@interface AlphabetTextCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *letterLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation AlphabetTextCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setupWithModel: (AlphabetItem *) model{
    self.letterLabel.text = model.letter;
    self.textLabel.text = model.itemDescription;
    self.letterLabel.textColor = model.color;
}

@end
