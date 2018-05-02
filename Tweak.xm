#import <substrate.h>
#import <sys/sysctl.h>
#import "capstone.h"




// extern "C" CFPropertyListRef MGCopyAnswer(CFStringRef);
// extern "C" CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options);


// BOOL hook = YES;

// MSHook(CFTypeRef, IORegistryEntryCreateCFProperty, io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
// {
// 	CFTypeRef ret = _IORegistryEntryCreateCFProperty(entry, key, allocator, options);

// 	// NSLog(@"Hooked IORegistryEntryCreateCFProperty funcition: %@ => %@", key, ret);
// 	NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/deviceInfo.plist"];
// 	NSString *serialNumber = [dic objectForKey:@"SerialNumber"];
// 	if (CFEqual(key, CFSTR("IOPlatformSerialNumber")) && hook && serialNumber != nil)
// 	{
// 		// TODO: Read Global plist from /var/mobile/Media/iCloudRegister/deviceInfo.plist
// 		// If empty, please use the original!!!


// 		CFTypeRef newRet = (__bridge CFTypeRef)(serialNumber);
// 		NSLog(@"IORegistryEntryCreateCFProperty Set serialNumber: %@", newRet);
// 		return newRet;
// 	} 

//     return ret;
// }

// static CFTypeRef (*original_IORegistryEntryCreateCFProperty)(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options);

// static CFTypeRef replaced_IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
// {
//     CFTypeRef ret = original_IORegistryEntryCreateCFProperty(entry, key, allocator, options);
// 	// NSLog(@"Hooked IORegistryEntryCreateCFProperty funcition: %@ => %@", key, ret);

// 	// Load from plist
// 	//NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/deviceInfo.plist"];
// 	//NSString *serialNumber = [dic objectForKey:@"SerialNumber"];
// 	//if (CFEqual(key, CFSTR("IOPlatformSerialNumber")) && hook && serialNumber != nil && (serialNumber.length))
// 	if (CFEqual(key, CFSTR("IOPlatformSerialNumber")) && hook)
// 	{
// 		CFTypeRef newRet = (__bridge CFTypeRef)(@"F68NP7XAFG2Q");
// 		NSLog(@"IORegistryEntryCreateCFProperty Set serialNumber: %@", newRet);
// 		return newRet;
// 	} 

//     return ret;
// }
// extern "C" CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry,  CFStringRef key, CFAllocatorRef allocator, IOOptionBits options);

// static CFTypeRef (*orig_registryEntry)(io_registry_entry_t entry,  CFStringRef key, CFAllocatorRef allocator, IOOptionBits options);

// CFTypeRef replaced_registryEntry(io_registry_entry_t entry,  CFStringRef key, CFAllocatorRef allocator, IOOptionBits options) {
    
//     CFTypeRef ret = orig_registryEntry(entry, key, allocator, options);
    // NSString *stringValue = CFBridgingRelease(ret); 
//	NSLog(@"Hooked IORegistryEntryCreateCFProperty funcition: %@ => %@", key, ret);
	// // Load from plist
	// FILE * file;
 //    size_t filesize;
 //    unsigned char * buffer;
    
 //    // Open the file
 //    file = fopen("/var/mobile/Library/Preferences/deviceInfo.txt", "r");
 //    // Seek to the end to find the length
 //    fseek(file, 0, SEEK_END);
 //    filesize = ftell(file);
 //    // Allocate sufficient memory to hold the file
 //    buffer = calloc(filesize, sizeof(char));
 //    // Seek back to beggining of the file and read into the buffer
 //    fseek(file, 0, SEEK_SET);
 //    fread(buffer, sizeof(char), filesize, file);
 //    // Close the file
 //    fclose(file);
 //    // Initialize your CFString
 //    CFStringRef string = CFStringCreateWithBytes(kCFAllocatorDefault, buffer, filesize, kCFStringEncodingUTF8, YES);
 //    // Release the buffer memory
 //    free(buffer);
    // NSError *error = nil;
 //   NSString *serialNumber = [[NSString alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/deviceInfo.txt" encoding:NSUTF8StringEncoding error:nil];
    // [SerialNumberManager sharedInstance];
    // NSString *string = serialNumber;
    // if (string == nil)
    // {
    // 	string = @"M5ADW3ABDQWW";
    // }

	// if (CFEqual(key, CFSTR("IOPlatformSerialNumber")) && hook && serialNumber != nil)
	// {
	// 	CFTypeRef newRet = (__bridge CFTypeRef)(serialNumber);
	// 	NSLog(@"IORegistryEntryCreateCFProperty Set serialNumber: %@", newRet);
	// 	return newRet;
	// }
	// else if (CFEqual(key, CFSTR("mac-address-wifi0")) && hook)
	// {
	// 	// id newRet = CFBridgingRelease(ret);
	// 	// NSString *stringValue = NSStringFromClass([newRet class]);
	// 	NSData* xmlData = [@"05:29:71:15:3a:b9" dataUsingEncoding:NSUTF8StringEncoding];
	// 	CFTypeRef my_cfdata = (__bridge_retained CFTypeRef)xmlData;
	// 	NSLog(@"IORegistryEntryCreateCFProperty Set mac-address-wifi0: %@", my_cfdata);
	// 	return my_cfdata;
	// } 
	// else if (CFEqual(key, CFSTR("mac-address-bluetooth0")) && hook)
	// {
	// 	// id newRet = CFBridgingRelease(ret);
	// 	// NSString *stringValue = NSStringFromClass([newRet class]);
	// 	NSData* xmlData = [@"05:29:71:15:3a:ba" dataUsingEncoding:NSUTF8StringEncoding];
	// 	CFTypeRef my_cfdata = (__bridge_retained CFTypeRef)xmlData;
	// 	NSLog(@"IORegistryEntryCreateCFProperty Set mac-address-bluetooth0: %@", my_cfdata);
	// 	return my_cfdata;
	// } 

