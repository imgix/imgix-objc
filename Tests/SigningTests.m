//
//  SigningTests.m
//  Imgix
//
//  Created by Paul Straw on 1/28/16.
//

#import "TestHelper.h"
#import <Foundation/Foundation.h>

@interface SigningTests : TestCase
@end

@implementation SigningTests

- (void)testSignedURLWithoutQuery {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"imgix-library-secure-test-source.imgix.net" token:@"EHFQXiZhxP4wA2c4"];
    XCTAssertEqualObjects(@"s=2b0bc99b1042e3c1c9aae6598acc3def", [client URLWithPath:@"dog.jpg"].query);
}

- (void)testSignedURLWithSingleQueryParam {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"imgix-library-secure-test-source.imgix.net" token:@"EHFQXiZhxP4wA2c4"];
    
    client.brightness = 50;
    XCTAssertEqualObjects(@"bri=50&s=3b293930d9c288fb788657fd9ed8164f", [client URLWithPath:@"dog.jpg"].query);
}

- (void)testSignedURLWithMultipleQueryParams {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"imgix-library-secure-test-source.imgix.net" token:@"EHFQXiZhxP4wA2c4"];
    
    client.brightness = 50;
    client.contrast = 20;
    XCTAssertEqualObjects(@"bri=50&con=20&s=30c03db96a644d5ce6e85022be191248", [client URLWithPath:@"dog.jpg"].query);
}

@end
