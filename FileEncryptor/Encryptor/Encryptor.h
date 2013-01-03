//
//  Encryptor.h
//  test
//
//  Created by Vivek Seth on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface Encryptor : NSObject

//enc and dec resources bundled with app using data 

+ (NSData *) encryptFileDataWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key;

+ (NSData *) decryptFileDataWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key;

//enc and dec resources bundled with app using strings 

+ (NSString *) encryptFileStringWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key;

+ (NSString *) decryptFileStringWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key;

//enc and dec files (given path) using data

+ (NSData *) encryptFileDataWithPath:(NSString *)path Key:(NSString *)key;

+ (NSData *) decryptFileDataWithPath:(NSString *)path Key:(NSString *)key;

//enc and dec files (given path) using strings

+ (NSString *) encryptFileStringWithPath:(NSString *)path Key:(NSString *)key;

+ (NSString *) decryptFileStringWithPath:(NSString *)path Key:(NSString *)key;

//enc and dec string

+ (NSString *) encryptString:(NSString *)string WithKey:(NSString *)key;

+ (NSString *) decryptString:(NSString *)encryptedString WithKey:(NSString *)key;

//enc and dec data

+ (NSData *) encryptData:(NSData *)data WithKey:(NSString *)key;

+ (NSData *) decryptData:(NSData *)encryptedData WithKey:(NSString *)key;

@end