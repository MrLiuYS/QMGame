//
//  RiverViewController.m
//  QMGame
//
//  Created by 刘永生 on 15/9/19.
//  Copyright (c) 2015年 刘永生. All rights reserved.
//

#import "RiverViewController.h"
#import "RiverPiece.h"

@interface RiverViewController () {
    
    /**
     *  未过河的所有棋子
     */
    NSMutableArray * pieces;
    /**
     *  正在过河的棋子
     */
    NSMutableArray * pieceings;
    /**
     *  已经过河的棋子
     */
    NSMutableArray * pieceds;
    
    
    __weak IBOutlet RiverPiece *mRen;
    
    __weak IBOutlet RiverPiece *mLang;
    
    __weak IBOutlet RiverPiece *mYang;
    
    __weak IBOutlet RiverPiece *mCai;
}

@end

@implementation RiverViewController

+ (RiverViewController *)initRiver {
    
    RiverViewController * ctrl = [[RiverViewController alloc]initWithNibName:@"RiverViewController" bundle:nil];
    
    return ctrl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    pieces = [NSMutableArray arrayWithObjects:mRen,mLang,mYang,mCai, nil];
    
    pieceings = [NSMutableArray array];
    
    pieceds = [NSMutableArray array];
    
    
}

/**
 *  检验棋子列表是否符合
 */
- (BOOL)checkPieces:(NSMutableArray *)aPieces {
    
    BOOL isMeet = NO;

    if ([aPieces indexOfObject:mRen] != NSNotFound) {
        
        return YES;
    }
    if (([aPieces indexOfObject:mLang] != NSNotFound && [aPieces indexOfObject:mYang] != NSNotFound) ||
        ([aPieces indexOfObject:mYang] != NSNotFound && [aPieces indexOfObject:mCai] != NSNotFound) ) {
        return YES;
    }
    return isMeet;
}



- (IBAction)touchStart:(UIButton *)sender {
    
    [self checkPieces:pieces];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
