//
//  RCTDocumentInteractionController.h
//  RCTDocumentInteractionController
//
//  Created by WeiGuangcheng on 5/8/17.
//  Copyright © 2017 Liaoyuan. All rights reserved.
//

#if __has_include("RCTBridgeModule.h")
    #import "RCTBridgeModule.h"
#else
    #import <React/RCTBridgeModule.h>
#endif

#import <Foundation/Foundation.h>
#import <UIKit/UIDocumentInteractionController.h>
#import <UIKit/UIWindow.h>

@interface RCTDocumentInteraction : NSObject <RCTBridgeModule, UIDocumentInteractionControllerDelegate>

@end
