//
//  calculatorViewController.m
//  iOSCalcultor
//
//  Created by 李育腾 on 2022/9/26.
//

#import "calculatorViewController.h"

@interface calculatorViewController ()

@end

@implementation calculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _viewCal = [[viewCalculator alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_viewCal];
    [_viewCal initView];
    _viewCal.delegate = self;
    _modelCal = [[modelCalculator alloc] init];
    _calString = [[NSString alloc]init];
}
- (void)returnButton:(UIButton *)button {
    NSLog(@"Button.currentTitle = %@", button.titleLabel.text);
    NSString* strbutton = button.titleLabel.text;
    if (button.tag == 12) {//AC键
        _calString = [[NSString alloc] init];
    } else if (button.tag == 18) {
        if (_calString.length != 0 && [self kuohaoPd:_calString]) {
            const char* Cstr = [_calString UTF8String];
            double num =  [_modelCal transformStr:Cstr];
            _calString = [NSString stringWithFormat:@"%f", num];
            _calString = [self removeFloatAllZeroByString:_calString];
        } else {
            _calString = @"ERROR";
        }
//        const char* Cstr = [_calString UTF8String];
//        double num =  [_modelCal transformStr:Cstr];
//        _calString = [NSString stringWithFormat:@"%f", num];
//        NSLog(@"%s", Cstr);
    } else {
        _calString = [_calString stringByAppendingString:strbutton];
    }
    _viewCal.textFiled.text = _calString;
}
- (BOOL)kuohaoPd:(NSString*)string {
    int flag = 1;
    int left = 0;
    int right = 0;
    int dian = 0;
    int fu = 0;
    // 输入错误
    if (string.length == 2) {
        char tempStr1 = [string characterAtIndex:1];
        if (tempStr1 == '+' || tempStr1 == '-'|| tempStr1 == '*'|| tempStr1 == '/' || tempStr1 == '(' || tempStr1 == ')' ) {
            flag = 0;
        }
    }
    if (string.length == 1) {
        char tempStr0 = [string characterAtIndex:0];
        if (tempStr0 == '+' || tempStr0 == '-'|| tempStr0 == '*'|| tempStr0 == '/' || tempStr0 == '(' || tempStr0 == ')') {
           flag =  0;
       }
    }
//    if ([string characterAtIndex:0] == '/') {
//        flag = 0;
//    }
    // 括号
    for (int i = 0; i < string.length; i++) {
        char tempStr = [string characterAtIndex:i];
        if (tempStr == '(') {
            left++;
        } else if (tempStr == ')') {
            right++;
        }
    }
    //
        char temoStrLast = [string characterAtIndex:string.length - 1];
        if ( (temoStrLast < '0' && temoStrLast != ')') ||(temoStrLast && temoStrLast != '(' && temoStrLast > '9')) {
            flag = 0;
        }
    // 小数点
    for (int i = 0; i < string.length; i++) {
        char tempStr0 = [string characterAtIndex:i];
        if (tempStr0 == '+' || tempStr0 == '-'|| tempStr0 == '*'|| tempStr0 == '/') {
            fu++;
        } else if (tempStr0 == '.') {
            dian++;
        }
    }
    // 小输点
    for (int i = 0; i < string.length; i++) {
        char tempStr0 = [string characterAtIndex:i];
        if (i < string.length  - 1) {
            char temp = [string characterAtIndex:i + 1];
            if (tempStr0 == '.' && temp == '.') {
                flag = 0;
            }
        }
    }
    //括号里有符号 括号匹配
    if (string.length == 3) {
        for (int i = 0; i < string.length; i++) {
            char tempR = [string characterAtIndex:i];
            if (i < string.length - 2) {
                char tempRN = [string characterAtIndex:i + 1];
                char tempRNN = [string characterAtIndex:i + 2];
                if (tempR == '(' && tempRNN == ')') {
                    if (tempRN == '+' || tempRN == '-'|| tempRN == '*'|| tempRN == '/' ) {
                        flag = 0;
                    }
                }
            }
        }
    }
    if (right != left) {
        flag = 0;
    }
    if (dian - fu > 1) {
        flag = 0;
    }
    if ([string characterAtIndex:0] == '.') {
        flag = 0;
    }
    for (int i = 0; i < string.length; i++) {
        char tempChar = [string characterAtIndex:i];
        if (tempChar == '0' || tempChar == '1' ||tempChar == '2' ||tempChar == '3' ||tempChar == '4' ||tempChar == '5' ||tempChar == '6' ||tempChar == '7' ||tempChar == '8' ||tempChar == '9' ||tempChar == '.') {
            if (i < string.length - 1) {
                char tempCharNext = [string characterAtIndex:i + 1];
                if (tempCharNext == '(') {
                    flag  = 0;
                }
            }
        }
    }
    // 不能除0并且注意08这种数字
    if (string.length > 1) {
        for (int i = 0; i < string.length; i++) {
            char temoChar = [string characterAtIndex:i];
            if (temoChar == '/') {
                if (i < string.length - 2) {
                    char tempChar = [string characterAtIndex:i + 1];
                    char tempCharNext = [string characterAtIndex:i + 2];
                    if (tempChar == '0'){
                        if ((tempCharNext == '1' ||tempCharNext == '2' ||tempCharNext == '3' ||tempCharNext == '4' ||tempCharNext == '5' ||tempCharNext == '6' ||tempCharNext == '7' ||tempCharNext == '8' ||tempCharNext == '9')) {
                            flag = 1;
                        } else {
                            flag = 0;
                        }
                    }
                } else if (i == string.length - 2) {
                    char tempChar = [string characterAtIndex:i + 1];
                    if (tempChar == '0') {
                        flag = 0;
                    }
                }
            }
        }
    }
    if (flag == 0) {
        return false;
    } else {
        return true;
    }
}
- (NSString*)removeFloatAllZeroByString:(NSString *)testNumber {
    NSString * outNumber = [NSString stringWithFormat:@"%@",@(testNumber.floatValue)];
    return outNumber;
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
