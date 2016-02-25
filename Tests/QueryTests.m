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

- (void)testPathWithoutParams {
    XCTAssertNil([self.client URLWithPath:@"sam.jpg"].query);
}

- (void)testPathWithOneParam {
    XCTAssertEqualObjects(@"bri=50", [self.client URLWithPath:@"sam.jpg" andOptions:@{ @"bri": @50 }].query);
}

- (void)testPathWithMultipleParams {
    XCTAssertEqualObjects(@"bri=50&exp=20", [self.client URLWithPath:@"sam.jpg" andOptions:(@{ @"bri": @50, @"exp": @20 })].query);
}

- (void)testSigningPathWithoutParams {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"imgix-library-secure-test-source.imgix.net" token:@"EHFQXiZhxP4wA2c4"];
    XCTAssertEqualObjects(@"s=2b0bc99b1042e3c1c9aae6598acc3def", [client URLWithPath:@"dog.jpg"].query);
}

- (void)testSigningPathWithOneParam {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"imgix-library-secure-test-source.imgix.net" token:@"EHFQXiZhxP4wA2c4"];
    XCTAssertEqualObjects(@"bri=50&s=3b293930d9c288fb788657fd9ed8164f", [client URLWithPath:@"dog.jpg" andOptions:@{ @"bri": @50 }].query);
}

- (void)testSigningPathWithMultipleParams {
    IGXClient *client = [[IGXClient alloc] initWithHost:@"imgix-library-secure-test-source.imgix.net" token:@"EHFQXiZhxP4wA2c4"];
    XCTAssertEqualObjects(@"bri=50&con=20&s=30c03db96a644d5ce6e85022be191248", [client URLWithPath:@"dog.jpg" andOptions:(@{ @"bri": @50, @"con": @20 })].query);
}

- (void)testQueryStringKeyEscaping {
    NSString *query = [self.client URLWithPath:@"sam.jpg" andOptions:@{ @"hello world": @"interesting" }].query;
    XCTAssertEqualObjects(@"hello%20world=interesting", query);
}

- (void)testQueryStringValueEscaping {
    NSString *query = [self.client URLWithPath:@"sam.jpg" andOptions:@{ @"txt": @"/foo'> <script>alert('hacked')</script><" }].query;
    XCTAssertEqualObjects(@"txt=/foo'%3E%20%3Cscript%3Ealert('hacked')%3C/script%3E%3C", query);
}

- (void)testBase64ParamVariantsAreBase64Encoded {
    NSString *query = [self.client URLWithPath:@"~text" andOptions:@{ @"txt64": @"I cannøt belîév∑ it wors! 😱"}].query;
    
    XCTAssertEqualObjects(@"txt64=SSBjYW5uw7h0IGJlbMOuw6l24oiRIGl0IHdvcu-jv3MhIPCfmLE", query);
}

@end
