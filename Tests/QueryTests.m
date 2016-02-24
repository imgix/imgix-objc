//
//  QueryTests.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "TestHelper.h"

@interface QueryTests : TestCase
@end

@implementation QueryTests

- (void)testQueryStringCombining {
	XCTAssertNil([self.client URLWithPath:@"sam.jpg"].query);

	self.client.brightness = 50;
	XCTAssertEqualObjects(@"bri=50", [self.client URLWithPath:@"sam.jpg"].query);

	self.client.exposure = 20;
	XCTAssertEqualObjects(@"bri=50&exp=20", [self.client URLWithPath:@"sam.jpg"].query);

	self.client.contrast = 30;
	XCTAssertEqualObjects(@"bri=50&con=30&exp=20", [self.client URLWithPath:@"sam.jpg"].query);
}

- (void)testQueryStringValueEscaping {
    self.client.downloadFileName = @"/foo'> <script>alert('hacked')</script><";
    XCTAssertEqualObjects(@"dl=/foo'%3E%20%3Cscript%3Ealert('hacked')%3C/script%3E%3C", [self.client URLWithPath:@"sam.jpg"].query);
}

@end
