//
//  ViewController.h
//  collectionview
//
//  Created by ilyas on 8/29/16.
//  Copyright © 2016 ilyas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;



@end

