//
//  ViewController.m
//  collectionview
//
//  Created by ilyas on 8/29/16.
//  Copyright © 2016 ilyas. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()
{
    NSArray *arrayOfImages;
    int pos;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[self myCollectionView]setDataSource:self];
    [[self myCollectionView]setDelegate:self];
    
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.myCollectionView.collectionViewLayout = collectionViewFlowLayout;
    
    self.myCollectionView.pagingEnabled = NO;
 
    arrayOfImages = [[NSArray alloc] initWithObjects:
                     @"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",
                     @"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg",
                     @"9.jpg",@"10.jpg",@"11.jpg",@"12.jpg",
                     nil];
}

//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    [self.myCollectionView layoutIfNeeded];
//
//    //NSIndexPath *indexPath = [NSIndexPath indexPathForItem:[arrayOfImages count] inSection:1]; // compute some index path
//    NSIndexPath *indexPath =[arrayOfImages objectAtIndex:0];
//    
//    [self.myCollectionView scrollToItemAtIndexPath:indexPath
//                                atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
//                                        animated:YES];
//}

// add delegate methods below

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return [arrayOfImages count];

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{

    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,100,100)];
//    imgView.contentMode = UIViewContentModeScaleAspectFit;
//    imgView.clipsToBounds = YES;
//    imgView.image = [arrayOfImages objectAtIndex:indexPath.row];
//    [cell addSubview:imgView];
    cell.myImage.image = [UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]];
    
    //[[cell myImage]setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]]];
   // [[cell myImage]setImage:[UIImage imageNamed:@"1.png"]];
   // cell.transform = self.myCollectionView.transform;

    
    return cell;
    

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //top, left, bottom, right
    return UIEdgeInsetsMake(0, 16, 0, 16);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //return CGSizeMake( self.view.frame.size.width / 3, 140);
    return CGSizeMake( 160, 160);

    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // pos represents previous or initial position
    // indexPath represents clicked cell position
    
    if(indexPath.row > pos)
    {
        if (indexPath.row - pos == 2) {
            pos = pos + 1;
        }
        [self changeDate];
    }
    else if (indexPath.row == pos)
    {
        NSLog(@"Do Nothing");
    }
    else
    {
        if (indexPath.row + 2 == pos) {
            pos = pos - 1;
        }
        [self changeDate1];
    }
    //NSLog(@"%@",[arrDate objectAtIndex:indexPath.row]);
}

-(void)changeDate
{
    if (pos<(arrayOfImages.count - 2)) {
        pos=pos+1;
        [self.myCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:pos inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
        NSLog(@"%@",[arrayOfImages objectAtIndex:pos]);
        //self.lblMovieName.text =[arrayOfImages objectAtIndex:pos];
    }
}
-(void)changeDate1
{
    if(pos>2)
    {
        pos=pos-1;
        [self.myCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:pos inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
        NSLog(@"%@",[arrayOfImages objectAtIndex:pos]);
        //self.lblMovieName.text =[arrayOfImages objectAtIndex:pos];
    }
    else{
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
