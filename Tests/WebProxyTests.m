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
    XCTAssertEqualObjects(@"https://imgix-library-web-proxy-test-source.imgix.net/http%3A//files.paulstraw.com/pixelpaul.png?s=1167e2907a32d22ba5023081124296da", generatedURL);
}

- (void)testEscapesFullURL {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"imgix-library-web-proxy-test-source.imgix.net" token:@"qN5VOqaLGQUFzETO"];
    NSString *generatedURL = [[client URLWithPath:@"http://files.paulstraw.com/pixel>paul.png"] absoluteString];
    XCTAssertEqualObjects(@"https://imgix-library-web-proxy-test-source.imgix.net/http%3A//files.paulstraw.com/pixel%3Epaul.png?s=8fbe8629040eca798d220b5c11e0faa6", generatedURL);
}

@end