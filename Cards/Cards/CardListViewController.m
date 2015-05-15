//
//  CardListViewController.m
//  Cards
//
//  Created by Kefas on 13.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import "CardListViewController.h"
#import "CardDetailViewController.h"
#import "CardDataModel.h"
#import "LoadMethods.h"

@interface CardListViewController ()

@property(nonatomic,weak) IBOutlet UITableView *tView;

@end

@implementation CardListViewController
@synthesize cards = _cards;
@synthesize tView = _tView;
@synthesize listModel = _listModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    _tView.tableFooterView = [UIView new];
    if ([_listModel.name isEqualToString:@"To do"]) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewCard)];
    }
    
    [_tView reloadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = _listModel.name;
    [self refreshContent];
}

-(void)refreshContent{
    [[LoadMethods defaultMethods] getCardsForListId:_listModel.list_id to:^(NSArray *cards){
        _cards = cards;
        [_tView reloadData];
    }];
}

-(void)addNewCard {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"New Card:" message:@"Please new card title" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField * alertTextField = [alert textFieldAtIndex:0];
    alertTextField.text = @"";
    [alert show];
}

#pragma mark UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        UITextField * alertTextField = [alertView textFieldAtIndex:0];
        NSString *cardName = alertTextField.text;
        [[LoadMethods defaultMethods] postCardForListId:_listModel.list_id andTitle:cardName to:^(NSDictionary *dic){
            [self refreshContent];
        }];
    }
    
}

#pragma mark UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_cards count];;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CardDataModel *cardModel = [[CardDataModel alloc] initWithCardDataModel:[_cards objectAtIndex:indexPath.row]];
    static NSString *cellIdentifier = @"myCellIdentifier";
    UITableViewCell *cell = [_tView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell.textLabel setText:cardModel.name];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CardDataModel *cardModel = [_cards objectAtIndex:indexPath.row];
    CardDetailViewController *detailController = [[CardDetailViewController alloc] initWithNibName:@"CardDetailViewController" bundle:nil];
    detailController.cardModel = cardModel;
    UINavigationController * navigationController = self.navigationController;
    [navigationController pushViewController:detailController animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CardDataModel *card = [_cards objectAtIndex:indexPath.row];
        [[LoadMethods defaultMethods] deleteCardId:card.card_id to:^(NSDictionary *dic) {
            [[self.tView cellForRowAtIndexPath:indexPath] resignFirstResponder];
            [self refreshContent];
            
            
        }];
        
    }
}


@end
