//
//  CardDataModel.h
//  Cards
//
//  Created by Kefas on 13.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardDataModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *card_id;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *idBoard;
@property (nonatomic, strong) NSString *idList;
@property (nonatomic) BOOL closed;

-(id)initWithDictionary:(NSDictionary*)dic;
-(id)initWithCardDataModel:(CardDataModel*)list;

@end
