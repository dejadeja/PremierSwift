//
// Generated by CocoaPods-Keys
// on 06/12/2017
// For more information see https://github.com/orta/cocoapods-keys
//

#import <objc/runtime.h>
#import <Foundation/NSDictionary.h>
#import "PremierSwiftKeys.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation PremierSwiftKeys

  @dynamic movieAPIKey;

#pragma clang diagnostic pop

+ (BOOL)resolveInstanceMethod:(SEL)name
{
  NSString *key = NSStringFromSelector(name);
  NSString * (*implementation)(PremierSwiftKeys *, SEL) = NULL;

  if ([key isEqualToString:@"movieAPIKey"]) {
    implementation = _podKeys671eeee13bbae3ee5f80931b34d7b3eb;
  }

  if (!implementation) {
    return [super resolveInstanceMethod:name];
  }

  return class_addMethod([self class], name, (IMP)implementation, "@@:");
}

static NSString *_podKeys671eeee13bbae3ee5f80931b34d7b3eb(PremierSwiftKeys *self, SEL _cmd)
{
  
    
      char cString[33] = { PremierSwiftKeysData[216], PremierSwiftKeysData[1034], PremierSwiftKeysData[595], PremierSwiftKeysData[218], PremierSwiftKeysData[906], PremierSwiftKeysData[423], PremierSwiftKeysData[22], PremierSwiftKeysData[1037], PremierSwiftKeysData[102], PremierSwiftKeysData[909], PremierSwiftKeysData[1036], PremierSwiftKeysData[772], PremierSwiftKeysData[898], PremierSwiftKeysData[737], PremierSwiftKeysData[845], PremierSwiftKeysData[213], PremierSwiftKeysData[581], PremierSwiftKeysData[295], PremierSwiftKeysData[561], PremierSwiftKeysData[492], PremierSwiftKeysData[1098], PremierSwiftKeysData[896], PremierSwiftKeysData[537], PremierSwiftKeysData[567], PremierSwiftKeysData[929], PremierSwiftKeysData[441], PremierSwiftKeysData[820], PremierSwiftKeysData[663], PremierSwiftKeysData[1101], PremierSwiftKeysData[979], PremierSwiftKeysData[386], PremierSwiftKeysData[964], '\0' };
    
    return [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
  
}


static char PremierSwiftKeysData[1114] = "9EFATUfVKpc6V7U/KuR0Po1voHfufftGW+JAk5LKmTJcHjDrJ3dfezubgKrdQZ41NCCj5dOJvP7yuPbP201fZonngzlQ0N1vOaRS946w3ffVTlvz+He0wIrKnK5pKJgLzRtEVV11LWD0ytCawDyBUVcuq8BESESxO7cC8HZB6Kx2sk894ZjnjlohcaoJy0SwNUBSO6VVzcuBascJit/0i3eAe49Pu5pIiiGZFzvWpa0qjPMPZ4GV4pmJT3Kn9OggnGz+uiaZuex/oXw52GqF8h2lG9aO+rMYaG1CEImdndN7oWt8XjoCgecKVt8JYyb3veF2iSuRfPfjYzJ29r0TrNDr8n6QTlZ2ZBE+H/+VUFVlXuwS8RPliFhXMmedAfebpY9NomTZajgG0GvRGrp8j9rqNMV59hzIi286ikI66cRTV28cSxyq/Tio27DWR6XdAy6iOL+Lb+LQU/0sBJwm1Gh3gLGKy/kQ1XFb7fiYwq5w3RRQc5DYXPcJOZnO+XAEg4gRupr5wb01UeHPcbxWoRLUBdLuIpXQGlSqfolNo6n6IYY2v369xe+dj1STYoZTXKtAN9yKqw+NULlq828fZguwyFbe0O37qsfA6sQSdh7SBBKsHS1/C1GOoO0jTmtxwIxfhH8VpNFhiSB3xa79YKW3yN9OsyCcMl/9YNQ5YPB9zTTCQ2t1hiqzgp1zucA3ZbrHXO3iw8OCy/xZHWjpvwF29xb6CLyk+6DeSWFGPlQx5oDvv9sWaQanfpLRPwSDHJrbdde3ekGzGjflj3/v1Y76l7hdKfWolqlx+JwtaeHApvDZy5Q+eKfp0xrun8aSxJrz5m1kEo/9l63Qq/G3OBRBOJWO7mw8zgdHKHInT0rkfUQpnAHBLDuFxpC8+vCn306MZZyoTYeT4f1RucstmGdc/7vQ1mHLtelTU5xiKOvF+5sVt4q/QxkZxPbCdQnBip+eb8f6i+wil7Uadtl5Dn90OhtUP3zGiwZnDDs6WiG/6DNU+FqcVBk+thzgrzEF3oGuF0Boeh4tffe4+l06BOC3EXYl9vGz8X3T6QnWlPhKxf+mblaEb5IbG0kGpSbw4u+3b6wODOdlx1zyI910vA==\\\"";

- (NSString *)description
{
  return [@{
            @"movieAPIKey": self.movieAPIKey,
  } description];
}

- (id)debugQuickLookObject
{
  return [self description];
}

@end