//
//  LoadMethods.h
//  Cards
//
//  Created by Kefas on 12.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoadMethods : NSObject{
    NSString *apiKey;
    NSString *token;
}

@property (nonatomic, strong) NSArray *lists;

+ (LoadMethods*) defaultMethods;

-(void)getMainListsTo:(void(^)(NSArray*))lists;
-(NSArray*)getMainLists;
-(void)getCardsForListId:(NSString*)ident to:(void(^)(NSArray*))cards;
-(void)deleteCardId:(NSString*)ident to:(void(^)(NSDictionary*))dic;
-(void)postCardForListId:(NSString*)listId andTitle:(NSString*)title to:(void(^)(NSDictionary*))dic;
-(void)putDescription:(NSString*)desc forCardId:(NSString*)cardId to:(void(^)(NSDictionary*))dic;
-(void)putCard:(NSString*)cardId toList:(NSString*)listId to:(void(^)(NSDictionary*))dic;

@end
