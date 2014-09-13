//
//  JPGridView.m
//  sudoku
//
//  Created by Josh Petrack on 9/12/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import "JPGridView.h"

@interface JPGridView (){
    NSMutableArray*  _buttons;
}

@end

@implementation JPGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        for (int i = 0; i < 9; ++i) {
            
        }
        
        
        CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame));
        // Create button.
        CGFloat separationDistance = 1.0;
        CGFloat buttonSize = ((size - 14 * separationDistance) / 9.0);
        
        CGFloat currentY = 2 * separationDistance;
        
        _buttons = [[NSMutableArray alloc] initWithCapacity:9];
        
        
        for (int i = 0; i < 9; ++i) {
            CGFloat currentX = 2 * separationDistance;
            
            NSMutableArray* currentRow;
            currentRow = [[NSMutableArray alloc] initWithCapacity:9];
            for (int j = 0; j < 9; ++j) {
                CGRect buttonFrame = CGRectMake(currentX,currentY,buttonSize,buttonSize);
                
                UIButton* _button = [[UIButton alloc] initWithFrame:buttonFrame];
                _button.backgroundColor = [UIColor orangeColor];
                [self addSubview:_button];
                [_button setTag:9*i + j];
                [_button setShowsTouchWhenHighlighted:YES];
                [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
                
                [currentRow insertObject:_button atIndex:j];
                if (j % 3 == 2) {
                    currentX += separationDistance;
                }
                currentX += buttonSize + separationDistance;
            }
            
            // Insert the new sub-array of buttons into the main array.
            [_buttons insertObject:currentRow atIndex:i];
            if (i % 3 == 2) {
                currentY += separationDistance;
            }
            currentY += buttonSize + separationDistance;
        }
    }
    return self;
}

- (void)buttonPressed:(id)sender
{
    UIButton* tempButton = (UIButton*) sender;
    NSLog(@"Button %i was pressed.", tempButton.tag);
}

- (void)setCellatRow:(int)row andColumn:(int)column toValue:(int)value {
    UIButton* button = [[_buttons objectAtIndex:row] objectAtIndex: column];
    [button setTitle:[NSString stringWithFormat:@"%i", value] forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
