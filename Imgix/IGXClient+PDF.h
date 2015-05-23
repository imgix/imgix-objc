//
//  IGXClient+PDF.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient.h"

/**
 Work with Portable Document Format files. Vector assets in pdf files will scale before rasterizing.
 This is ideal for scaling up icons and graphic marks.

 Extremely large PDF files may timeout during the intial fetch depending on the speed of the origin.
 If you are experiencing issues with large PDFs, please contact support .
 */
@interface IGXClient (PDF)

/**
 The page number – starting from `1` – of the PDF to be rendered to an image. If omitted, the first
 page will be used.
 */
@property (nonatomic) NSUInteger PDFPage;

@end
