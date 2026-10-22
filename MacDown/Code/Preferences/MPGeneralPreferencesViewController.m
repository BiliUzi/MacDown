//
//  MPGeneralPreferencesViewController.m
//  MacDown
//
//  Created by Tzu-ping Chung  on 01/7.
//  Copyright (c) 2014 Tzu-ping Chung . All rights reserved.
//

#import "MPGeneralPreferencesViewController.h"
#import "MPPreferences.h"


@implementation MPGeneralPreferencesViewController

#pragma mark - MASPreferencesViewController

- (NSString *)viewIdentifier
{
    return @"GeneralPreferences";
}

- (NSImage *)toolbarItemImage
{
    return [NSImage imageNamed:@"PreferencesGeneral"];
}

- (NSString *)toolbarItemLabel
{
    return NSLocalizedString(@"General", @"Preference pane title.");
}


@end