//     return ret;
// }

// The attribute forces this function to be called on load.
// __attribute__((constructor)) static void initialize() {
	
// 	NSLog(@"We are going to hook IORegistryEntryCreateCFProperty");

// 	MSHookFunction((void *)IORegistryEntryCreateCFProperty, (void *)replaced_registryEntry, (void **)&orig_registryEntry);

// }

// __attribute__((constructor)) static void init(int argc, const char **argv)
// {
// 	//MSHookFunction((void *) IORegistryEntryCreateCFProperty,(void *)  replaced_IORegistryEntryCreateCFProperty, (void **) &original_IORegistryEntryCreateCFProperty);

// 	MSHookFunction((void *)IORegistryEntryCreateCFProperty, (void *)replaced_registryEntry, (void **)&orig_registryEntry);

// 	NSLog(@"We are going to hook IORegistryEntryCreateCFProperty");

// 	// MSHookFunction(((BOOL *)MSFindSymbol(NULL, "_MGGetBoolAnswer")), (BOOL *)replaced_MGGetBoolAnswer, (BOOL **)&old_MGGetBoolAnswer);

// 	// NSLog(@"We are going to hook MGGetBoolAnswer");
// }

// MSHook(CFPropertyListRef, MGCopyAnswer, CFStringRef key)
// {
// 	CFTypeRef ret = _MGCopyAnswer(key);

// 	// NSLog(@"Hooked MGCopyAnswer %@ => %@(%@)", key, ret, [(__bridge id)ret class]);

// 	// if (CFEqual(key, CFSTR("SerialNumber")) && hook)
// 	// {
// 	// 	NSLog(@"MGCopyAnswer get: serialNumber");
// 	// 	return CFSTR("9A562F80E775");
// 	// }

// 	// if (CFEqual(key, CFSTR("GSDeviceName")) && hook)
// 	// 	return CFSTR("Lin-iPhone");

//     return ret;
// }

#ifndef kCFCoreFoundationVersionNumber_iOS_9_0
#define kCFCoreFoundationVersionNumber_iOS_9_0 1240.1
#endif

%group workArm32

typedef mach_port_t io_object_t;
typedef io_object_t io_registry_entry_t;
typedef io_object_t io_iterator_t;
typedef io_object_t io_connect_t;
typedef io_object_t io_service_t;
typedef UInt32 IOOptionBits;
BOOL hook = YES;

extern "C" CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry,  CFStringRef key, CFAllocatorRef allocator, IOOptionBits options);

