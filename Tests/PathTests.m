//
//  PathTests.m
//  Imgix
//
//  Created by Kelly Sutton on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "TestHelper.h"

@interface PathTests : TestCase
@end

@implementation PathTests

- (void)testPathForWebFolderAndS3BucketSources {
    XCTAssertEqualObjects(@"https://nothingmagical.imgix.net/sam.jpg", [self.client URLWithPath:@"sam.jpg"].absoluteString);
}

- (void)testPathForWebFolderAndS3BucketSourcesWithSlashPrefix {
    XCTAssertEqualObjects(@"https://nothingmagical.imgix.net/sam.jpg", [self.client URLWithPath:@"/sam.jpg"].absoluteString);
}

- (void)testFullyQualifiedURLAsPathComponent {
    XCTAssertEqualObjects(@"https://nothingmagical.imgix.net/https%3A%2F%2Fexample.com%2Fsome-example-image.jpg", [self.client URLWithPath:@"https://example.com/some-example-image.jpg"].absoluteString);
}

- (void)testFullyQualifiedURLWithQueryParamsAsPathComponent {
    XCTAssertEqualObjects(@"https://nothingmagical.imgix.net/https%3A%2F%2Fexample.com%2Fsome-example-image.jpg%3Futm_source%3Dtwitter", [self.client URLWithPath:@"https://example.com/some-example-image.jpg?utm_source=twitter"].absoluteString);
}


@end