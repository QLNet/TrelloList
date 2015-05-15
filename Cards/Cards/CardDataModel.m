//
//  CardDataModel.m
//  Cards
//
//  Created by Kefas on 13.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import "CardDataModel.h"

@implementation CardDataModel

@synthesize card_id = _card_id;
@synthesize name = _name;
@synthesize closed = _closed;
@synthesize idBoard = _idBoard;
@synthesize idList = _idList;
@synthesize description = _description;

-(id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.card_id = [dic objectForKey:@"id"];
        self.name = [dic objectForKey:@"name"];
        self.description = [dic objectForKey:@"desc"];
        self.idBoard = [dic objectForKey:@"idBoard"];
        self.closed = [[dic objectForKey:@"closed"] boolValue];
        self.idList = [dic objectForKey:@"idList"];
        
    }
    
    return self;
}

-(id)initWithCardDataModel:(CardDataModel *)card{
    self = [super init];
    if (self) {
        self.card_id = card.card_id;
        self.name = card.name;
        self.description = card.description;
        self.idBoard = card.idBoard;
        self.closed = card.closed;
        self.idList = card.idList;
    }
    
    return self;
}

@end
