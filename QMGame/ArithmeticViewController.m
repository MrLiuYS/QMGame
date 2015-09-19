//
//  ArithmeticViewController.m
//  QMGame
//
//  Created by 刘永生 on 15/9/17.
//  Copyright (c) 2015年 刘永生. All rights reserved.
//

#import "ArithmeticViewController.h"

@interface ArithmeticViewController ()

@end

@implementation ArithmeticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
}

- (void)start {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        for (int t0 = 0; t0 < 10; t0++) {
            
            for (int t1 = 0; t1 < 10; t1++) {
                
                for (int t2 = 0; t2 < 10; t2++) {
                    
                    for (int t3 = 0; t3 < 10; t3++) {
                        
                        for (int t4 = 0; t4 < 10; t4++) {
                            
                            for (int t5 = 0; t5 < 10; t5++) {
                                
                                for (int t6 = 0; t6 < 10; t6++) {
                                    
                                    for (int t7 = 0; t7 < 10; t7++) {
                                        
                                        for (int t8 = 0; t8 < 10; t8++) {
                                            
//                                        dispatch_async(dispatch_get_main_queue(), ^{
//
//                                            tf0.text = [NSString stringWithFormat:@"%d",t0];
//                                            tf1.text = [NSString stringWithFormat:@"%d",t1];
//                                            tf2.text = [NSString stringWithFormat:@"%d",t2];
//                                            tf3.text = [NSString stringWithFormat:@"%d",t3];
//                                            tf4.text = [NSString stringWithFormat:@"%d",t4];
//                                            tf5.text = [NSString stringWithFormat:@"%d",t5];
//                                            tf6.text = [NSString stringWithFormat:@"%d",t6];
//                                            tf7.text = [NSString stringWithFormat:@"%d",t7];
//                                            tf8.text = [NSString stringWithFormat:@"%d",t8];
// });
                                            
                                            
                                            if ([self arithmeticT0:t0 T1:t1 T2:t2 T3:t3 T4:t4 T5:t5 T6:t6 T7:t7 T8:t8]) {
                                                
                                                
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    
                                                    tf0.text = [NSString stringWithFormat:@"%d",t0];
                                                    tf1.text = [NSString stringWithFormat:@"%d",t1];
                                                    tf2.text = [NSString stringWithFormat:@"%d",t2];
                                                    tf3.text = [NSString stringWithFormat:@"%d",t3];
                                                    tf4.text = [NSString stringWithFormat:@"%d",t4];
                                                    tf5.text = [NSString stringWithFormat:@"%d",t5];
                                                    tf6.text = [NSString stringWithFormat:@"%d",t6];
                                                    tf7.text = [NSString stringWithFormat:@"%d",t7];
                                                    tf8.text = [NSString stringWithFormat:@"%d",t8];
                                                });

                                                    NSLog(@"\n-------------------------\n %d + %d - %d\n %d - %d * %d \n %d + %d - %d ",t0,t1,t2,t3,t4,t5,t6,t7,t8);
                                                
//                                                break;
                                                
                                            }else {
                                                //                                            sleep(0.3);
                                            }
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//           
//            
//            
//        });
    });
    
    

}

- (BOOL)arithmeticT0:(int)t0 T1:(int)t1 T2:(int)t2 T3:(int)t3 T4:(int)t4 T5:(int)t5 T6:(int)t6 T7:(int)t7  T8:(int)t8{
    
//    int t0 = [tf0.text intValue];
//    int t1 = [tf1.text intValue];
//    int t2 = [tf2.text intValue];
//    int t3 = [tf3.text intValue];
//    int t4 = [tf4.text intValue];
//    int t5 = [tf5.text intValue];
//    int t6 = [tf6.text intValue];
//    int t7 = [tf7.text intValue];
//    int t8 = [tf8.text intValue];

//    NSLog(@"%d - %d - %d - %d - %d - %d - %d - %d - %d ",t0,t1,t2,t3,t4,t5,t6,t7,t8);
    
    
    if (t6 == 0) {
        return NO;
    }
    
    if ((t0 + t1 - t2 == 4) &&
        (t3 - t4 * t5 == 4) &&
        (t6 + t7 - t8 == 4) &&
        (t0 + t3 / t6 == 4) &&
        (t1 - t4 * t7 == 4) &&
        (t2 - t5 - t8 == 4) &&
        (t3 % t6 == 0)) {
        
        return YES;
    }else {
        return NO;
    }
}


- (IBAction)touchSubmit:(id)sender {
    
    [self.view endEditing:YES];
    
     [self start];
    
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    
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
