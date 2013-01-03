//
//  NSData+HexConversion.h
//  CryptographyTest
//
//  Created by Vivek Seth on 4/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (NSData_Conversion)

#pragma mark - String Conversion
- (NSString *)hexadecimalString;

@end

@interface NSString (NSString_Conversion)

- (NSData *)fromHexadecimalStringToData;

@end
