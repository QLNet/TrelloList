//
//  CardDetailViewController.h
//  Cards
//
//  Created by Kefas on 14.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardDataModel.h"

@interface CardDetailViewController : UIViewController<UITextViewDelegate>

@property (nonatomic, strong) CardDataModel *cardModel;

@end
