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
@synthesize error = _error;

#define nilIfNull(p) ({typeof(p) _p=(p);_p==[NSNull null]?nil:_p;})

-(id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        if ([dic isKindOfClass:[NSDictionary class]]) {
            if ([dic objectForKey:@"error"]) {
                self.error = @"error";
            }
            self.card_id = nilIfNull([dic objectForKey:@"id"]);
            self.name = nilIfNull([dic objectForKey:@"name"]);
            self.description = nilIfNull([dic objectForKey:@"desc"]);
            self.idBoard = nilIfNull([dic objectForKey:@"idBoard"]);
            self.closed = [[dic objectForKey:@"closed"] boolValue];
            self.idList = nilIfNull([dic objectForKey:@"idList"]);
        } else {
            self.error = @"error";
        }
        
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
        self.error = card.error;
    }
    
    return self;
}

@end
