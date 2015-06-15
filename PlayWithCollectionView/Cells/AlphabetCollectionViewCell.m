//
//  AlphabetCollectionViewCell.m
//  PlayWithCollectionView
//
//  Created by Kate Polyakova on 5/16/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "AlphabetCollectionViewCell.h"
#import "AlphabetItem.h"

@interface AlphabetCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *letterImage;
@property (weak, nonatomic) IBOutlet UILabel *letterLabel;

@end

@implementation AlphabetCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setupWithModel: (AlphabetItem *) model{
    self.letterLabel.text = model.letter;
    self.letterImage.image = [UIImage imageNamed:model.imageName];
    self.letterLabel.textColor = model.color;
}


@end
