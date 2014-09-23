//
//  JPGridView.h
//  sudoku
//
//  Created by Josh Petrack on 9/12/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFJPGridView : UIView

- (void) setValueatRow:(int)row column:(int)column to:(int)value;
- (void) setTarget:(id)target action:(SEL)action;

@end
