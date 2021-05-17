#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {

    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    NSMutableArray *numberArray = [[NSMutableArray alloc] init];
    NSMutableArray *stringArray = [[NSMutableArray alloc] init];
    
    for (NSArray *item in array) {
        if ([item isKindOfClass: [NSArray class]]) {
            for (int i = 0; i < item.count; i++) {
                if ([item[i] isKindOfClass: [NSNumber class]]) {
                    [numberArray addObject: item[i]];
                } else if ([item[i] isKindOfClass: [NSString class]]) {
                    [stringArray addObject: item[i]];
                }
            }
        } else {
            return @[];
        }
    }

    [numberArray sortUsingSelector:@selector(compare:)];
    [stringArray sortUsingSelector:@selector(compare:)];

    if ((numberArray.count != 0) && (stringArray.count != 0)) {
        [resultArray addObjectsFromArray: @[numberArray]];
    } else {
        [resultArray addObjectsFromArray: numberArray];
        [resultArray addObjectsFromArray: stringArray];
    }

    return resultArray;
}

@end
