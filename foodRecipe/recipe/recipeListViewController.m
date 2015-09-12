//
//  recipeListViewController.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 12..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import "recipeListViewController.h"
#import "recipe.h"
#import "recipeListCells.h"
#import "MakcipeSDK.h"

@interface recipeListViewController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSMutableArray* recipeArray;
}
@end

@implementation recipeListViewController

- (void)initVars {
    
    makcipeAPIRecipe *recipe1 = [[makcipeAPIRecipe alloc] init];
    makcipeAPIRecipe *recipe2 = [[makcipeAPIRecipe alloc] init];
    makcipeAPIRecipe *recipe3 = [[makcipeAPIRecipe alloc] init];
    makcipeAPIRecipe *recipe4 = [[makcipeAPIRecipe alloc] init];
    
    [recipe1 setRecipePic:@"http://pds21.egloos.com/pds/201206/03/15/d0013015_4fca36c2b2529.jpg"];
    [recipe2 setRecipePic:@"http://pds23.egloos.com/pds/201206/03/15/d0013015_4fca36c8791af.jpg"];
    [recipe3 setRecipePic:@"http://pds24.egloos.com/pds/201206/03/15/d0013015_4fca36cf50ed3.jpg"];
    [recipe4 setRecipePic:@"http://pds21.egloos.com/pds/201206/03/15/d0013015_4fca36d64248c.jpg"];
    
    recipeArray = [NSMutableArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, nil];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UINib* horizontalNib = [UINib nibWithNibName:@"recipeListTableViewCell_horizontal" bundle:nil];
    UINib* verticalNib = [UINib nibWithNibName:@"recipeListTableViewCell_vertical" bundle:nil];
    [_listView registerNib:horizontalNib forCellReuseIdentifier:@"recipeListTableViewCell_horizontal"];
    [_listView registerNib:verticalNib forCellReuseIdentifier:@"recipeListTableViewCell_vertical"];
    
    [[MakcipeAPIRecipeService recipeService] getAll:@"RECIPE" success:^(NSString *response) {
        NSLog(@"%@", response);
    } failure:^(NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
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
        return ((_listView.frame.size.width-10.f-5.f)/2.0f) * (CGFloat)recipeArray.count + 20.f;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UINib *nib = [UINib nibWithNibName:@"recipeListCell" bundle:nil];
    
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        recipeListTableViewCell_horizontal *cell_ = (recipeListTableViewCell_horizontal*)[tableView dequeueReusableCellWithIdentifier:@"recipeListTableViewCell_horizontal"];
        [cell_.listView setTag:RECIPETYPE_RECOMM];
        [cell_.listView setDataSource:self];
        [cell_.listView setDelegate:self];
        [cell_.listView registerNib:nib forCellWithReuseIdentifier:@"recipeListCell"];
        
        cell = cell_;
    }
    else if (indexPath.section == 1) {
        recipeListTableViewCell_horizontal *cell_ = (recipeListTableViewCell_horizontal*)[tableView dequeueReusableCellWithIdentifier:@"recipeListTableViewCell_horizontal"];
        [cell_.listView setTag:RECIPETYPE_SUBSC];
        [cell_.listView setDataSource:self];
        [cell_.listView setDelegate:self];
        [cell_.listView registerNib:nib forCellWithReuseIdentifier:@"recipeListCell"];
        
        cell = cell_;
    }
    else if (indexPath.section == 2) {
        recipeListTableViewCell_vertical *cell_ = (recipeListTableViewCell_vertical*)[tableView dequeueReusableCellWithIdentifier:@"recipeListTableViewCell_vertical"];
        [cell_.listView setTag:RECIPETYPE_NONE];
        [cell_.listView setDataSource:self];
        [cell_.listView setDelegate:self];
        [cell_.listView setScrollEnabled:NO];
        [cell_.listView registerNib:nib forCellWithReuseIdentifier:@"recipeListCell"];
        
        cell = cell_;
    }
    
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
    
    recipeListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recipeListCell" forIndexPath:indexPath];
    
    makcipeAPIRecipe *recipe = [recipeArray objectAtIndex:indexPath.row];
    [cell setRecipeImageWithURL:recipe.recipePic];
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
