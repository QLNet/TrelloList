//
//  CardListViewControllerTest.m
//  Cards
//
//  Created by Kefas on 18.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CardListViewController.h"

@interface CardListViewControllerTest : XCTestCase

@property (nonatomic,strong) CardListViewController *vc;

@end

@implementation CardListViewControllerTest

- (void)setUp {
    [super setUp];
    self.vc = [[CardListViewController alloc] initWithNibName:@"CardListViewController" bundle:nil];
    [self.vc performSelectorOnMainThread:@selector(viewDidLoad) withObject:nil waitUntilDone:YES];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIfParentViewHasTableViewSubview{
    NSArray *subviews = [self.vc.view subviews];
    XCTAssertTrue([subviews containsObject:self.vc.tView], @"View does not have a table subview");
}

- (void)testthatViewConformsToUiTableViewDataSource{
    XCTAssertTrue([self.vc conformsToProtocol:@protocol(UITableViewDataSource)], @"View doesn't hove DataSource Protocol");
}

- (void)testThatViewConformsToUITableViewDelegate
{
    XCTAssertTrue([self.vc conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
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
