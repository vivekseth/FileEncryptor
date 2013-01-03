//
//  Encryptor.h
//  test
//
//  Created by Vivek Seth on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface Encryptor : NSObject

+ (NSString *) encryptFileWithName:(NSString *)name Extension:(NSString *)extension Key:(NSString *)key;

+ (NSString *) decryptString:(NSString *)encryptedString WithKey:(NSString *)key;

@end