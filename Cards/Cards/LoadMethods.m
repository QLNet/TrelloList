//
//  LoadMethods.m
//  Cards
//
//  Created by Kefas on 12.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import "LoadMethods.h"
#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"
#import "defs.h"
#import "ListDataModel.h"
#import "CardDataModel.h"

@implementation LoadMethods

@synthesize lists = _lists;

static LoadMethods *defMethods;

+(LoadMethods*)defaultMethods{
    if (!defMethods) {
        defMethods = [[LoadMethods alloc] init];
    }
    return defMethods;
}

-(void)getMainListsTo:(void(^)(NSArray*))lists{
    apiKey = TRELLO_DEV_KEY;
    token = TRELLO_TOKEN;
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", MAIN_URL]]];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:apiKey,@"key", nil];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"%@/boards/PdSmOzK7/lists", MAIN_URL]
                                                      parameters:params];

    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *responseArray = [[NSMutableArray alloc] init];
        for (NSDictionary* dic in responseObject) {
            ListDataModel *list = [[ListDataModel alloc] initWithDictionary:dic];
            [responseArray addObject:list];
        }
        _lists = [NSArray arrayWithArray:responseArray];
        lists(responseArray);
     
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", operation.responseString);
        
    }];
    [operation start];
}

-(NSArray*)getMainLists{
    
    return _lists;
}

-(void)getCardsForListId:(NSString*)ident to:(void(^)(NSArray*))cards{
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", MAIN_URL]]];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:apiKey,@"key", nil];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"%@/lists/%@/cards", MAIN_URL,ident]
                                                      parameters:params];
    
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *responseArray = [[NSMutableArray alloc] init];
        for (NSDictionary* dic in responseObject) {
            CardDataModel *list = [[CardDataModel alloc] initWithDictionary:dic];
            [responseArray addObject:list];
        }
        cards(responseArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", operation.responseString);
        
    }];
    [operation start];
}

-(void)deleteCardId:(NSString*)ident to:(void(^)(NSDictionary*))dic{
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", MAIN_URL]]];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:apiKey,@"key",token,@"token",nil];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"DELETE"
                                                            path:[NSString stringWithFormat:@"%@/cards/%@", MAIN_URL,ident]
                                                      parameters:params];
    
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        dic(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", operation.responseString);
        
    }];
    [operation start];
}

-(void)postCardForListId:(NSString*)listId andTitle:(NSString*)title to:(void(^)(NSDictionary*))dic{
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", MAIN_URL]]];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:apiKey,@"key",token,@"token",title,@"name",listId,@"idList",nil];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:[NSString stringWithFormat:@"%@/lists/%@/cards", MAIN_URL,listId]
                                                      parameters:params];
    
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        dic(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", operation.responseString);
        
    }];
    [operation start];
}

-(void)putDescription:(NSString*)desc forCardId:(NSString*)cardId to:(void(^)(NSDictionary*))dic{
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", MAIN_URL]]];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:apiKey,@"key",token,@"token",desc,@"value",nil];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"PUT"
                                                            path:[NSString stringWithFormat:@"%@/cards/%@/desc", MAIN_URL,cardId]
                                                      parameters:params];
    
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        dic(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", operation.responseString);
        
    }];
    [operation start];
}

-(void)putCard:(NSString*)cardId toList:(NSString*)listId to:(void(^)(NSDictionary*))dic{
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", MAIN_URL]]];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:apiKey,@"key",token,@"token",listId,@"value",nil];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"PUT"
                                                            path:[NSString stringWithFormat:@"%@/cards/%@/idList", MAIN_URL,cardId]
                                                      parameters:params];
    
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        dic(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", operation.responseString);
        
    }];
    [operation start];
}


@end
