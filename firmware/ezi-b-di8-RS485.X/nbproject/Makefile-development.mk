#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-development.mk)" "nbproject/Makefile-local-development.mk"
include nbproject/Makefile-local-development.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=development
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ezi-b-di8-RS485.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ezi-b-di8-RS485.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/development/driver/usb/usbfs/src/drv_usbfs.c ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c ../src/config/development/peripheral/clk/plib_clk.c ../src/config/development/peripheral/coretimer/plib_coretimer.c ../src/config/development/peripheral/evic/plib_evic.c ../src/config/development/peripheral/gpio/plib_gpio.c ../src/config/development/peripheral/i2c/plib_i2c1.c ../src/config/development/peripheral/tmr/plib_tmr2.c ../src/config/development/peripheral/uart/plib_uart3.c ../src/config/development/peripheral/uart/plib_uart4.c ../src/config/development/peripheral/uart/plib_uart1.c ../src/config/development/peripheral/uart/plib_uart2.c ../src/config/development/stdio/xc32_monitor.c ../src/config/development/system/console/src/sys_console.c ../src/config/development/system/console/src/sys_console_usb_cdc.c ../src/config/development/system/debug/src/sys_debug.c ../src/config/development/system/int/src/sys_int.c ../src/config/development/system/time/src/sys_time.c ../src/config/development/usb/src/usb_device.c ../src/config/development/usb/src/usb_device_cdc.c ../src/config/development/usb/src/usb_device_cdc_acm.c ../src/config/development/initialization.c ../src/config/development/interrupts.c ../src/config/development/exceptions.c ../src/config/development/usb_device_init_data.c ../src/config/development/tasks.c ../src/main.c ../src/app.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ${OBJECTDIR}/_ext/823310505/plib_evic.o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ${OBJECTDIR}/_ext/1585446291/sys_console.o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ${OBJECTDIR}/_ext/794575281/sys_debug.o ${OBJECTDIR}/_ext/270921643/sys_int.o ${OBJECTDIR}/_ext/1504571547/sys_time.o ${OBJECTDIR}/_ext/1649042674/usb_device.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ${OBJECTDIR}/_ext/1221570264/initialization.o ${OBJECTDIR}/_ext/1221570264/interrupts.o ${OBJECTDIR}/_ext/1221570264/exceptions.o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ${OBJECTDIR}/_ext/1221570264/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d ${OBJECTDIR}/_ext/1550581290/plib_clk.o.d ${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d ${OBJECTDIR}/_ext/823310505/plib_evic.o.d ${OBJECTDIR}/_ext/823256677/plib_gpio.o.d ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d ${OBJECTDIR}/_ext/822853734/plib_uart3.o.d ${OBJECTDIR}/_ext/822853734/plib_uart4.o.d ${OBJECTDIR}/_ext/822853734/plib_uart1.o.d ${OBJECTDIR}/_ext/822853734/plib_uart2.o.d ${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d ${OBJECTDIR}/_ext/1585446291/sys_console.o.d ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d ${OBJECTDIR}/_ext/794575281/sys_debug.o.d ${OBJECTDIR}/_ext/270921643/sys_int.o.d ${OBJECTDIR}/_ext/1504571547/sys_time.o.d ${OBJECTDIR}/_ext/1649042674/usb_device.o.d ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d ${OBJECTDIR}/_ext/1221570264/initialization.o.d ${OBJECTDIR}/_ext/1221570264/interrupts.o.d ${OBJECTDIR}/_ext/1221570264/exceptions.o.d ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d ${OBJECTDIR}/_ext/1221570264/tasks.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ${OBJECTDIR}/_ext/823310505/plib_evic.o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ${OBJECTDIR}/_ext/1585446291/sys_console.o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ${OBJECTDIR}/_ext/794575281/sys_debug.o ${OBJECTDIR}/_ext/270921643/sys_int.o ${OBJECTDIR}/_ext/1504571547/sys_time.o ${OBJECTDIR}/_ext/1649042674/usb_device.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ${OBJECTDIR}/_ext/1221570264/initialization.o ${OBJECTDIR}/_ext/1221570264/interrupts.o ${OBJECTDIR}/_ext/1221570264/exceptions.o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ${OBJECTDIR}/_ext/1221570264/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o

# Source Files
SOURCEFILES=../src/config/development/driver/usb/usbfs/src/drv_usbfs.c ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c ../src/config/development/peripheral/clk/plib_clk.c ../src/config/development/peripheral/coretimer/plib_coretimer.c ../src/config/development/peripheral/evic/plib_evic.c ../src/config/development/peripheral/gpio/plib_gpio.c ../src/config/development/peripheral/i2c/plib_i2c1.c ../src/config/development/peripheral/tmr/plib_tmr2.c ../src/config/development/peripheral/uart/plib_uart3.c ../src/config/development/peripheral/uart/plib_uart4.c ../src/config/development/peripheral/uart/plib_uart1.c ../src/config/development/peripheral/uart/plib_uart2.c ../src/config/development/stdio/xc32_monitor.c ../src/config/development/system/console/src/sys_console.c ../src/config/development/system/console/src/sys_console_usb_cdc.c ../src/config/development/system/debug/src/sys_debug.c ../src/config/development/system/int/src/sys_int.c ../src/config/development/system/time/src/sys_time.c ../src/config/development/usb/src/usb_device.c ../src/config/development/usb/src/usb_device_cdc.c ../src/config/development/usb/src/usb_device_cdc_acm.c ../src/config/development/initialization.c ../src/config/development/interrupts.c ../src/config/development/exceptions.c ../src/config/development/usb_device_init_data.c ../src/config/development/tasks.c ../src/main.c ../src/app.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-development.mk dist/${CND_CONF}/${IMAGE_TYPE}/ezi-b-di8-RS485.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX250F256H
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1456194107/drv_usbfs.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/development/2ae8c01e96437bdc7eb7f57d501e9974847a9454 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/development/59250b8e3d8d76c73f46d425a639c2d229e601a6 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550581290/plib_clk.o: ../src/config/development/peripheral/clk/plib_clk.c  .generated_files/flags/development/d9384bdc992d023fd01d59e5da52fe1dd5af5227 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550581290" 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550581290/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ../src/config/development/peripheral/clk/plib_clk.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/539061434/plib_coretimer.o: ../src/config/development/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/development/10068e2651d3f891fd85f6270a65d385cd9ac504 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/539061434" 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ../src/config/development/peripheral/coretimer/plib_coretimer.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823310505/plib_evic.o: ../src/config/development/peripheral/evic/plib_evic.c  .generated_files/flags/development/efa808672fff075208efa97382b444f22d63860b .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823310505" 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823310505/plib_evic.o.d" -o ${OBJECTDIR}/_ext/823310505/plib_evic.o ../src/config/development/peripheral/evic/plib_evic.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823256677/plib_gpio.o: ../src/config/development/peripheral/gpio/plib_gpio.c  .generated_files/flags/development/8ac7b07fc1e759886441e381c581e268f9479335 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823256677" 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823256677/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ../src/config/development/peripheral/gpio/plib_gpio.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550577330/plib_i2c1.o: ../src/config/development/peripheral/i2c/plib_i2c1.c  .generated_files/flags/development/e2c7e55b6ba982effeb9d62bd466d1e86eecbb34 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550577330" 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d" -o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ../src/config/development/peripheral/i2c/plib_i2c1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550564915/plib_tmr2.o: ../src/config/development/peripheral/tmr/plib_tmr2.c  .generated_files/flags/development/777cafa5fd200149323d7cda6559a5c09a51da78 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550564915" 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ../src/config/development/peripheral/tmr/plib_tmr2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart3.o: ../src/config/development/peripheral/uart/plib_uart3.c  .generated_files/flags/development/b148ca28b0f6305eedb295d65c933b38ae5b29f5 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart3.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ../src/config/development/peripheral/uart/plib_uart3.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart4.o: ../src/config/development/peripheral/uart/plib_uart4.c  .generated_files/flags/development/bb213a7ee1f94b241c3ad374a07f99eed29feca7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart4.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ../src/config/development/peripheral/uart/plib_uart4.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart1.o: ../src/config/development/peripheral/uart/plib_uart1.c  .generated_files/flags/development/8d85679182456105dbb7351b0eaa2fcac1b695a0 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ../src/config/development/peripheral/uart/plib_uart1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart2.o: ../src/config/development/peripheral/uart/plib_uart2.c  .generated_files/flags/development/4c94e820e166dec3e1567d10f27e057f49d5b3b7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ../src/config/development/peripheral/uart/plib_uart2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/111634146/xc32_monitor.o: ../src/config/development/stdio/xc32_monitor.c  .generated_files/flags/development/254a199caeb4a1ce9ead6b6b88625de9c7c8a70c .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/111634146" 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ../src/config/development/stdio/xc32_monitor.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console.o: ../src/config/development/system/console/src/sys_console.c  .generated_files/flags/development/2cb5203ebc5da967e2bd75d9fbab7b70acb9fb0 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console.o ../src/config/development/system/console/src/sys_console.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o: ../src/config/development/system/console/src/sys_console_usb_cdc.c  .generated_files/flags/development/5b9b00d58a2657a8ab15db6a0fcd5c02f0f10a35 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ../src/config/development/system/console/src/sys_console_usb_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/794575281/sys_debug.o: ../src/config/development/system/debug/src/sys_debug.c  .generated_files/flags/development/4d70a1ae8a4b886bcd91f3597564cef377b823f .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/794575281" 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/794575281/sys_debug.o.d" -o ${OBJECTDIR}/_ext/794575281/sys_debug.o ../src/config/development/system/debug/src/sys_debug.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/270921643/sys_int.o: ../src/config/development/system/int/src/sys_int.c  .generated_files/flags/development/496788c4de8c25ba32754f9288db915d53369569 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/270921643" 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/270921643/sys_int.o.d" -o ${OBJECTDIR}/_ext/270921643/sys_int.o ../src/config/development/system/int/src/sys_int.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1504571547/sys_time.o: ../src/config/development/system/time/src/sys_time.c  .generated_files/flags/development/9a40d623f08e0c09666ae9abc4dc73f1b96f6ee0 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1504571547" 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1504571547/sys_time.o.d" -o ${OBJECTDIR}/_ext/1504571547/sys_time.o ../src/config/development/system/time/src/sys_time.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device.o: ../src/config/development/usb/src/usb_device.c  .generated_files/flags/development/b9b68c8fd27490c725e478416b5bbb407009140e .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device.o ../src/config/development/usb/src/usb_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o: ../src/config/development/usb/src/usb_device_cdc.c  .generated_files/flags/development/524837dbe09bfb67cf4cba6e75fb5cc1c696bf31 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ../src/config/development/usb/src/usb_device_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o: ../src/config/development/usb/src/usb_device_cdc_acm.c  .generated_files/flags/development/7569fdcd0ea0e7b211c743edf3c24477682eabf .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ../src/config/development/usb/src/usb_device_cdc_acm.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/initialization.o: ../src/config/development/initialization.c  .generated_files/flags/development/944ac056793c60490bd974a095a21d32478d6476 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/initialization.o.d" -o ${OBJECTDIR}/_ext/1221570264/initialization.o ../src/config/development/initialization.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/interrupts.o: ../src/config/development/interrupts.c  .generated_files/flags/development/eef2ea95103de692d39c7c13ae2f321e6cc6737d .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/interrupts.o.d" -o ${OBJECTDIR}/_ext/1221570264/interrupts.o ../src/config/development/interrupts.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/exceptions.o: ../src/config/development/exceptions.c  .generated_files/flags/development/7e746027c695fedf16f00bbb8a63bd5c27f943a6 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/exceptions.o.d" -o ${OBJECTDIR}/_ext/1221570264/exceptions.o ../src/config/development/exceptions.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o: ../src/config/development/usb_device_init_data.c  .generated_files/flags/development/76ea98fee11caa61e0f64376bf33f7c43388a64c .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d" -o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ../src/config/development/usb_device_init_data.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/tasks.o: ../src/config/development/tasks.c  .generated_files/flags/development/c54ae58d37c0a1034891f6db7de1ad0d82e4a844 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/tasks.o.d" -o ${OBJECTDIR}/_ext/1221570264/tasks.o ../src/config/development/tasks.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/development/413c3354b9443ec2141737077ba5ea06b53222d3 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/development/e47021a1a257901fece089e815206dae0e1a814a .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1456194107/drv_usbfs.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/development/62eab19260cc0c0ad385ef7074984128eb5c48dd .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/development/4cbe4489fd76ebe577dc1e205b2b98919ab30832 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550581290/plib_clk.o: ../src/config/development/peripheral/clk/plib_clk.c  .generated_files/flags/development/7685395fb6c0ab962c4b87606ad5ea73bdc6d6f5 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550581290" 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550581290/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ../src/config/development/peripheral/clk/plib_clk.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/539061434/plib_coretimer.o: ../src/config/development/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/development/a38a97ca8ebbfcdca3ce7605dc457b667052fad7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/539061434" 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ../src/config/development/peripheral/coretimer/plib_coretimer.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823310505/plib_evic.o: ../src/config/development/peripheral/evic/plib_evic.c  .generated_files/flags/development/c395f577591a5b8d3023546beb81f2e761fe67eb .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823310505" 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823310505/plib_evic.o.d" -o ${OBJECTDIR}/_ext/823310505/plib_evic.o ../src/config/development/peripheral/evic/plib_evic.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823256677/plib_gpio.o: ../src/config/development/peripheral/gpio/plib_gpio.c  .generated_files/flags/development/8a4349681dd1221d14bf6841fafef16d297bcec .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823256677" 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823256677/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ../src/config/development/peripheral/gpio/plib_gpio.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550577330/plib_i2c1.o: ../src/config/development/peripheral/i2c/plib_i2c1.c  .generated_files/flags/development/56bf49e67bf18b53758e3660f875c186c527004f .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550577330" 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d" -o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ../src/config/development/peripheral/i2c/plib_i2c1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550564915/plib_tmr2.o: ../src/config/development/peripheral/tmr/plib_tmr2.c  .generated_files/flags/development/9ee5699dfe32ae0e7c06ff7e78ced07d441a668d .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550564915" 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ../src/config/development/peripheral/tmr/plib_tmr2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart3.o: ../src/config/development/peripheral/uart/plib_uart3.c  .generated_files/flags/development/e6dfcaab6b0cd6ffa963ad4ab2a6184150655275 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart3.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ../src/config/development/peripheral/uart/plib_uart3.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart4.o: ../src/config/development/peripheral/uart/plib_uart4.c  .generated_files/flags/development/d13ab4a5af716b0dde44a0618500216849080dfa .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart4.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ../src/config/development/peripheral/uart/plib_uart4.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart1.o: ../src/config/development/peripheral/uart/plib_uart1.c  .generated_files/flags/development/fbbc2dc78faea239a73f7d2f0595035dbff8627c .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ../src/config/development/peripheral/uart/plib_uart1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart2.o: ../src/config/development/peripheral/uart/plib_uart2.c  .generated_files/flags/development/9ed0d86443b6b79ce3d25b9e5ae93fe1475144f8 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ../src/config/development/peripheral/uart/plib_uart2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/111634146/xc32_monitor.o: ../src/config/development/stdio/xc32_monitor.c  .generated_files/flags/development/6a87c0d97b9b6d47894697ef60e98eb186bc7a95 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/111634146" 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ../src/config/development/stdio/xc32_monitor.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console.o: ../src/config/development/system/console/src/sys_console.c  .generated_files/flags/development/29915d770b6859d8e0bb142a291abf0de2b8326b .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console.o ../src/config/development/system/console/src/sys_console.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o: ../src/config/development/system/console/src/sys_console_usb_cdc.c  .generated_files/flags/development/2897faba17ae0c386f49ea9b919c17b75a265ac3 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ../src/config/development/system/console/src/sys_console_usb_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/794575281/sys_debug.o: ../src/config/development/system/debug/src/sys_debug.c  .generated_files/flags/development/da8b575879574b1fd3c99709e14c22b9ff67d57e .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/794575281" 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/794575281/sys_debug.o.d" -o ${OBJECTDIR}/_ext/794575281/sys_debug.o ../src/config/development/system/debug/src/sys_debug.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/270921643/sys_int.o: ../src/config/development/system/int/src/sys_int.c  .generated_files/flags/development/4662b13877880dbb56cacc2f37d9a8f590538548 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/270921643" 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/270921643/sys_int.o.d" -o ${OBJECTDIR}/_ext/270921643/sys_int.o ../src/config/development/system/int/src/sys_int.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1504571547/sys_time.o: ../src/config/development/system/time/src/sys_time.c  .generated_files/flags/development/38b417929a186ba96cc12631021241249cbe236f .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1504571547" 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1504571547/sys_time.o.d" -o ${OBJECTDIR}/_ext/1504571547/sys_time.o ../src/config/development/system/time/src/sys_time.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device.o: ../src/config/development/usb/src/usb_device.c  .generated_files/flags/development/7c97d7a4e800da7c669d7e628fd02fd34b93d529 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device.o ../src/config/development/usb/src/usb_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o: ../src/config/development/usb/src/usb_device_cdc.c  .generated_files/flags/development/af12020dcd2a30c1b06a579d1fe3ecf44cf7e427 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ../src/config/development/usb/src/usb_device_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o: ../src/config/development/usb/src/usb_device_cdc_acm.c  .generated_files/flags/development/f79f3db67cb3979566b12f7932c6b2851da98933 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ../src/config/development/usb/src/usb_device_cdc_acm.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/initialization.o: ../src/config/development/initialization.c  .generated_files/flags/development/abd4d8a7269feb5ce205da511711d78cb187afa9 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/initialization.o.d" -o ${OBJECTDIR}/_ext/1221570264/initialization.o ../src/config/development/initialization.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/interrupts.o: ../src/config/development/interrupts.c  .generated_files/flags/development/4ba0107d82fa0f83576770fcdf3f654bf8e226ed .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/interrupts.o.d" -o ${OBJECTDIR}/_ext/1221570264/interrupts.o ../src/config/development/interrupts.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/exceptions.o: ../src/config/development/exceptions.c  .generated_files/flags/development/bca0f214094af0b1d2a309114a3715e81dd6efac .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/exceptions.o.d" -o ${OBJECTDIR}/_ext/1221570264/exceptions.o ../src/config/development/exceptions.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o: ../src/config/development/usb_device_init_data.c  .generated_files/flags/development/aa05d1f7a0118f0f193ecdf47f27eb4a1faaa5e7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d" -o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ../src/config/development/usb_device_init_data.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/tasks.o: ../src/config/development/tasks.c  .generated_files/flags/development/38743bd455c509161d041313993a8e48422137d3 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/tasks.o.d" -o ${OBJECTDIR}/_ext/1221570264/tasks.o ../src/config/development/tasks.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/development/b1ede7a9386dcc7210b758f547e6be254c44f260 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/development/d309057de7750117fb63cd8d6852c5d3641cb92b .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/ezi-b-di8-RS485.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/ezi-b-di8-RS485.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/ezi-b-di8-RS485.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/ezi-b-di8-RS485.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/ezi-b-di8-RS485.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/development
	${RM} -r dist/development

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
