//
//  QueryTests.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import XCTest;
@import Imgix;

@interface QueryTests : XCTestCase
@end

@implementation QueryTests

- (void)testQueryStringCombining {
	IGXClient *client = [[IGXClient alloc] initWithHost:@"nothingmagical.imgix.net" token:nil];
	XCTAssertNil([client URLWithPath:@"sam.jpg"].query);

	client.brightness = 50;
	XCTAssertEqualObjects(@"bri=50", [client URLWithPath:@"sam.jpg"].query);

	client.exposure = 20;
	XCTAssertEqualObjects(@"bri=50&exp=20", [client URLWithPath:@"sam.jpg"].query);

	client.contrast = 30;
	XCTAssertEqualObjects(@"bri=50&con=30&exp=20", [client URLWithPath:@"sam.jpg"].query);
}

- (void)testSignedQueryStringCombining {
	IGXClient *client = [[IGXClient alloc] initWithHost:@"nothingmagical.imgix.net" token:@"sMTidnYXXg9NB4qh"];
	XCTAssertEqualObjects(@"s=6925569b28658d7a7299f06d520a22dd", [client URLWithPath:@"sam.jpg"].query);

	client.brightness = 50;
	XCTAssertEqualObjects(@"bri=50&s=75f74662de00a39eb1ac9bd3bd25adb9", [client URLWithPath:@"sam.jpg"].query);
}

@end
