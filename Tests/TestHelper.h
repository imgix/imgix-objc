//
//  TestHelper.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import XCTest;
@import Imgix;

@interface TestCase : XCTestCase

@property (nonatomic, readonly) IGXClient *client;

@end
