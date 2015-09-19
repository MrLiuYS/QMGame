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
    
    /**
     *  船是过来.还是过去. 默认:no过去
     */
    BOOL isCome;
    
    __weak IBOutlet UILabel *scoreLabel;
    
}

@property (nonatomic, assign) int scoreNum;

@end

@implementation RiverViewController

+ (RiverViewController *)initRiver {
    
    RiverViewController * ctrl = [[RiverViewController alloc]initWithNibName:@"RiverViewController" bundle:nil];
    
    return ctrl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    mRen.pType = PieceType_REN;
    self.scoreNum = 0;
    isCome = NO;
    
    pieces = [NSMutableArray arrayWithObjects:mRen,mLang,mYang,mCai, nil];
    
    pieceings = [NSMutableArray array];
    
    pieceds = [NSMutableArray array];
    
    
}

- (void)setScoreNum:(int)scoreNum {
    _scoreNum = scoreNum;
    scoreLabel.text = [NSString stringWithFormat:@"%d",scoreNum];
    
}

/**
 *  检验棋子列表是否符合
 */
- (BOOL)checkPieces:(NSMutableArray *)aPieces {

    if ([aPieces indexOfObject:mRen] != NSNotFound) {
        return YES;
    }
    if ([aPieces indexOfObject:mLang] != NSNotFound && [aPieces indexOfObject:mYang] != NSNotFound) {
        
        [SVProgressHUD showErrorWithStatus:@"狼 和 羊 不能放在一起"];
        
        return NO;
    }
    if ([aPieces indexOfObject:mYang] != NSNotFound && [aPieces indexOfObject:mCai] != NSNotFound) {
        [SVProgressHUD showErrorWithStatus:@"羊 和 菜 不能放在一起"];
        return NO;
    }
    
    return YES;
    
}

/**
 *  返回 piece 所在的数组
 */
- (NSMutableArray *)arrayPiece:(RiverPiece *)aPiece {
    
    if ([pieces indexOfObject:aPiece] != NSNotFound) {
        return pieces;
    }
    else if ([pieceings indexOfObject:aPiece] != NSNotFound) {
        return pieceings;
    }
    else {
        return pieceds;
    }
    
}
/**
 *  移动 piece
 */
- (BOOL )movePiece:(RiverPiece *)aPiece
          befores:(NSMutableArray *)aBefores
           afters:(NSMutableArray *)aAfters {
    
    if ([aBefores indexOfObject:aPiece] != NSNotFound) {
        [aBefores removeObject:aPiece];
        [aAfters addObject:aPiece];
        return YES;
    }
    return NO;
    
}



- (IBAction)touchNode:(RiverPiece *)sender {
    
    
    if (isCome) {
        
        if ([[self arrayPiece:sender] isEqualToArray:pieceds]) {
            
            [self movePiece:sender
                    befores:pieceds
                     afters:pieceings];
            
            [UIView animateWithDuration:.3
                             animations:^{
                                
                                 CGRect rect = sender.frame;
                                 rect.origin.x = self.view.frame.size.width / 2;
                                 
                                 sender.frame = rect;
                                 
                             }];
            
            
        }
        else if ([[self arrayPiece:sender] isEqualToArray:pieceings]) {
            [self movePiece:sender
                    befores:pieceings
                     afters:pieceds];
            
            [UIView animateWithDuration:.3
                             animations:^{
                                 
                                 CGRect rect = sender.frame;
                                 rect.origin.x = self.view.frame.size.width - 60;
                                 
                                 sender.frame = rect;
                                 
                             }];
        }
        
        
        if (pieceings.count == 2) {
            for (RiverPiece * piece in pieceds) {
                piece.enabled = NO;
            }
        }else {
            for (RiverPiece * piece in pieceds) {
                piece.enabled = YES;
            }
        }
        
        
    }else {
        
        if ([[self arrayPiece:sender] isEqualToArray:pieces]) {
            
            [self movePiece:sender
                    befores:pieces
                     afters:pieceings];
            
            [UIView animateWithDuration:.3
                             animations:^{
                                 
                                 CGRect rect = sender.frame;
                                 rect.origin.x = self.view.frame.size.width / 2;
                                 
                                 sender.frame = rect;
                                 
                             }];
        }
        else if ([[self arrayPiece:sender] isEqualToArray:pieceings]) {
            [self movePiece:sender
                    befores:pieceings
                     afters:pieces];
            
            
            [UIView animateWithDuration:.3
                             animations:^{
                                 
                                 CGRect rect = sender.frame;
                                 rect.origin.x = 10;
                                 
                                 sender.frame = rect;
                                 
                             }];
        }
        
        if (pieceings.count == 2) {
            for (RiverPiece * piece in pieces) {
                piece.enabled = NO;
            }
        }else {
            for (RiverPiece * piece in pieces) {
                piece.enabled = YES;
            }
        }
        
    }
    
    NSLog(@"pieces :%@ \n pieceings:%@\n pieceds:%@",pieces,pieceings,pieceds);
}



- (IBAction)touchStart:(UIButton *)sender {
    
    if (pieceings.count == 0) {
        [SVProgressHUD  showErrorWithStatus:@"船上没有人物"];
        return;
    }
    
    if ([self checkPieces:pieces] && [self checkPieces:pieceings] && [self checkPieces:pieceds]) {
        
        isCome = !isCome;
    }
    
    NSMutableArray * array = [NSMutableArray arrayWithArray:pieceings];
    for (RiverPiece * piece in array) {
        [self touchNode:piece];
    }
    
    if (pieceds.count == 4) {
        
        [SVProgressHUD showSuccessWithStatus:@"成功"];
        
    }else {
        
        self.scoreNum++;
        
    }
    
    
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
