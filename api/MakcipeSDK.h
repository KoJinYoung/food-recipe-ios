//
//  MakcipeSDK.h
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

#import "MakcipeAPISession.h"

#import "MakcipeAPIRecipeService.h"
#import "MakcipeAPIUserService.h"

// For other application-level error codes
typedef enum {
    MakcipeAPIErrorCode_TRANSPORT_ERROR = -3000,
    MakcipeAPIErrorCode_NO_VIEWCONTROLLER = -3001,
    MakcipeAPIErrorCode_INTERNAL_SERVER_ERROR = -3002,
    MakcipeAPIErrorCode_INVALID_VERSION = -3003,
    MakcipeAPIErrorCode_BAD_GATEWAY = -3004,
    MakcipeAPIErrorCode_UNKNOWN = -3005
} WapleSDKErrorCode;

extern NSString *const MakcipeAPIErrorDomain;