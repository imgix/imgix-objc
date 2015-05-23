//
//  StylizeTests.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "TestHelper.h"

@interface StylizeTests : TestCase
@end

@implementation StylizeTests

- (void)testBlur {
	self.client.blur = 50;
	XCTAssertEqualObjects(@"blur=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.blur);

	XCTAssertThrows(self.client.blur = -1);
	XCTAssertThrows(self.client.blur = 2001);
}

- (void)testHalftone {
	self.client.halftone = 50;
	XCTAssertEqualObjects(@"htn=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.halftone);

	XCTAssertThrows(self.client.halftone = -1);
	XCTAssertThrows(self.client.halftone = 101);
}

- (void)testPixelate {
	self.client.pixelate = 50;
	XCTAssertEqualObjects(@"px=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.pixelate);

	XCTAssertThrows(self.client.pixelate = -1);
	XCTAssertThrows(self.client.pixelate = 101);
}

- (void)testSepia {
	self.client.sepia = 50;
	XCTAssertEqualObjects(@"sepia=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.sepia);

	XCTAssertThrows(self.client.sepia = -1);
	XCTAssertThrows(self.client.sepia = 101);
}

@end
