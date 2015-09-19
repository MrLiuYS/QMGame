//
//  RiverPiece.h
//  QMGame
//
//  Created by 刘永生 on 15/9/19.
//  Copyright (c) 2015年 刘永生. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    PieceType_REN = 0,
    PieceType_LANG,
    PieceType_YANG,
    PieceType_CAI
}
PieceType;

@interface RiverPiece : UIButton


@property (nonatomic, assign) PieceType pType;


@end
