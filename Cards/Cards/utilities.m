//
//  utilities.m
//  Cards
//
//  Created by Kefas on 13.05.2015.
//  Copyright (c) 2015 QLNet. All rights reserved.
//

#import "utilities.h"

NSString *validateString(NSString* stringToValidate){
    if (stringToValidate) {
        return stringToValidate;
    }else{
        return @"";
    }
}

