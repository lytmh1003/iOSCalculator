//
//  calculatorViewController.h
//  iOSCalcultor
//
//  Created by 李育腾 on 2022/9/26.
//

#import <UIKit/UIKit.h>
#import "modelCalculator.h"
#import "viewCalculator.h"
NS_ASSUME_NONNULL_BEGIN

@interface calculatorViewController : UIViewController<ButtonDelegate>
@property(nonatomic, strong) modelCalculator* modelCal;
@property (nonatomic, strong)viewCalculator* viewCal;
@property (nonatomic, copy) NSMutableArray* buttonArray;
@property (nonatomic, copy) NSString* calString;
@property (nonatomic, strong) UITextField* textFiled;
- (BOOL)kuohaoPd:(NSString*)string;
- (void)returnButton:(UIButton *)button;
@end

NS_ASSUME_NONNULL_END