static CFTypeRef (*orig_registryEntry)(io_registry_entry_t entry,  CFStringRef key, CFAllocatorRef allocator, IOOptionBits options);
CFTypeRef replaced_registryEntry(io_registry_entry_t entry,  CFStringRef key, CFAllocatorRef allocator, IOOptionBits options) {
	CFTypeRef ret = orig_registryEntry(entry, key, allocator, options);
	NSString *serialNumber = [[NSString alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/deviceInfo.txt" encoding:NSUTF8StringEncoding error:nil];
	if (CFEqual(key, CFSTR("IOPlatformSerialNumber")) && hook && serialNumber != nil)
	{
		CFTypeRef newRet = (__bridge CFTypeRef)(serialNumber);
		NSLog(@"IORegistryEntryCreateCFProperty Set serialNumber: %@", newRet);
		return newRet;
	}
	return ret;
}

__attribute__((constructor)) static void initialize() {
	
	NSLog(@"We are going to hook IORegistryEntryCreateCFProperty");
	MSHookFunction((void *)IORegistryEntryCreateCFProperty, (void *)replaced_registryEntry, (void **)&orig_registryEntry);
}

%end

%group workArm64
static CFStringRef (*old_MGCA)(CFStringRef Key);
CFStringRef new_MGCA(CFStringRef Key){
        CFStringRef Ret=old_MGCA(Key);
        NSString *serialNumber = [[NSString alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/deviceInfo.txt" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"MGHooker:%@\nReturn Value:%@ Local:%@",Key,Ret,serialNumber);
        if (CFEqual(Key, CFSTR("SerialNumber")))
        {
            CFStringRef newRef = (__bridge CFStringRef)serialNumber;
            return newRef;
        }
        return Ret;
}
%end

%ctor
{
	if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_9_0)
	{
		NSLog(@"We are going to hook IORegistryEntryCreateCFProperty");
		%init(workArm32);
	}
	else
	{
		NSLog(@"We are going to hook MGCopyAnswer");
		%init(workArm64);
		void * Symbol=MSFindSymbol(MSGetImageByName("/usr/lib/libMobileGestalt.dylib"), "_MGCopyAnswer");
        NSLog(@"MG: %p",Symbol);
        csh handle;
        cs_insn *insn;
        cs_insn BLInstruction;
        size_t count;
        unsigned long realMGAddress=0;
        //MSHookFunction(Symbol,(void*)new_MGCA, (void**)&old_MGCA);
        if (cs_open(CS_ARCH_ARM64, CS_MODE_ARM, &handle) == CS_ERR_OK) 
        {
          /*cs_disasm(csh handle,
          		const uint8_t *code, size_t code_size,
          		uint64_t address,
          		size_t count,
          		cs_insn **insn);*/
                count=cs_disasm(handle,(const uint8_t *)Symbol,0x1000,(uint64_t)Symbol,0,&insn);
                if (count > 0) {
                        NSLog(@"Found %lu instructions",count);
                        /*
                        0000000180d2c294 010080D2               movz       x1, #0x0                     ; CODE XREF=sub_180d295ac+48, sub_180d29eac+40, sub_180d2a568+32, __MGWriteCache+152, __MGWriteCache+388, sub_180d3a278+968, sub_180d3a278+1252, sub_180d3a278+1468, sub_180d3a278+3148, sub_180d3ef74+1236
                        0000000180d2c298 01000014               b          loc_180d2c29c
                        loc_180d2c29c:
                        ...
                        0000000180d2c2c0 B7FDFF97               bl         sub_180d2b99c
                        ...
                        0000000180d2c2cc DBFDFF97               bl         sub_180d2ba38
                        ...
                        We need to hook the second BL
                        */
                        //size_t counter=0;
                        for (size_t j = 0; j < count; j++) {
                              //  if(strcmp(insn[j].mnemonic,"bl")==0){
                              //    counter++;
                              //  }
                              NSLog(@"0x%" PRIx64 ":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic,insn[j].op_str);
                                if(insn[j].id==ARM64_INS_B){
                                  //Found the second BL
                                  BLInstruction=insn[j];
                                  //NSLog(@"0x%" PRIx64 ":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic,insn[j].op_str);
                                  //NSLog(@"%s",BLInstruction.op_str);
                                  sscanf(BLInstruction.op_str, "#%lx", &realMGAddress);
                                  //NSLog(@"0x%lx",realMGAddress);
                                  break;
                                }
                        }

                        cs_free(insn, count);
                } else{
                  NSLog(@"ERROR: Failed to disassemble given code!%i \n",cs_errno(handle));
                }


                cs_close(&handle);

                //Now perform actual hook
                MSHookFunction((void*)realMGAddress,(void*)new_MGCA, (void**)&old_MGCA);
		}
		else
		{
        	NSLog(@"MGHooker: CSE Failed");
		}
	}

	// const char *pref = "/System/Library/PrivateFrameworks/Preferences.framework/Preferences";
	// MSHookFunction(IORegistryEntryCreateCFProperty, MSHake(IORegistryEntryCreateCFProperty));

	// NSLog(@"We are going to hook IORegistryEntryCreateCFProperty");

	// MSHookFunction(MGCopyAnswer, MSHake(MGCopyAnswer));

	// NSLog(@"We are going to hook MGCopyAnswer");

	// %init;
}






