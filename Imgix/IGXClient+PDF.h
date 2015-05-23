//
//  IGXClient+PDF.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient.h"

@interface IGXClient (PDF)

/**
 The page number – starting from `1` – of the PDF to be rendered to an image. If omitted, the first
 page will be used.
 */
@property (nonatomic) NSUInteger PDFPage;

@end
