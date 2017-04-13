//
//  ResDimension.m
//  rotwk_installer_plugin
//
//  Created by Tyler hostager on 4/10/17.
//  Copyright © 2017 Tyler Hostager. All rights reserved.
//

#pragma mark - preprocessor macros
#define MIN_X                            800
#define DEF_X                           1280
#define MAX_X                           1920
#define MIN_Y                            600
#define DEF_Y                            800
#define MAX_Y                           1080

#import "DispRes.h"

@interface DispRes()
@property (nonatomic, retain, readonly) NSString *xDimStr, *yDimStr;
@end

@implementation DispRes
@synthesize xDim = _xDim;
@synthesize yDim = _yDim;
@synthesize fmtdDimStr = _fmtdDimStr;
@synthesize fmtdDimStrNoSp = _fmtdDimStrNoSp;

#pragma mark - static functor subroutines
+ (NSNumber *)xDefNSNumVal { return [NSNumber numberWithInt:DEF_X]; }
+ (NSNumber *)yDefNSNumVal { return [NSNumber numberWithInt:DEF_Y]; }

+ (DispRes *)defaultResDim {
    DispRes *tmp = [[DispRes alloc] init];
    NSNumber *tmpXD = [tmp->xDim isEqualToNumber:[DispRes xDefNSNumVal]] ? [tmp xDim] : [DispRes xDefNSNumVal];
    NSNumber *tmpYD = [tmp->yDim isEqualToNumber:[DispRes yDefNSNumVal]] ? [tmp yDim] : [DispRes yDefNSNumVal];
    return [[DispRes alloc] initWithXDim:tmpXD yDim:tmpYD];
}

+ (DispRes *)generateRDObjWithXVal:(NSNumber *)xVal yVal:(NSNumber *)yVal {
    BOOL xIsValid = xVal && [self isValidDim:xVal isX:YES], yIsValid = yVal && [self isValidDim:yVal isX:NO];
    DispRes *tmp = nil;
    
    if (!xIsValid && !yIsValid) {
        tmp = [DispRes defaultResDim];
    } else {
        xVal = xIsValid ? xVal : [DispRes xDefNSNumVal];
        yVal = yIsValid ? yVal : [DispRes yDefNSNumVal];
        tmp = [[DispRes alloc] initWithXDim:xVal yDim:yVal];
    }
    
    return !tmp ? [[DispRes alloc] init] : [[DispRes alloc] initWithXDim:xVal yDim:yVal];
}

+ (BOOL)isValidDim:(NSNumber *)val isX:(BOOL)x {
    return [val isEqualTo:nil] ? NO : [val isGreaterThanOrEqualTo:[NSNumber numberWithInt:x ? MIN_X : MIN_Y]] && [val isLessThanOrEqualTo:[NSNumber numberWithInt:x ? MAX_X : MAX_Y]];
}

#pragma mark - constructors
- (instancetype)init {
    return [self initWithXDim:nil yDim:nil];
}

- (instancetype)initWithXDim:(NSNumber *)xVal yDim:(NSNumber *)yVal {
    self = [super init];
    if (self) {
        self->xDim = [DispRes isValidDim:xVal isX:YES] ? xVal : [DispRes xDefNSNumVal];
        self->yDim = [DispRes isValidDim:yVal isX:NO] ? yVal : [DispRes yDefNSNumVal];
    }
    
    return self;
}

#pragma mark - object functions and instance methods
- (NSString *)fmtdDimStrNoSp {
    return [NSString stringWithFormat:@"%@x%@", self->xDim, self->yDim];
}

- (void)setXDim:(NSNumber *)xDim {
    self->xDim = [DispRes isValidDim:xDim isX:YES] ? xDim : [DispRes xDefNSNumVal];
}

- (NSNumber *)xDim {
    return [DispRes isValidDim:self.xDim isX:YES] ? self.xDim : [DispRes xDefNSNumVal];
}

- (NSString *)xDimStr {
    return [NSString stringWithFormat:@"%@", [self xDim]];
}

- (NSString *)fmtdDimStr {
    return [NSString stringWithFormat:@"%@ x %@", self.xDim, self.yDim];
}

- (void)setYDim:(NSNumber *)yDim {
    self.yDim = [DispRes isValidDim:yDim isX:NO] ? yDim : [DispRes yDefNSNumVal];
}

- (NSNumber *)yDim {
    return [DispRes isValidDim:self.yDim isX:NO] ? self.yDim : [DispRes yDefNSNumVal];
}

- (NSString *)yDimStr {
    return [NSString stringWithFormat:@"%@", [self yDim]];
}

@end



/*
 + (DispRes *)generateRDObjWithXVal:(NSNumber *)xVal yVal:(NSNumber *)yVal {
 return ![self isValidDim:xVal isX:YES] && ![self isValidDim:yVal isX:NO] ? [[DispRes alloc] init] : [[DispRes alloc] initWithXDim:![self isValidDim:xVal isX:YES] ? [DispRes xDefNSNumVal] : xVal yDim:![self isValidDim:yVal isX:NO] ? [DispRes yDefNSNumVal] : yVal];
 }
 */
