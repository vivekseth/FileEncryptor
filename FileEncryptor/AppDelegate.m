//
//  AppDelegate.m
//  FileEncryptor
//
//  Created by Vivek Seth on 5/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Encryptor.h"

@implementation AppDelegate
@synthesize RadioBttns = _RadioBttns;
@synthesize StringOrData = _StringOrData;
@synthesize EncryptionKey = _EncryptionKey;
@synthesize StatusLabel = _StatusLabel;

@synthesize window = _window;
@synthesize encryptedString = _encryptedString;
@synthesize decryptedString = _decryptedString;
@synthesize filePath = _filePath;

- (void)dealloc
{
//    NSLog(@"dealloc");
//    [self.RadioBttns release];
//    [self.EncryptionKey release];
//    [self.StatusLabel release];
//    [self.window release];
//    [self.encryptedString release];
//    [self.decryptedString release];
//    [self.filePath release];
    [super dealloc];
}
	
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

}

- (IBAction)ChooseFile:(id)sender {
    NSOpenPanel* openPanel = [NSOpenPanel openPanel];
    //[openPanel autorelease];
	[openPanel setCanChooseFiles:YES];
	//[openPanel setCanChooseDirectories:YES];
	
    NSString* filepath = NULL;
    
	if ( [openPanel runModalForDirectory:nil file:nil] == NSOKButton )
	{
		NSArray* selectedFiles = [openPanel filenames];
		for(int i = 0; i < [selectedFiles count]; i++ )
		{
			filepath = [selectedFiles objectAtIndex:i];
		}
	}
    if (filepath != NULL) {
        NSLog(@"there is a file path");
        NSLog(@"file selected: %@", filepath);
        self.filePath = filepath;
        self.StatusLabel.stringValue = filepath;
    }
}

- (IBAction)EncryptFile:(id)sender {
    NSString * key = self.EncryptionKey.stringValue;
    NSData * resultingData = NULL;
    NSString * resulingString = NULL;
    
    
    if (self.StringOrData.selectedColumn == 0) {
        if (self.RadioBttns.selectedColumn == 0) {
            resulingString = [Encryptor encryptFileStringWithPath:self.filePath Key:key];
        }
        else if (self.RadioBttns.selectedColumn == 1) {
            resulingString = [Encryptor decryptFileStringWithPath:self.filePath Key:key];
        }
    }
    else if (self.StringOrData.selectedColumn == 1) {
        if (self.RadioBttns.selectedColumn == 0) {
            resultingData = [Encryptor encryptFileDataWithPath:self.filePath Key:key];
        }
        else if (self.RadioBttns.selectedColumn == 1) {
            resultingData = [Encryptor decryptFileDataWithPath:self.filePath Key:key];
        }
    }
    
    
    if (resultingData == NULL && resulingString == NULL) {
        self.StatusLabel.stringValue = @"ERROR choose try again or choose another file.";
        self.filePath = NULL;
        
    }
    else {
        self.StatusLabel.stringValue = @"Complete";
        
        NSSavePanel *savePanel = [NSSavePanel savePanel];
        NSInteger result = [savePanel runModal];
        
        NSString * folder = @"";
        NSString * file = @"";
        
        
        if (result == NSOKButton) {
            NSLog(@"OK button");
            
            folder = [savePanel directory];
            file = [savePanel filename];
            
            NSLog(@"Folder: %@", folder);
            NSLog(@"File: %@", file);	
        } 
        else if( result == NSCancelButton) {
            NSLog(@"Cancel button");
        } 
        else {
            NSLog(@"result = %ld", result);
        }
        
        
        if (self.StringOrData.selectedColumn == 0) {
            [resulingString writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:nil];
            self.StatusLabel.stringValue = @"Complete & Saved Successfully";
        }
        else if (self.StringOrData.selectedColumn == 1) {
            [resultingData writeToFile:file atomically:YES];
            self.StatusLabel.stringValue = @"Complete & Saved Successfully";
        }
    }
}


- (IBAction)RadioButtons:(id)sender {
    NSLog(@"changed!");
    NSLog(@"row: %ld", self.RadioBttns.selectedRow);
    //NSLog(@"col: %ld", self.RadioBttns.selectedColumn);

}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}


@end
