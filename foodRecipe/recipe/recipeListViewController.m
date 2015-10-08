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
    
    recipeListTableViewCell_horizontal  *cell_recommend;
    recipeListTableViewCell_horizontal  *cell_subscribe;
    recipeListTableViewCell_vertical    *cell_normal;
}
@end

@implementation recipeListViewController

- (void)initVars {
    
    recipeArray = [NSMutableArray array];
    
    [[MakcipeAPIRecipeService recipeService] make_All_Recipe_list:nil
                                                          success:^(NSMutableArray *response) {
                                                              recipeArray = response;
                                                              [self.listView reloadData];
                                                              [cell_recommend.listView reloadData];
                                                              [cell_subscribe.listView reloadData];
                                                              [cell_normal.listView reloadData];
                                                          } failure:^(NSError *error) {
                                                              
                                                          }];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UINib* horizontalNib = [UINib nibWithNibName:@"recipeListTableViewCell_horizontal" bundle:nil];
    UINib* verticalNib = [UINib nibWithNibName:@"recipeListTableViewCell_vertical" bundle:nil];
    [_listView registerNib:horizontalNib forCellReuseIdentifier:@"recipeListTableViewCell_horizontal"];
    [_listView registerNib:verticalNib forCellReuseIdentifier:@"recipeListTableViewCell_vertical"];
    
    [self initVars];
    
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
        return [recipeListSize heightForRecommend];
    }
    else if (indexPath.section == 1) {
        return [recipeListSize heightForSubscribe];
    }
    else if (indexPath.section == 2) {
        return [recipeListSize heightForNormal:recipeArray.count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UINib *nib = [UINib nibWithNibName:@"recipeListCell" bundle:nil];
    UINib *nib_recommend = [UINib nibWithNibName:@"recipeListCell_recommend" bundle:nil];
    UINib *nib_subscribe = [UINib nibWithNibName:@"recipeListCell_subscribe" bundle:nil];
    
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        cell_recommend = (recipeListTableViewCell_horizontal*)[tableView dequeueReusableCellWithIdentifier:@"recipeListTableViewCell_horizontal"];
        [cell_recommend.titleLabel setText:NSLocalizedString(@"추천 레시피", nil)];
        [cell_recommend.listView setTag:RECIPETYPE_RECOMM];
        [cell_recommend.listView setDataSource:self];
        [cell_recommend.listView setDelegate:self];
        [cell_recommend.listView setScrollEnabled:YES];
        [cell_recommend.listView registerNib:nib_recommend forCellWithReuseIdentifier:@"recipeListCell_recommend"];
        
        cell = cell_recommend;
    }
    else if (indexPath.section == 1) {
        cell_subscribe = (recipeListTableViewCell_horizontal*)[tableView dequeueReusableCellWithIdentifier:@"recipeListTableViewCell_horizontal"];
        [cell_subscribe.titleLabel setText:NSLocalizedString(@"내가 구독한 레시피", nil)];
        [cell_subscribe.listView setTag:RECIPETYPE_SUBSC];
        [cell_subscribe.listView setDataSource:self];
        [cell_subscribe.listView setDelegate:self];
        [cell_subscribe.listView setScrollEnabled:YES];
        [cell_subscribe.listView registerNib:nib_subscribe forCellWithReuseIdentifier:@"recipeListCell_subscribe"];
        
        cell = cell_subscribe;
    }
    else if (indexPath.section == 2) {
        cell_normal = (recipeListTableViewCell_vertical*)[tableView dequeueReusableCellWithIdentifier:@"recipeListTableViewCell_vertical"];
        [cell_normal.titleLabel setText:NSLocalizedString(@"막쓰는 레시피", nil)];
        [cell_normal.listView setTag:RECIPETYPE_NONE];
        [cell_normal.listView setDataSource:self];
        [cell_normal.listView setDelegate:self];
        [cell_normal.listView setScrollEnabled:NO];
        [cell_normal.listView registerNib:nib forCellWithReuseIdentifier:@"recipeListCell"];
        
        cell = cell_normal;
    }
    
    [cell.contentView setUserInteractionEnabled:NO];
    
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
    if (collectionView.tag == RECIPETYPE_RECOMM) {

    }
    else if (collectionView.tag == RECIPETYPE_SUBSC) {

    }
    else if (collectionView.tag == RECIPETYPE_NONE) {

    }
    
    return recipeArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView.tag == RECIPETYPE_RECOMM) {
        return [recipeListSize sizeForRecommendCell];
    }
    else if (collectionView.tag == RECIPETYPE_SUBSC) {
        return [recipeListSize sizeForSubscribeCell];
    }
    else if (collectionView.tag == RECIPETYPE_NONE) {
        return [recipeListSize sizeForNormalCell];
    }
    
    return CGSizeZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    if (collectionView.tag == RECIPETYPE_RECOMM) {
        return [recipeListSize minimumInteritemSpacingForRecommend];
    }
    else if (collectionView.tag == RECIPETYPE_SUBSC) {
        return [recipeListSize minimumInteritemSpacingForSubscribe];
    }
    else if (collectionView.tag == RECIPETYPE_NONE) {
        return [recipeListSize minimumInteritemSpacingForNormal];
    }
    
    return 20.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    if (collectionView.tag == RECIPETYPE_RECOMM) {
        return [recipeListSize minimumLineSpacingForRecommend];
    }
    else if (collectionView.tag == RECIPETYPE_SUBSC) {
        return [recipeListSize minimumLineSpacingForSubscribe];
    }
    else if (collectionView.tag == RECIPETYPE_NONE) {
        return [recipeListSize minimumLineSpacingForNormal];
    }
    
    return 20.f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (collectionView.tag == RECIPETYPE_RECOMM) {
        return [recipeListSize insetForRecommend];
    }
    else if (collectionView.tag == RECIPETYPE_SUBSC) {
        return [recipeListSize insetForSubscribe];
    }
    else if (collectionView.tag == RECIPETYPE_NONE) {
        return [recipeListSize insetForNormal];
    }
    
    return UIEdgeInsetsMake(20.f, 20.f, 0, 20.f);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    recipeListCell *cell;
    
    if (collectionView.tag == RECIPETYPE_RECOMM) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recipeListCell_recommend" forIndexPath:indexPath];
    }
    else if (collectionView.tag == RECIPETYPE_SUBSC) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recipeListCell_subscribe" forIndexPath:indexPath];
    }
    else if (collectionView.tag == RECIPETYPE_NONE) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recipeListCell" forIndexPath:indexPath];
    }
    
    makcipeAPIRecipe *recipe = [recipeArray objectAtIndex:indexPath.row];
    [cell setUserThumbnailWithURL:recipe.writerPic];
    [cell setRecipeImageWithURL:recipe.recipePic];
    [cell setUserName:recipe.writerName];
    [cell setRecipeComment:recipe.recipeComment];
    
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
