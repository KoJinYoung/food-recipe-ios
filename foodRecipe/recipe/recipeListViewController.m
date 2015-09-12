//
//  recipeListViewController.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 12..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import "recipeListViewController.h"
#import "recipe.h"

@interface recipeListViewController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSArray* testImageURL;
    NSMutableArray* recipeArray;
}
@end

@implementation recipeListViewController

- (void)initVars {
    testImageURL = @[@"http://pds21.egloos.com/pds/201206/03/15/d0013015_4fca36c2b2529.jpg",
                     @"http://pds23.egloos.com/pds/201206/03/15/d0013015_4fca36c8791af.jpg",
                     @"http://pds24.egloos.com/pds/201206/03/15/d0013015_4fca36cf50ed3.jpg",
                     @"http://pds21.egloos.com/pds/201206/03/15/d0013015_4fca36d64248c.jpg"];
    
    recipeArray = [NSMutableArray array];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UINib* horizontalNib = [UINib nibWithNibName:@"recipeListTableViewCell_horizontal" bundle:nil];
    UINib* verticalNib = [UINib nibWithNibName:@"recipeListTableViewCell_vertical" bundle:nil];
    [_listView registerNib:horizontalNib forCellReuseIdentifier:@"recipeListTableViewCell_horizontal"];
    [_listView registerNib:verticalNib forCellReuseIdentifier:@"recipeListTableViewCell_vertical"];
}

#pragma mark - table view
#pragma mark -datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 495;
    }
    else if (indexPath.section == 1) {
        return 495;
    }
    else if (indexPath.section == 2) {
        return ((_listView.frame.size.width-10.f-5.f)/2.0f) * (CGFloat)testImageURL.count + 20.f;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UINib *nib = [UINib nibWithNibName:@"recipeListCell" bundle:nil];
    
    UITableViewCell *cell;
    
    return cell;
}

#pragma mark -delegate


#pragma mark - collection view
#pragma mark -datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

#pragma mark for test
    return testImageURL.count;
    return recipeArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView.tag == RECIPETYPE_RECOMM) {
        return CGSizeMake(_listView.frame.size.width-40.f, 475.f);
    }
    else if (collectionView.tag == RECIPETYPE_SUBSC) {
        return CGSizeMake(_listView.frame.size.width-40.f, 475.f);
    }
    else if (collectionView.tag == RECIPETYPE_NONE) {
        return CGSizeMake((_listView.frame.size.width-10.f-5.f)/2.f, (_listView.frame.size.width-10.f-5.f)/2.f);
    }
    
    return CGSizeZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 20.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 20.f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(20.f, 20.f, 0, 20.f);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell;
    return cell;
}

#pragma mark -delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetailRecipe" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetailRecipe"]) {
        
    }
}

@end
