//
//  Server.h
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

#ifndef foodRecipe_Server_h
#define foodRecipe_Server_h

#define MAKCIPE_SERVER_HOST               @"dev.makcipe.com"
#define MAKCIPE_SERVER_HOST_DEV           @"localhost"
#define MAKCIPE_SERVER_HOST_PORT          9090
#define MAKCIPE_SERVER_HOST_PORT_DEV      9090

#define MAKCIPE_IMAGE_SERVLET_URL         [NSString stringWithFormat:@"%@%@/api/image", MAKCIPE_SERVER_HOST, MAKCIPE_SERVER_HOST_PORT]
#define MAKCIPE_IMAGE_SERVLET_URL_DEV     [NSString stringWithFormat:@"%@%@/api/image", MAKCIPE_SERVER_HOST_DEV, MAKCIPE_SERVER_HOST_PORT_DEV]

#define MAKCIPE_IMAGE_CDN_URL(path)       [NSString stringWithFormat:@"http://cdn2.mrnmrs.gilhanasai.com/%@", path]

#endif
