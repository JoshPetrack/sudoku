//
//  JPViewController.m
//  sudoku
//
//  Created by Josh Petrack on 9/11/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import "JPViewController.h"
#import "JPGridView.h"
#import "RWAMGridModel.h"

@interface JPViewController () {
    
    JPGridView* _gridView;
    RWAMGridModel* _gridModel;
}

@end

@implementation JPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create grid frame.
    CGRect frame = self.view.frame;
    CGFloat x = CGRectGetWidth(frame)*.1;
    CGFloat y = CGRectGetHeight(frame)*.1;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*.80;
    
    CGRect gridFrame = CGRectMake(x,y,size,size);
    
    // Create grid view.
    _gridView = [[JPGridView alloc] initWithFrame:gridFrame];
    _gridView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_gridView];
    
    _gridModel = [[RWAMGridModel alloc] init];
    
    [_gridModel startNewGame];
    [self setInitialGrid];
    
}

- (void)setInitialGrid {
    for(int row = 0; row < 9; ++row) {
        for (int col = 0; col < 9; ++col) {
            int currentValue = [_gridModel getValueAtRow:row andColumn:col];
            [_gridView setCellatRow:row andColumn:col toValue:currentValue];
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
