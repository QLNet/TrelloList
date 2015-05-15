//
//  ListDataModel.m
//  Cards
//
//  Created by Kefas on 13.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import "ListDataModel.h"

@implementation ListDataModel

@synthesize list_id = _list_id;
@synthesize name = _name;
@synthesize closed = _closed;
@synthesize idBoard = _idBoard;

-(id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.list_id = [dic objectForKey:@"id"];
        self.name = [dic objectForKey:@"name"];
        self.idBoard = [[dic objectForKey:@"idBoard"] integerValue];
        self.closed = [[dic objectForKey:@"closed"] boolValue];
        
    }
    
    return self;
}

-(id)initWithListDataModel:(ListDataModel *)list{
    self = [super init];
    if (self) {
        self.list_id = list.list_id;
        self.name = list.name;
        self.idBoard = list.idBoard;
        self.closed = list.closed;
    }
    
    return self;
}

@end
