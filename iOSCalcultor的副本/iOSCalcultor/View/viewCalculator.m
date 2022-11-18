//
//  viewCalculator.m
//  iOSCalcultor
//
//  Created by 李育腾 on 2022/9/26.
//
#define MaxSize 90
#define numberMaxSize 400
#import "viewCalculator.h"
#import "Masonry.h"
@implementation viewCalculator
- (void)initView {
   UIColor* orange = [UIColor colorWithRed:248.0f/255.0f green:134.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
   UIColor* gray =  [UIColor colorWithRed:170.0f/255.0f green:170.0f/255.0f blue:170.0f/255.0f alpha:1.0f];
    UIColor* black = [UIColor colorWithRed:85.0f/255.0f green:85.0f/255.0f blue:85.0f/255.0f alpha:1.0f];
    self.backgroundColor = [UIColor blackColor];
    _buttonArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"+", @"4", @"5", @"6", @"-", @"7", @"8", @"9", @"*", @"AC", @"(", @")", @"/", @"0", @".", @"=", nil];
    /**
        显示numberlabel 测试
     */
    _textFiled = [[UITextField alloc] init];
    [self addSubview:_textFiled];
    [_textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@numberMaxSize);
        make.height.equalTo(@70);
//        make.left.equalTo(self).offset(self.frame.size.width - 65);
        make.left.equalTo(@25);
        make.top.equalTo(@250);
    }];
    _textFiled.font = [UIFont systemFontOfSize:60];
    _textFiled.textColor = [UIColor whiteColor];
    _textFiled.text = @"0";
    _textFiled.textAlignment = NSTextAlignmentRight;
//    _numberLabel = [[UILabel alloc] init];
//    _numberLabel.textColor = [UIColor whiteColor];
//    _numberLabel.font = [UIFont systemFontOfSize:50];
//    [self addSubview:_numberLabel];
//    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@numberMaxSize);
//        make.height.equalTo(@70);
//        make.left.equalTo(self).offset(self.frame.size.width - 65);
//        make.top.equalTo(@250);
//    }];
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {

            NSString* buttonString = _buttonArray[j + i*4];
            _buttonCalculator = [UIButton buttonWithType:UIButtonTypeCustom];
            [_buttonCalculator addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [_buttonCalculator setTitle:buttonString forState:UIControlStateNormal];
            [_buttonCalculator setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
            _buttonCalculator.titleLabel.font = [UIFont systemFontOfSize:43];
            
// 设置圆形button 需要注意 要是Button必须得是正方形 (长等于宽)，并且cornerRadius是长的一半（正方形的内切圆）
            // borderWidth 边框厚度
            _buttonCalculator.layer.borderWidth = 2.0;
            // cornerRadius 按钮的四周圆角
            // 半径
            _buttonCalculator.layer.cornerRadius = MaxSize / 2;
            // 裁边
            _buttonCalculator.layer.masksToBounds = YES;
            
            _buttonCalculator.tag = j + i * 4;
            [self addSubview:_buttonCalculator];
            [_buttonCalculator mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self).offset(-(90 + (MaxSize + 15) * (i + 1)));
                make.left.equalTo(self).offset(15 + (MaxSize + 15) * j);
                make.width.equalTo(@MaxSize);
                make.height.equalTo(@MaxSize);
            }];
            if (j < 3) {
                if (i < 3) {
                    _buttonCalculator.backgroundColor = black;
                } else {
                    _buttonCalculator.backgroundColor = gray;
                    [_buttonCalculator setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
            } else {
                _buttonCalculator.backgroundColor = orange;
                _buttonCalculator.titleLabel.font = [UIFont systemFontOfSize:55];
            }
        }
    }
    // 底部按钮
    for (int i = 4; i < 5; i++) {
        for (int j = 0; j < 3; j ++) {
            NSString* buttonString = _buttonArray[j + i*4];
            _buttonCalculator = [UIButton buttonWithType:UIButtonTypeCustom];
            [_buttonCalculator setTitle:buttonString forState:UIControlStateNormal];
            _buttonCalculator.titleLabel.font = [UIFont systemFontOfSize:43];
            [_buttonCalculator addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [_buttonCalculator setTitle:buttonString forState:UIControlStateNormal];
            [_buttonCalculator setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
            [self addSubview:_buttonCalculator];
            if (j > 0) {
                // 设置圆形button 需要注意 要是
                    // borderWidth 边框厚度
                _buttonCalculator.layer.borderWidth = 2.0;
                    // cornerRadius 按钮的四周圆角
                    // 半径
                _buttonCalculator.layer.cornerRadius = MaxSize / 2;
                    // 裁边
                _buttonCalculator.layer.masksToBounds = YES;
                _buttonCalculator.tag = j + i * 4;
                printf("%ld ", _buttonCalculator.tag);
                [_buttonCalculator mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self).offset( -MaxSize );
                    make.left.equalTo(self).offset(30 + (MaxSize + 15) * j + MaxSize);
                    make.width.equalTo(@MaxSize);
                    make.height.equalTo(@MaxSize);
                }];
                if (j == 1) {
                    _buttonCalculator.backgroundColor = black;
                } else {
                    _buttonCalculator.backgroundColor = orange;
                }
            } else if (j == 0) {
                NSString* buttonString = _buttonArray[j + i*4];
                _buttonCalculator = [UIButton buttonWithType:UIButtonTypeCustom];
                [_buttonCalculator setTitle:buttonString forState:UIControlStateNormal];
                _buttonCalculator.titleLabel.font = [UIFont systemFontOfSize:43];
                [_buttonCalculator addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
                [_buttonCalculator setTitle:buttonString forState:UIControlStateNormal];
                [_buttonCalculator setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
                [self addSubview:_buttonCalculator];
                _buttonCalculator.backgroundColor = black;
                // 设置圆形button 需要注意 要是
                    // borderWidth 边框厚度
                _buttonCalculator.layer.borderWidth = 2.0;
                    // cornerRadius 按钮的四周圆角
                    // 半径
                _buttonCalculator.layer.cornerRadius = MaxSize / 2;
                    // 裁边
                _buttonCalculator.layer.masksToBounds = YES;
                _buttonCalculator.tag = j + i * 4;
                printf("%ld", _buttonCalculator.tag);
                [_buttonCalculator mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self).offset( -MaxSize );
                    make.left.equalTo(self).offset(15 + (MaxSize + 15) * j);
                    make.width.equalTo(@(2 * MaxSize + 15));
                    make.height.equalTo(@MaxSize);
                }];
            }
        }
    }
}
- (void) pressButton:(UIButton*)button {
    [_delegate returnButton:button];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing codei
    
}
*/

@end
