//
//  CardListViewController.h
//  Cards
//
//  Created by Kefas on 13.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDataModel.h"

@interface CardListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property(nonatomic,weak) IBOutlet UITableView *tView;
@property (nonatomic, strong) NSArray *cards;
@property (nonatomic, strong) ListDataModel *listModel;

@end
