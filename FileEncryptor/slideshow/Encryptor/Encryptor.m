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

//enc and dec resources bundled with app using data 

+ (NSData *) encryptFileDataWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key {
    NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:extension];
    return [self encryptFileDataWithPath:path Key:key];
}

+ (NSData *) decryptFileDataWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key {
    NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:extension];    
    return [self decryptFileDataWithPath:path Key:key];
}

//enc and dec resources bundled with app using strings 

+ (NSString *) encryptFileStringWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key {
    NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:extension];
    return [self encryptFileStringWithPath:path Key:key];
}

+ (NSString *) decryptFileStringWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key {
    NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:extension];
    return [self decryptFileStringWithPath:path Key:key];
}

//enc and dec files (given path) using their data

+ (NSData *) encryptFileDataWithPath:(NSString *)path Key:(NSString *)key {
    NSData* toBeEncrypted = [[NSData alloc] initWithContentsOfFile:path];
    return [self encryptData:toBeEncrypted WithKey:key];
}

+ (NSData *) decryptFileDataWithPath:(NSString *)path Key:(NSString *)key {
    NSData* toBeDecrypted = [[NSData alloc] initWithContentsOfFile:path];
    return [self decryptData:toBeDecrypted WithKey:key];
}

//enc and dec files (given path) using strings

+ (NSString *) encryptFileStringWithPath:(NSString *)path Key:(NSString *)key {
    NSString* hexStringFile = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return [self encryptString:hexStringFile WithKey:key];
}

+ (NSString *) decryptFileStringWithPath:(NSString *)path Key:(NSString *)key {
    NSString* hexStringFile = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return [self decryptString:hexStringFile WithKey:key];
}

//enc and dec string

+ (NSString *) encryptString:(NSString *)string WithKey:(NSString *)key {
    NSString* hexStringFile = string;
    NSData* toBeEncrypted = [[NSData alloc] initWithData:[hexStringFile dataUsingEncoding:NSUTF8StringEncoding]];
    NSData* encData = [toBeEncrypted AES256EncryptedDataUsingKey:key error:nil];
    NSString * HexString = [encData hexadecimalString];
    return HexString;
}

+ (NSString *) decryptString:(NSString *)encryptedString WithKey:(NSString *)key {
    NSData * fromHex = [encryptedString fromHexadecimalStringToData];
    NSData * dectryptedData = [fromHex decryptedAES256DataUsingKey:key error:nil];
    NSString* decryptedString = [[NSString alloc] initWithData:dectryptedData encoding:NSUTF8StringEncoding];
    return decryptedString;
}


//enc and dec data

+ (NSData *) encryptData:(NSData *)data WithKey:(NSString *)key {
    NSData * encData = [data AES256EncryptedDataUsingKey:key error:nil];
    return encData;
}

+ (NSData *) decryptData:(NSData *)encryptedData WithKey:(NSString *)key {
    NSData * dectryptedData = [encryptedData decryptedAES256DataUsingKey:key error:nil];
    return dectryptedData;
}

@end