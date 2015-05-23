//
//  AdjustmentTests.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import XCTest;
@import Imgix;

@interface AdjustmentTests : XCTestCase
@property (nonatomic, readonly) IGXClient *client;
@end

@implementation AdjustmentTests

@synthesize client = _client;

- (IGXClient *)client {
	if (!_client) {
		_client = [[IGXClient alloc] initWithHost:@"nothingmagical.imgix.net" token:nil];
	}
	return _client;
}


- (void)testBrightness {
	self.client.brightness = 50;
	XCTAssertEqualObjects(@"bri=50", [self.client URLWithPath:@"sam.jpg"].query);

	self.client.brightness = -50;
	XCTAssertEqualObjects(@"bri=-50", [self.client URLWithPath:@"sam.jpg"].query);

	XCTAssertThrows(self.client.brightness = -101);
	XCTAssertThrows(self.client.brightness = 101);
}

@end
