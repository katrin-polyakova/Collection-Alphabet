//
//  ViewController.m
//  PlayWithCollectionView
//
//  Created by Kate Polyakova on 5/16/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "ViewController.h"
#import "AlphabetItem.h"
#import "ModelConsumer.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) NSArray *data;
@property(nonatomic) BOOL modeText;
@property(nonatomic, strong) id cellSizes;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[NSArray alloc] init];

    [self prepareData];

//    self.data = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"!", @"?"];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    self.collectionView.backgroundColor = [UIColor whiteColor];

    [self setupCellSizes];

    [self setupCollectionLayout:0];

    [self.collectionView registerNib:[UINib nibWithNibName:@"AlphabetCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"image_cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"AlphabetTextCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"text_cell"];
}

- (void)setupCollectionLayout:(NSUInteger)sizeIndex {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    CGSize size = [self.cellSizes[sizeIndex] CGSizeValue];
    
    layout.itemSize = size;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.collectionView setCollectionViewLayout:layout animated:YES];
}

- (void)setupCellSizes {
    CGSize small = CGSizeMake(70, 70);
    CGSize medium = CGSizeMake(130, 130);
    CGSize large = CGSizeMake(280, 280);   
    
    self.cellSizes = @[ [NSValue valueWithCGSize:small], [NSValue valueWithCGSize:medium],[NSValue valueWithCGSize:large] ];

}

- (void)prepareData {

    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:[[AlphabetItem alloc] initWithImageName:@"apple.jpg" letter:@"A" color:[UIColor grayColor] itemDescription:@"is the first letter of the alphabet"]];
    [array addObject:[[AlphabetItem alloc] initWithImageName:@"banana.jpg" letter:@"B" color:[UIColor grayColor] itemDescription:@"is the second letter of the alphabet"]];
    [array addObject:[[AlphabetItem alloc] initWithImageName:@"carrot.jpeg" letter:@"C" color:[UIColor grayColor] itemDescription:@"is the third letter of the alphabet"]];
    [array addObject:[[AlphabetItem alloc] initWithImageName:@"dog.png" letter:@"D" color:[UIColor grayColor] itemDescription:@"is the first fourth of the alphabet"]];
    [array addObject:[[AlphabetItem alloc] initWithImageName:@"elepant.jpg" letter:@"E" color:[UIColor grayColor] itemDescription:@"is the fifth letter of the alphabet"]];
    [array addObject:[[AlphabetItem alloc] initWithImageName:@"flamingo.jpg" letter:@"F" color:[UIColor grayColor] itemDescription:@"is the sixth letter of the alphabet"]];
    [array addObject:[[AlphabetItem alloc] initWithImageName:@"gift.jpg" letter:@"G" color:[UIColor grayColor] itemDescription:@"is the first seventh of the alphabet"]];
    [array addObject:[[AlphabetItem alloc] initWithImageName:@"hat.jpg" letter:@"H" color:[UIColor grayColor] itemDescription:@"is the first eighth of the alphabet"]];

    self.data = array;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell<ModelConsumer> *cell;

    NSString *identifier = self.modeText ? @"text_cell" : @"image_cell";
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    AlphabetItem *item = self.data [(NSUInteger)indexPath.item];
    [cell setupWithModel:item];
    
    
//    UICollectionViewCell *cell;
//    if(self.modeText){
//        AlphabetTextCollectionViewCell *textCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"text_cell" forIndexPath:indexPath];
//        AlphabetItem *item = self.data [(NSUInteger)indexPath.item];
//        [textCell setupWithModel:item];
//        cell = textCell;
//    } else{
//        AlphabetCollectionViewCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"image_cell" forIndexPath:indexPath];
//        AlphabetItem *item = self.data [(NSUInteger)indexPath.item];
//        [imageCell setupWithModel:item];
//        cell = imageCell;
//    }

//    CGFloat A = 180;
//    CGFloat B = 30;
//
//    CGFloat M = indexPath.row/(float)self.data.count;
//    CGFloat red = (A + B * cosf((float) (2.f * M_PI * M))) / 255.f;
//    CGFloat green = (A + B * cosf((float) ((float) (2.f * M_PI *  M) + 2.f * M_PI / 2))) / 255.f;
//    CGFloat blue = (A + B * cosf((float) ((float) (2.f * M_PI *  M) + 4.f * M_PI / 3))) / 255.f;
//    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
//
//    cell.backgroundColor = color;

    return cell;
}

- (IBAction)modeTapped:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    self.modeText = sender.selected;
    [self.collectionView reloadData];

}

- (IBAction)sizeSelected:(UISegmentedControl *)sender {

    [self setupCollectionLayout: (NSUInteger)sender.selectedSegmentIndex];

}


@end
