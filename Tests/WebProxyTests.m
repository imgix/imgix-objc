//
//  WebProxyTests.m
//  Imgix
//
//  Created by Paul Straw on 2/24/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

#import "TestHelper.h"

@interface WebProxyTests : TestCase
@end

@implementation WebProxyTests

- (void)testFullURL {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"imgix-library-web-proxy-test-source.imgix.net" token:@"qN5VOqaLGQUFzETO"];
    NSString *generatedURL = [[client URLWithPath:@"http://files.paulstraw.com/pixelpaul.png"] absoluteString];
    XCTAssertEqualObjects(@"https://imgix-library-web-proxy-test-source.imgix.net/http%3A%2F%2Ffiles.paulstraw.com%2Fpixelpaul.png?s=1c57b8db669c9b265b4dd42f3b2de37a", generatedURL);
}

- (void)testEscapesFullURL {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"imgix-library-web-proxy-test-source.imgix.net" token:@"qN5VOqaLGQUFzETO"];
    NSString *generatedURL = [[client URLWithPath:@"http://files.paulstraw.com/pixel>paul.png"] absoluteString];
    XCTAssertEqualObjects(@"https://imgix-library-web-proxy-test-source.imgix.net/http%3A%2F%2Ffiles.paulstraw.com%2Fpixel%3Epaul.png?s=a9bbef784d922914d0a915dc9e218f6f", generatedURL);
}

@end