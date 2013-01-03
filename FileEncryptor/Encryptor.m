//
//  Encryptor.m
//  test
//
//  Created by Vivek Seth on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Encryptor.h"

#import "NSData+CommonCrypto.h"
#import "NSData+HexConversion.h"

@implementation Encryptor

+ (NSString *) encryptFileWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key {
    NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:extension];
    NSString* hexStringFile = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData* toBeEncrypted = [[NSData alloc] initWithData:[hexStringFile dataUsingEncoding:NSUTF8StringEncoding]];
    NSData* encData = [toBeEncrypted AES256EncryptedDataUsingKey:key error:nil];
    NSString * HexString = [encData hexadecimalString];
    return HexString;
}

+ (NSString *) decryptString:(NSString *)encryptedString WithKey:(NSString *)key {
    NSData * fromHex = [encryptedString fromHexadecimalStringToData];
    //NSLog(@"HexData: %@", fromHex);
    NSData * dectryptedData = [fromHex decryptedAES256DataUsingKey:key error:nil];
    //NSLog(@"dectryptedData (in Hex): %@", dectryptedData);
    NSString* decryptedString = [[NSString alloc] initWithData:dectryptedData encoding:NSUTF8StringEncoding];
    //NSLog(@"decryptedString: %@", decryptedString);
    return decryptedString;
}

@end