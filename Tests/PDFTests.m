//
//  PDFTests.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "TestHelper.h"

@interface PDFTests : TestCase
@end

@implementation PDFTests

- (void)testPDFPage {
	self.client.PDFPage = 2;
	XCTAssertEqualObjects(@"page=2", [self.client URLWithPath:@"sam.jpg"].query);
	XCTAssertEqual(2, self.client.PDFPage);
}

@end
