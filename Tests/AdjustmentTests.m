//
//  AdjustmentTests.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "TestHelper.h"

@interface AdjustmentTests : TestCase
@end

@implementation AdjustmentTests

- (void)testBrightness {
	self.client.brightness = 50;
	XCTAssertEqualObjects(@"bri=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.brightness);

	self.client.brightness = -50;
	XCTAssertEqualObjects(@"bri=-50", [self.client URLWithPath:@"sam.jpg"].query);

	XCTAssertThrows(self.client.brightness = -101);
	XCTAssertThrows(self.client.brightness = 101);
}

- (void)testContrast {
	self.client.contrast = 50;
	XCTAssertEqualObjects(@"con=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.contrast);

	XCTAssertThrows(self.client.contrast = -101);
	XCTAssertThrows(self.client.contrast = 101);
}

- (void)testExposure {
	self.client.exposure = 50;
	XCTAssertEqualObjects(@"exp=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.exposure);

	XCTAssertThrows(self.client.exposure = -101);
	XCTAssertThrows(self.client.exposure = 101);
}

- (void)testGamma {
	self.client.gamma = 50;
	XCTAssertEqualObjects(@"gam=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.gamma);

	XCTAssertThrows(self.client.gamma = -101);
	XCTAssertThrows(self.client.gamma = 101);
}

- (void)testHighlights {
	self.client.highlights = 50;
	XCTAssertEqualObjects(@"high=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.highlights);

	XCTAssertThrows(self.client.highlights = -101);
	XCTAssertThrows(self.client.highlights = 101);
}

- (void)testInvert {
	self.client.invert = YES;
	XCTAssertEqualObjects(@"invert=true", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertTrue(self.client.invert);

	self.client.invert = NO;
	XCTAssertNil([self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertFalse(self.client.invert);
}

- (void)testSaturation {
	self.client.saturation = 50;
	XCTAssertEqualObjects(@"sat=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.saturation);

	XCTAssertThrows(self.client.saturation = -101);
	XCTAssertThrows(self.client.saturation = 101);
}

- (void)testShadows {
	self.client.shadows = 50;
	XCTAssertEqualObjects(@"shad=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.shadows);

	XCTAssertThrows(self.client.shadows = -101);
	XCTAssertThrows(self.client.shadows = 101);
}

- (void)testSharpen {
	self.client.sharpen = 50;
	XCTAssertEqualObjects(@"sharp=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual((NSUInteger)50, self.client.sharpen);

	XCTAssertThrows(self.client.sharpen = -1);
	XCTAssertThrows(self.client.sharpen = 101);
}

- (void)testUnsharpMask {
	self.client.unsharpMask = 3.14;
	XCTAssertEqualObjects(@"usm=3.14", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqualWithAccuracy((double)3.14, self.client.unsharpMask, 0.0);
}

- (void)testUnsharpMaskRadius {
	self.client.unsharpMaskRadius = 2.71;
	XCTAssertEqualObjects(@"usmrad=2.71", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqualWithAccuracy((double)2.71, self.client.unsharpMaskRadius, 0.0);

	XCTAssertThrows(self.client.unsharpMaskRadius = -1.0);
}

- (void)testVibrance {
	self.client.vibrance = 50;
	XCTAssertEqualObjects(@"vib=50", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(50, self.client.vibrance);

	XCTAssertThrows(self.client.vibrance = -101);
	XCTAssertThrows(self.client.vibrance = 101);
}

@end
