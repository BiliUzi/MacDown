#import <Cocoa/Cocoa.h>
#import "MPDocumentSplitView.h"
#include <assert.h>

int main(void)
{
    @autoreleasepool {
        [NSApplication sharedApplication];
        MPDocumentSplitView *split = [[MPDocumentSplitView alloc]
            initWithFrame:NSMakeRect(0, 0, 1000, 600)];
        split.vertical = YES;
        NSView *editor = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 500, 600)];
        NSView *preview = [[NSView alloc] initWithFrame:NSMakeRect(501, 0, 499, 600)];
        [split addSubview:editor];
        [split addSubview:preview];

        for (NSNumber *ratio in @[@0.0, @1.0]) {
            split.dividerLocation = ratio.doubleValue;
            NSView *hidden = ratio.doubleValue == 0 ? editor : preview;
            NSView *visible = hidden == editor ? preview : editor;
            [split setFrameSize:NSMakeSize(1400, 800)];
            [split adjustSubviews];
            [split layoutSubtreeIfNeeded];
            assert(hidden.hidden && NSWidth(hidden.frame) == 0);
            assert(!visible.hidden && NSWidth(visible.frame) == 1400);
            split.dividerLocation = 0.5;
            assert(!editor.hidden && !preview.hidden);
            assert(fabs(NSWidth(editor.frame) - NSWidth(preview.frame)) <= 1);
            [split setFrameSize:NSMakeSize(1000, 600)];
        }

        [split swapViews];
        split.dividerLocation = 1.0;
        [split adjustSubviews];
        assert(editor.hidden && !preview.hidden);
        split.dividerLocation = 0.5;
        assert(!editor.hidden && !preview.hidden);
    }
    return 0;
}
