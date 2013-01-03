//
//  AppDelegate.h
//  FileEncryptor
//
//  Created by Vivek Seth on 5/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, assign) NSString * encryptedString;
@property (nonatomic, assign) NSString * decryptedString;

@property (nonatomic, assign) NSString * filePath;

@property (assign) IBOutlet NSWindow *window;
- (IBAction)ChooseFile:(id)sender;
- (IBAction)EncryptFile:(id)sender;
@property (assign) IBOutlet NSTextField *EncryptionKey;
@property (assign) IBOutlet NSTextField *StatusLabel;
- (IBAction)RadioButtons:(id)sender;
@property (assign) IBOutlet NSMatrix *RadioBttns;
@property (assign) IBOutlet NSMatrix *StringOrData;


@end
