//
//  MyInstallerPane.h
//  rotwk_installer_plugin
//
//  Created by Tyler hostager on 4/10/17.
//  Copyright © 2017 Tyler Hostager. All rights reserved.
//

#import <InstallerPlugins/InstallerPlugins.h>
#import "DispRes.h"

extern NSMutableArray<DispRes *> *kResArr;
NSMutableArray<DispRes *> *_kResArr;

@implementation NSMutableArray (InitializeConstants)

+ (void)load {
    kResArr = @[[DispRes generateRDObjWithXVal:@800 yVal:@600]];
}

__attribute__((constructor))
static void InitGlobalResArr() {
    _kResArr = [[NSMutableArray alloc] init];
    [[_kResArr addObject:@[[DispRes generateRDObjWithXVal:[NSNumber numberWithInt:800] yVal:[NSNumber numberWithInt:600]]]] retain];
}

static NSMutableArray<DispRes *> *getKResArr() {
    return [_kResArr isEqualTo:nil] ? [[NSMutableArray<DispRes *> alloc] init] : _kResArr;
}

@end

@interface ResConstants : NSObject
+ (void)load;
+ (NSArray<DispRes *> *)resArr;
@property (nonatomic, retain, readonly) DispRes *rc0800x0600;
@property (nonatomic, retain, readonly) DispRes *rc1024x0768;
@property (nonatomic, retain, readonly) DispRes *rc1280x0800;
@property (nonatomic, retain, readonly) DispRes *rc1280x1024;
@property (nonatomic, retain, readonly) DispRes *rc1440x0900;
@property (nonatomic, retain, readonly) DispRes *rc1680x1050;
@property (nonatomic, retain, readonly) DispRes *rc1920x1080;
@end

@interface ResConstants()
@property (nonatomic, retain) NSArray<DispRes *> *arr;
@end

@implementation ResConstants
@synthesize rc0800x0600 = _rc0800x0600;
@synthesize rc1024x0768 = _rc1024x0768;
@synthesize rc1280x0800 = _rc1280x0800;
@synthesize rc1280x1024 = _rc1280x1024;
@synthesize rc1440x0900 = _rc1440x0900;
@synthesize rc1680x1050 = _rc1680x1050;
@synthesize rc1920x1080 = _rc1920x1080;

+ (void)load {
#ifdef DEBUG
    NSString *dbgMsg = [@"DEBUG" stringByAppendingString:[NSString stringWithFormat:@"/> %@", [self resArr]]];
    
    // write mutable array of default supported screen resolutions
    // to the debug log upon load.
    dLog([NSString stringWithFormat:@"%@", [@"/> " stringByAppendingString:dbgMsg]]);
#else
    // assign temporary array placeholder to the static immutable constant value
    self->arr = [self resArr];
#endif
}

static void dLog(NSString *dMsg) {
    [dMsg isEqualTo:nil] || [dMsg isEqualToString:@""] ? NSLog(@"NULL") : NSLog(@"%@", dMsg);
}

+ (NSArray<DispRes *> *)resArr {
    return [[self resArr] isEqualTo:nil] ? [[NSArray<DispRes *> alloc] init] : [self resArr];
}

@end

#pragma mark - public user-interface pane plugin linked with xib file elements
@interface MyInstallerPane : InstallerPane

// public interface outlets
@property (weak) IBOutlet NSComboBox *resCB;
@property (weak) IBOutlet NSTextField *cResLbl;
@property (weak) IBOutlet NSTextField *xDim;
@property (weak) IBOutlet NSTextField *yDim;
@property (weak) IBOutlet NSTextField *byLbl;

// public properties
+ (DispRes *)currentUsrDim;

@end
