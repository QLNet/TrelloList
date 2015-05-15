//
//  CardDetailViewController.m
//  Cards
//
//  Created by Kefas on 14.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import "CardDetailViewController.h"
#import "LoadMethods.h"
#import "ListDataModel.h"

@interface CardDetailViewController ()

@property(nonatomic, weak) IBOutlet UITextView *descTV;
@property(nonatomic, weak) IBOutlet UIButton *toDoBtn;
@property(nonatomic, weak) IBOutlet UIButton *doingBtn;
@property(nonatomic, weak) IBOutlet UIButton *doneBtn;

@end

@implementation CardDetailViewController
@synthesize cardModel = _cardModel;
@synthesize descTV = _descTV;
@synthesize toDoBtn = _toDoBtn, doingBtn = _doingBtn, doneBtn = _doneBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _cardModel.name;
    _descTV.text = _cardModel.description;
    _descTV.delegate = self;
    _toDoBtn.tag = 0;
    _doingBtn.tag = 1;
    _doneBtn.tag = 2;
    [self deselectAllButtons];
    NSArray *mainLists = [[LoadMethods defaultMethods] getMainLists];
    
    for (int i = 0; i< [mainLists count]; i++) {
        ListDataModel *listModel = [mainLists objectAtIndex:i];
        if ([_cardModel.idList isEqualToString:listModel.list_id]) {
            switch (i)
            {
                case 0:
                    _toDoBtn.selected = YES;
                    break;
                case 1:
                    _doingBtn.selected = YES;
                    break;
                case 2:
                    _doneBtn.selected = YES;
                    break;
                default:
                    [self deselectAllButtons];
                    break;
            }
        }
    }
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)deselectAllButtons{
    _toDoBtn.selected = NO;
    _doingBtn.selected = NO;
    _doneBtn.selected = NO;
}

#pragma mark UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(saveChanges)];
    
}

-(void)saveChanges{
    [[LoadMethods defaultMethods] putDescription:_descTV.text forCardId:_cardModel.card_id to:^(NSDictionary *dic){
        [self showMessageWithText:@"Changes succesfully saved on the server"];
        [self.view endEditing:YES];
        
    }];
}

-(void)showMessageWithText:(NSString*)text{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved" message:text delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

-(IBAction)changeListPressed:(id)sender{
    UIButton *btn = sender;
    if (!btn.selected) {
        ListDataModel *list = [[[LoadMethods defaultMethods] getMainLists] objectAtIndex:btn.tag];
        [[LoadMethods defaultMethods] putCard:_cardModel.card_id toList:list.list_id to:^(NSDictionary *dic){
            [self deselectAllButtons];
            btn.selected = YES;
            [self showMessageWithText:@"Card saved on the list"];
        }];
    }
    
}

@end
