//
//  modelCalculator.h
//  iOSCalcultor
//
//  Created by 李育腾 on 2022/9/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface modelCalculator : NSObject
@property (nonatomic, copy) NSMutableArray* numberStack;
@property (nonatomic, copy) NSMutableArray* symbolStack;
@property (nonatomic, copy) NSMutableArray* string;
//- (double)cal(char *s);
- (double)transformStr:(char*)arr;
@end

NS_ASSUME_NONNULL_END
