NSArray *disallowedPaths = @[
    @"/Applications/Cydia.app",
    @"/bin/bash",
    @"/Library/MobileSubstrate/MobileSubstrate.dylib",
    @"/private/var/lib/apt/",
    @"/private/JailbreakTest.txt",
    @"/usr/sbin/sshd",
    @"/etc/apt",
    @"/usr/bin/sshd",
    @"/Applications/Cydia.app",
    @"/Applications/blackra1n.app",
    @"/Applications/FakeCarrier.app",
    @"/Applications/Icy.app",
    @"/Applications/IntelliScreen.app",
    @"/Applications/MxTube.app",
    @"/Applications/RockApp.app",
    @"/Applications/SBSettings.app",
    @"/Applications/WinterBoard.app",
    @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
    @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
    @"/private/var/lib/apt",
    @"/private/var/lib/apt/",
    @"/private/var/lib/cydia",
    @"/private/var/mobile/Library/SBSettings/Themes",
    @"/private/var/stash",
    @"/private/var/tmp/cydia.log",
    @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
    @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
    @"/usr/libexec/sftp-server"
];

%hook NSFileManager
- (BOOL)fileExistsAtPath:(NSString *)path {
  if ([disallowedPaths containsObject:path]){
    return NO;
  }
  return %orig;
}
%end

%hook ANSMetadata

- (BOOL)computeIsJailbroken { 
  return false; 
}

- (BOOL)isJailbroken { 
  return false; 
}

%end
