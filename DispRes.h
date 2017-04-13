//
//  ResDimension.h
//  rotwk_installer_plugin
//
//  Created by Tyler hostager on 4/12/17.
//  Copyright © 2017 Tyler Hostager. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Public DispRes object interface for use in InstallerPane implementations
@interface DispRes : NSObject

// public instance attributes
@property (nonatomic, retain) NSNumber *xDim;
@property (nonatomic, retain) NSNumber *yDim;
@property (nonatomic, retain, readonly) NSString *fmtdDimStr;
@property (nonatomic, retain, readonly) NSString *fmtdDimStrNoSp;

// public constructors
- (instancetype)init;
- (instancetype)initWithXDim:(NSNumber *)xVal yDim:(NSNumber *)yVal;

// public attribute getters
- (void)setXDim:(NSNumber *)xDim;
- (void)setYDim:(NSNumber *)yDim;
- (NSNumber *)xDim;
- (NSNumber *)yDim;
- (NSString *)fmtdDimStr;
- (NSString *)fmtdDimStrNoSp;

// class methods
+ (DispRes *)defaultResDim;
+ (DispRes *)generateRDObjWithXVal:(NSNumber *)x yVal:(NSNumber *)y;
+ (NSNumber *)xDefNSNumVal;
+ (NSNumber *)yDefNSNumVal;
+ (BOOL)isValidDim:(NSNumber *)val isX:(BOOL)x;

@end
