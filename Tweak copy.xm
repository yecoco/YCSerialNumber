#import <substrate.h>
#import <sys/sysctl.h>

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
	
	//Filter some of them 
	if (CFEqual(key, CFSTR("MaxCapacity")) && hook)
		return ret;
	if (CFEqual(key, CFSTR("CurrentCapacity")) && hook)
		return ret;
	if (CFEqual(key, CFSTR("ExternalConnected")) && hook)
		return ret;

	// We may going to hook
	NSLog(@"Hooked IORegistryEntryCreateCFProperty funcition: %@ => %@(%@)", key, ret, [(__bridge id)ret class]);


    NSError *error = nil;
    NSString *string = [[NSString alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/deviceInfo.txt" encoding:NSUTF8StringEncoding error:&error];

	if (CFEqual(key, CFSTR("IOPlatformSerialNumber")) && hook && string != nil)
	{
		//CFTypeRef newRet = (__bridge CFTypeRef)(string);
		CFTypeRef newRet = (__bridge CFTypeRef)(@"X2LQPZ8SGRX4");
		NSLog(@"IORegistryEntryCreateCFProperty Set serialNumber: %@", newRet);
		string = nil;
		return newRet;
	} 

	// if (CFEqual(key, CFSTR("model")) && hook && string != nil)
	// {
	// 	uint8_t *pID = (uint8_t *)CFDataGetBytePtr((CFDataRef)ret);
	// 	uint8_t customID[] = {0x69, 0x50, 0x68, 0x6f, 0x6e, 0x65, 0x36, 0x2c, 0x31, 0x00};

	// 	memcpy(pID, customID, 10);
	// 	NSLog(@"IORegistryEntryCreateCFProperty Set model: %@", ret);

	// 	return ret;
	// } 

	// if (CFEqual(key, CFSTR("product-id")) && hook && string != nil)
	// {
	// 	uint8_t *pID = (uint8_t *)CFDataGetBytePtr((CFDataRef)ret);
	// 	uint8_t customID[] = {0xf0, 0x79, 0xcf, 0x0f, 0x89, 0x3f, 0xe5, 0x1f, 0x5f, 0xe7, 0xe1, 0x9c, 0xe5, 0xa2, 0x4f, 0x81, 0xcd, 0x85, 0x4a, 0xeb};

	// 	memcpy(pID, customID, 6);
	// 	NSLog(@"IORegistryEntryCreateCFProperty Set product-id: %@", ret);

	// 	return ret;
	// } 

	// if (CFEqual(key, CFSTR("mac-address-wifi0")) && hook && string != nil)
	// {
		
	// 	uint8_t *mac = (uint8_t *)CFDataGetBytePtr((CFDataRef)ret);
	// 	uint8_t customMac[] = {0xa0, 0x23, 0xdb, 0xae, 0xeb, 0xe8};

	// 	memcpy(mac, customMac, 6);
	// 	NSLog(@"IORegistryEntryCreateCFProperty Set mac-address-wifi0: %@", ret);

	// 	return ret;
	// } 
	
	// if (CFEqual(key, CFSTR("mac-address-bluetooth0")) && hook && string != nil)
	// {
		
	// 	uint8_t *mac = (uint8_t *)CFDataGetBytePtr((CFDataRef)ret);
	// 	uint8_t customMac[] = {0xa0, 0x23, 0xdb, 0xae, 0xeb, 0xe9};

	// 	memcpy(mac, customMac, 6);
	// 	NSLog(@"IORegistryEntryCreateCFProperty Set mac-address-wifi0: %@", ret);

	// 	return ret;
	// } 


    return ret;
}

extern "C" CFPropertyListRef MGCopyAnswer(CFStringRef key);

static CFPropertyListRef (*orig_MGCopyAnswer)(CFStringRef key);

CFPropertyListRef replaced_MGCopyAnswer(CFStringRef key) {
	CFPropertyListRef ret = orig_MGCopyAnswer(key);

	// if (CFEqual(key, CFSTR("ProductVersion")) && hook)
	// 	return ret;
	// if (CFEqual(key, CFSTR("ProductType")) && hook)
	// 	return ret;
	// if (CFEqual(key, CFSTR("DeviceClass")) && hook)
	// 	return ret;
	// if (CFEqual(key, CFSTR("DeviceClassNumber")) && hook)
	// 	return ret;
	// if (CFEqual(key, CFSTR("BuildVersion")) && hook)
	// 	return ret;
	// if (CFEqual(key, CFSTR("HWModelStr")) && hook)
	// 	return ret;
	// if (CFEqual(key, CFSTR("DiskUsage")) && hook)
	// 	return ret;
	// if (CFEqual(key, CFSTR("oPeik/9e8lQWMszEjbPzng")) && hook)
	// 	return ret;

									
	NSLog(@"Hooked MGCopyAnswer %@ => %@(%@)", key, ret, [(__bridge id)ret class]);

	// if (CFEqual(key, CFSTR("InternationalMobileEquipmentIdentity")) && hook)
	// {
	// 	NSLog(@"MGCopyAnswer set: InternationalMobileEquipmentIdentity: %@", CFSTR("012936001016888"));
	// 	return CFSTR("012936001016888");
	// }

	// if (CFEqual(key, CFSTR("h63QSdBCiT/z0WU6rdQv6Q")) && hook)
	// {
	// 	NSLog(@"MGCopyAnswer set: ReginCode: %@", CFSTR("US"));
	// 	return CFSTR("US");
	// }

	// if (CFEqual(key, CFSTR("UniqueDeviceID")) && hook)
	// {
	// 	NSLog(@"MGCopyAnswer change to: 75af34879c893c02692267d1792cda8cc16897b1");
	// 	return CFSTR("75af34879c893c02692267d1792cda8cc16897b1");
	// }

	// if (CFEqual(key, CFSTR("DeviceName")) && hook)
	// {
	// 	NSLog(@"MGCopyAnswer change: DeviceName");
	// 	return CFSTR("iPad");
	// }

	// if (CFEqual(key, CFSTR("SerialNumber")) && hook)
	// {
	// 	NSLog(@"MGCopyAnswer set: DNPLNKECFF9V");
	// 	return CFSTR("DNPLNKECFF9V");
	// }

	// if (CFEqual(key, CFSTR("ProductType")) && hook)
	// {
	// 	NSLog(@"MGCopyAnswer set: iPhone4,2");
	// 	return CFSTR("iPhone4,2");
	// }

	// if (CFEqual(key, CFSTR("ProductVersion")) && hook)
	// {
	// 	NSLog(@"MGCopyAnswer set ProductVersion: 8.1.3");
	// 	return CFSTR("8.1.3");
	// }	


    return ret;
}

// The attribute forces this function to be called on load.
__attribute__((constructor)) static void initialize() {
	
	NSLog(@"We are going to hook IORegistryEntryCreateCFProperty");

	MSHookFunction((void *)IORegistryEntryCreateCFProperty, (void *)replaced_registryEntry, (void **)&orig_registryEntry);

	MSHookFunction((void *)MGCopyAnswer, (void *)replaced_MGCopyAnswer, (void **)&orig_MGCopyAnswer);

	NSLog(@"We are going to hook MGCopyAnswer");

}

// __attribute__((constructor)) static void init(int argc, const char **argv)
// {
// 	//MSHookFunction((void *) IORegistryEntryCreateCFProperty,(void *)  replaced_IORegistryEntryCreateCFProperty, (void **) &original_IORegistryEntryCreateCFProperty);

// 	MSHookFunction((void *)IORegistryEntryCreateCFProperty, (void *)replaced_registryEntry, (void **)&orig_registryEntry);

// 	NSLog(@"We are going to hook IORegistryEntryCreateCFProperty");

// 	// MSHookFunction(((BOOL *)MSFindSymbol(NULL, "_MGGetBoolAnswer")), (BOOL *)replaced_MGGetBoolAnswer, (BOOL **)&old_MGGetBoolAnswer);

// 	// NSLog(@"We are going to hook MGGetBoolAnswer");
// }



// %ctor
// {
// 	// const char *pref = "/System/Library/PrivateFrameworks/Preferences.framework/Preferences";
// 	MSHookFunction(IORegistryEntryCreateCFProperty, MSHake(IORegistryEntryCreateCFProperty));

// 	NSLog(@"We are going to hook IORegistryEntryCreateCFProperty");

// 	MSHookFunction(MGCopyAnswer, MSHake(MGCopyAnswer));

// 	NSLog(@"We are going to hook MGCopyAnswer");

// 	%init;
// }
