//
//  CardDataModelTest.m
//  Cards
//
//  Created by Kefas on 18.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CardDataModel.h"

@interface CardDataModelTest : XCTestCase

@end

@implementation CardDataModelTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testIfInitProperly{
    NSDictionary *testDict = [[NSDictionary alloc]initWithObjectsAndKeys:@"1234",@"id",@"To do",@"name",@"98765443",@"idBoard",@"98765443",@"idList", @"0",@"close",@"Lorem ipsum ... bla bla bla",@"desc", nil];
    CardDataModel *testModel = [[CardDataModel alloc]initWithDictionary:testDict];
    
    XCTAssert([testModel.card_id isEqual:[testDict objectForKey:@"id"]] && [testModel.name isEqual:[testDict objectForKey:@"name"]] && [testModel.idBoard isEqual:[testDict objectForKey:@"idBoard"]] && [testModel.idList isEqual:[testDict objectForKey:@"idList"]] && [testModel.description isEqual:[testDict objectForKey:@"desc"]]);
    
}

-(void)testIfErroOccur{
    NSDictionary *testDic = [NSDictionary dictionaryWithObject:@"error" forKey:@"error"];
    CardDataModel *testModel = [[CardDataModel alloc] initWithDictionary:testDic];
    XCTAssertTrue([[testModel error] isEqualToString:@"error"],@"Alerts Data Model not initialized properly");
}

-(void)testIfEntryIsNotNSDictionary{
    NSString *testString = @"Treat";
    CardDataModel *alert = [[CardDataModel alloc]initWithDictionary:(NSDictionary*)testString];
    
    XCTAssertTrue([[alert error] isEqual: @"error"],@"Alerts Data Model not initialized properly");
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
