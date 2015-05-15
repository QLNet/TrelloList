//
//  ListDataModel.h
//  Cards
//
//  Created by Kefas on 13.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListDataModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *list_id;
@property (nonatomic) NSInteger idBoard;
@property (nonatomic) BOOL closed;

-(id)initWithDictionary:(NSDictionary*)dic;
-(id)initWithListDataModel:(ListDataModel*)list;


@end
