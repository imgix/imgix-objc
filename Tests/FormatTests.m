//
//  FormatTests.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "TestHelper.h"

@interface FormatTests : TestCase
@end

@implementation FormatTests

- (void)testFormatToString {
	XCTAssertEqualObjects(@"gif", IGXFormatString(IGXFormatGIF));
	XCTAssertEqualObjects(@"jp2", IGXFormatString(IGXFormatJPEG2000));
	XCTAssertEqualObjects(@"jpg", IGXFormatString(IGXFormatJPEG));
	XCTAssertEqualObjects(@"json", IGXFormatString(IGXFormatJSON));
	XCTAssertEqualObjects(@"jxr", IGXFormatString(IGXFormatJPEGXR));
	XCTAssertEqualObjects(@"pjpg", IGXFormatString(IGXFormatProgressiveJPEG));
	XCTAssertEqualObjects(@"mp4", IGXFormatString(IGXFormatMP4));
	XCTAssertEqualObjects(@"png", IGXFormatString(IGXFormatPNG));
	XCTAssertEqualObjects(@"webp", IGXFormatString(IGXFormatWebP));
}

- (void)testStringToFormat {
	XCTAssertEqual(IGXFormatGIF, IGXFormatFromString(@"gif"));
	XCTAssertEqual(IGXFormatJPEG2000, IGXFormatFromString(@"jp2"));
	XCTAssertEqual(IGXFormatJPEG, IGXFormatFromString(@"jpg"));
	XCTAssertEqual(IGXFormatJSON, IGXFormatFromString(@"json"));
	XCTAssertEqual(IGXFormatJPEGXR, IGXFormatFromString(@"jxr"));
	XCTAssertEqual(IGXFormatProgressiveJPEG, IGXFormatFromString(@"pjpg"));
	XCTAssertEqual(IGXFormatMP4, IGXFormatFromString(@"mp4"));
	XCTAssertEqual(IGXFormatPNG, IGXFormatFromString(@"png"));
	XCTAssertEqual(IGXFormatWebP, IGXFormatFromString(@"webp"));
}


#pragma mark -

- (void)testDownloadFileName {
	self.client.downloadFileName = @"original.jpg";
	XCTAssertEqualObjects(@"dl=original.jpg", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(@"original.jpg", self.client.downloadFileName);
}

- (void)testFormat {
	self.client.format = IGXFormatJSON;
	XCTAssertEqualObjects(@"fm=json", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(IGXFormatJSON, self.client.format);
}

- (void)testQuality {
	XCTAssertEqual(75, self.client.quality);

	self.client.quality = 19;
	XCTAssertEqualObjects(@"q=19", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(19, self.client.quality);

	XCTAssertThrows(self.client.quality = -1);
	XCTAssertThrows(self.client.quality = 101);
}

- (void)testFramesPerSecond {
	self.client.framesPerSecond = 15;
	XCTAssertEqualObjects(@"fps=15", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(15, self.client.framesPerSecond);
}

- (void)testFrame {
	self.client.frame = 3;
	XCTAssertEqualObjects(@"frame=3", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(3, self.client.frame);
}

- (void)testLoop {
	self.client.loop = YES;
	XCTAssertEqualObjects(@"loop=true", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertTrue(self.client.loop);

	self.client.loop = NO;
	XCTAssertNil([self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertFalse(self.client.loop);
}

- (void)testReverse {
	self.client.reverse = YES;
	XCTAssertEqualObjects(@"reverse=true", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertTrue(self.client.reverse);

	self.client.reverse = NO;
	XCTAssertNil([self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertFalse(self.client.reverse);
}

@end
