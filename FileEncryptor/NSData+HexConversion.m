//
//  NSData+HexConversion.m
//  CryptographyTest
//
//  Created by Vivek Seth on 4/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSData+HexConversion.h"

@implementation NSData (NSData_Conversion)

#pragma mark - String Conversion
- (NSString *)hexadecimalString {
    /* Returns hexadecimal string of NSData. Empty string if data is empty.   */
    
    const unsigned char *dataBuffer = (const unsigned char *)[self bytes];
    
    if (!dataBuffer)
        return [NSString string];
    
    NSUInteger          dataLength  = [self length];
    NSMutableString     *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i)
        [hexString appendString:[NSString stringWithFormat:@"%02x", (unsigned long)dataBuffer[i]]];
    
    return [NSString stringWithString:hexString];
}

@end

@implementation NSString (NSString_Conversion)

- (NSData *)fromHexadecimalStringToData {
    NSString * tempHexadecimalString = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableData *mutableData= [[NSMutableData alloc] init];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < (tempHexadecimalString.length)/2; i++) {
        byte_chars[0] = [tempHexadecimalString characterAtIndex:i*2];
        byte_chars[1] = [tempHexadecimalString characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [mutableData appendBytes:&whole_byte length:1]; 
    }
    NSData * Data = [[NSData alloc] initWithData:mutableData];
    return Data;
}

@end
