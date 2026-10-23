//
//  MPDocumentSplitView.m
//  MacDown
//
//  Created by Tzu-ping Chung on 13/12.
//  Copyright (c) 2014 Tzu-ping Chung . All rights reserved.
//

#import "MPDocumentSplitView.h"


@implementation NSColor (Equality)

- (BOOL)isEqualToColor:(NSColor *)color
{
    NSColor *rgb1 = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
    NSColor *rgb2 = [color colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
    return rgb1 && rgb2 && [rgb1 isEqual:rgb2];
}

@end


@interface MPDocumentSplitView ()
@property (weak) NSView *collapsedPane;
@end

@implementation MPDocumentSplitView

@synthesize dividerColor = _dividerColor;

- (NSColor *)dividerColor
{
    if (_dividerColor)
        return _dividerColor;
    return [super dividerColor];
}

- (void)setDividerColor:(NSColor *)color
{
    if ([color isEqualToColor:_dividerColor])
        return;
    _dividerColor = color;
    [self setNeedsDisplay:YES];
}

- (CGFloat)dividerLocation
{
    NSArray *parts = self.subviews;
    NSAssert1(parts.count == 2, @"%@ should only be used on two-item splits.",
              NSStringFromSelector(_cmd));

    CGFloat totalWidth = self.frame.size.width - self.dividerThickness;
    CGFloat leftWidth = [parts[0] frame].size.width;
    if ([parts[0] isHidden] || leftWidth <= 0.0) return 0.0;
    if ([parts[1] isHidden] || [parts[1] frame].size.width <= 0.0) return 1.0;
    return totalWidth > 0.0 ? leftWidth / totalWidth : 0.5;
}

- (void)setDividerLocation:(CGFloat)ratio
{
    NSArray *parts = self.subviews;
    NSAssert1(parts.count == 2, @"%@ should only be used on two-item splits.",
              NSStringFromSelector(_cmd));
    ratio = isfinite(ratio) ? MIN(1.0, MAX(0.0, ratio)) : 0.5;
    NSView *left = parts[0];
    NSView *right = parts[1];
    self.collapsedPane = ratio == 0.0 ? left : (ratio == 1.0 ? right : nil);
    if (self.collapsedPane)
    {
        [self adjustSubviews];
        [self setNeedsDisplay:YES];
        return;
    }
    left.hidden = NO;
    right.hidden = NO;

    CGFloat width = NSWidth(self.bounds);
    CGFloat height = NSHeight(self.bounds);
    CGFloat divider = self.dividerThickness;
    CGFloat available = MAX(0.0, width - divider);
    CGFloat leftWidth = available * ratio;
    // Restore real frames before asking AppKit to position a collapsed divider.
    left.frame = NSMakeRect(0.0, 0.0, leftWidth, height);
    right.frame = NSMakeRect(leftWidth + divider, 0.0, available - leftWidth, height);
    [self adjustSubviews];
    [self setPosition:leftWidth ofDividerAtIndex:0];
    [self setNeedsDisplay:YES];

}

- (void)adjustSubviews
{
    if (!self.collapsedPane)
    {
        [super adjustSubviews];
        return;
    }
    // AppKit may adjust the panes again after opening or resizing the window.
    for (NSView *pane in self.subviews)
    {
        pane.hidden = pane == self.collapsedPane;
        pane.frame = NSMakeRect(0.0, 0.0, pane.hidden ? 0.0 : NSWidth(self.bounds),
                                NSHeight(self.bounds));
    }
}

- (void)resizeSubviewsWithOldSize:(NSSize)oldSize
{
    if (self.collapsedPane)
        [self adjustSubviews];
    else
        [super resizeSubviewsWithOldSize:oldSize];
}

- (void)swapViews
{
    NSArray *parts = self.subviews;
    NSView *left = parts[0];
    NSView *right = parts[1];
    self.subviews = @[right, left];
}


@end
