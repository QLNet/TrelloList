//
//  BoardViewController.m
//  Cards
//
//  Created by Kefas on 13.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import "BoardViewController.h"
#import "LoadMethods.h"
#import "ListDataModel.h"
#import "CardListViewController.h"
#import "CardDetailViewController.h"

@interface BoardViewController ()
@property(nonatomic,weak) IBOutlet UITableView *tView;
@property(nonatomic,strong) NSArray* listArray;

@end

@implementation BoardViewController
@synthesize tView = _tView;
@synthesize listArray = _listArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    _tView.tableFooterView = [UIView new];
    self.navigationController.navigationBar.topItem.title = @"My_Board";
    [[LoadMethods defaultMethods] getMainListsTo:^(NSArray *lists){
        _listArray = lists;
        [_tView reloadData];
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"My_Board";
}

#pragma mark UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_listArray count];;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListDataModel *listModel = [[ListDataModel alloc] initWithListDataModel:[_listArray objectAtIndex:indexPath.row]];
    static NSString *cellIdentifier = @"myCellIdentifier";
    UITableViewCell *cell = [_tView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell.textLabel setText:listModel.name];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ListDataModel *listModel = [[ListDataModel alloc] initWithListDataModel:[_listArray objectAtIndex:indexPath.row]];
    [[LoadMethods defaultMethods] getCardsForListId:listModel.list_id to:^(NSArray *cards){
        CardListViewController *cardListController = [[CardListViewController alloc] initWithNibName:@"CardListViewController" bundle:nil];
        cardListController.cards = cards;
        cardListController.listModel = listModel;
        UINavigationController *navigationController = self.navigationController;
        [navigationController pushViewController:cardListController animated:YES];
    }];
}

@end
