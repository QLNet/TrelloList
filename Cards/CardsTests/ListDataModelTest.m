//
//  ListDataModelTest.m
//  Cards
//
//  Created by Kefas on 18.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ListDataModel.h"

@interface ListDataModelTest : XCTestCase

@end

@implementation ListDataModelTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testIfInitProperly{
    NSDictionary *testDict = [[NSDictionary alloc]initWithObjectsAndKeys:@"1234",@"id",@"To do",@"name",@"98765443",@"idBoard", @"0",@"close", nil];
    ListDataModel *testModel = [[ListDataModel alloc]initWithDictionary:testDict];
    
    XCTAssert([[testModel list_id] isEqual:[testDict objectForKey:@"id"]] && [[testModel name] isEqual:[testDict objectForKey:@"name"]] && testModel.idBoard == [[testDict objectForKey:@"idBoard"] integerValue]);
    
}

-(void)testIfErroOccur{
    NSDictionary *testDic = [NSDictionary dictionaryWithObject:@"error" forKey:@"error"];
    ListDataModel *testModel = [[ListDataModel alloc] initWithDictionary:testDic];
    XCTAssertTrue([[testModel error] isEqualToString:@"error"],@"Alerts Data Model not initialized properly");
}

-(void)testIfEntryIsNotNSDictionary{
    NSString *testString = @"Treat";
    ListDataModel *alert = [[ListDataModel alloc]initWithDictionary:(NSDictionary*)testString];
    
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
