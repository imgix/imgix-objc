//
//  WebProxyTests.m
//  Imgix
//
//  Created by Paul Straw on 2/24/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

#import "TestHelper.h"

@import Imgix;

@interface SettingsTests : TestCase
@end

@implementation SettingsTests

- (void)testDefaultsToHTTPSURLs {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"hello-world.imgix.net" token: nil];
    NSString *generatedURL = [[client URLWithPath:@"dog.jpg"] absoluteString];
    XCTAssertEqualObjects(@"https://hello-world.imgix.net/dog.jpg", generatedURL);
}

- (void)testAllowsHTTPURLs {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"hello-world.imgix.net" token: nil];
    client.secure = NO;
    NSString *generatedURL = [[client URLWithPath:@"dog.jpg"] absoluteString];
    XCTAssertEqualObjects(@"http://hello-world.imgix.net/dog.jpg", generatedURL);
}

@end