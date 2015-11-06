//
//  ZJScreenAdaptaionMacro.h
//  FreeLimit1502
//
//  Created by mac on 15/5/21.
//  Copyright (c) 2015年 zhang jian. All rights reserved.
//

#ifndef FreeLimit1502_ZJScreenAdaptaionMacro_h
#define FreeLimit1502_ZJScreenAdaptaionMacro_h

#define AdaptaionFlag
#ifdef AdaptaionFlag
    #define CGRectMake CGRectMakeEx
    #define CGSizeMake CGSizeMakeEx
    #define widthEx widthEx
    #define heightEx heightEx
#else
    #define CGRectMake CGRectMake
    #define CGSizeMake CGSizeMake
    #define widthEx
    #define heightEx
#endif

#endif
