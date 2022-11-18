//
//  viewCalculator.h
//  iOSCalcultor
//
//  Created by 李育腾 on 2022/9/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ButtonDelegate <NSObject>

- (void)returnButton:(UIButton*)button;

@end
@interface viewCalculator : UIView
- (void)initView;
@property (nonatomic, copy) NSMutableArray* buttonArray;
@property (nonatomic, strong) UIButton* buttonCalculator;
@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, copy) NSString* calString;
@property (nonatomic, assign) id <ButtonDelegate> delegate;
@property (nonatomic, retain) UITextField* textFiled;
@end

NS_ASSUME_NONNULL_END
