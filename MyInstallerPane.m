//
//  MyInstallerPane.m
//  rotwk_installer_plugin
//
//  Created by Tyler hostager on 4/12/17.
//  Copyright © 2017 Tyler Hostager. All rights reserved.
//

#import "MyInstallerPane.h"

/*
static DispRes *kCBDataArr[2] = {
    [DispRes generateRDObjWithXVal:800 yVal:600]
};
 */

/*
{[[DispRes alloc] initWithXDim:[NSNumber numberWithInt:800] yDim:[NSNumber numberWithInt:600]], [[DispRes alloc] initWithXDim:[NSNumber numberWithInt:1024] yDim:[NSNumber numberWithInt:768]]};
 */

/*
static NSMutableArray<DispRes *> const * kDefaultCBData = [[NSMutableArray<DispRes *> alloc] initWithArray:kCBDataArr]
 */

@interface MyInstallerPane()
@property (weak) NSMutableArray<DispRes *> *cbData;
@end

@implementation MyInstallerPane
@synthesize resCB = _resCB;
@synthesize cResLbl = _cResLbl;
@synthesize xDim = _xDim;
@synthesize yDim = _yDim;
@synthesize byLbl = _byLbl;
@synthesize cbData = _cbData;

- (NSString *)title {
    return [[NSBundle bundleForClass:[self class]] localizedStringForKey:@"PaneTitle" value:nil table:nil];
}

- (NSMutableArray<DispRes *> *)cbData {
    return _cbData ? kDefaultCBData : self.cbData;
}

@end
