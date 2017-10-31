//
//  RootViweController.m
//  CollectionViewDemo
//
//  Created by Hanser on 31/10/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "RootViweController.h"

@interface RootViweController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation RootViweController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CollectionView";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
