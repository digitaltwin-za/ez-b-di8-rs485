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
SOURCEFILES_QUOTED_IF_SPACED=../src/config/development/driver/usb/usbfs/src/drv_usbfs.c ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c ../src/config/development/peripheral/clk/plib_clk.c ../src/config/development/peripheral/coretimer/plib_coretimer.c ../src/config/development/peripheral/evic/plib_evic.c ../src/config/development/peripheral/gpio/plib_gpio.c ../src/config/development/peripheral/i2c/plib_i2c1.c ../src/config/development/peripheral/tmr/plib_tmr2.c ../src/config/development/peripheral/uart/plib_uart3.c ../src/config/development/peripheral/uart/plib_uart4.c ../src/config/development/peripheral/uart/plib_uart1.c ../src/config/development/peripheral/uart/plib_uart2.c ../src/config/development/stdio/xc32_monitor.c ../src/config/development/system/console/src/sys_console.c ../src/config/development/system/console/src/sys_console_usb_cdc.c ../src/config/development/system/debug/src/sys_debug.c ../src/config/development/system/int/src/sys_int.c ../src/config/development/system/time/src/sys_time.c ../src/config/development/usb/src/usb_device.c ../src/config/development/usb/src/usb_device_cdc.c ../src/config/development/usb/src/usb_device_cdc_acm.c ../src/config/development/initialization.c ../src/config/development/interrupts.c ../src/config/development/exceptions.c ../src/config/development/usb_device_init_data.c ../src/config/development/tasks.c ../src/modbus_src/mb.c ../src/modbus_src/mbcrc.c ../src/modbus_src/mb_setup.c ../src/modbus_src/RS485_HAL.c ../src/modbus_src/fifo.c ../src/main.c ../src/app.c ../src/plib_nvm.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ${OBJECTDIR}/_ext/823310505/plib_evic.o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ${OBJECTDIR}/_ext/1585446291/sys_console.o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ${OBJECTDIR}/_ext/794575281/sys_debug.o ${OBJECTDIR}/_ext/270921643/sys_int.o ${OBJECTDIR}/_ext/1504571547/sys_time.o ${OBJECTDIR}/_ext/1649042674/usb_device.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ${OBJECTDIR}/_ext/1221570264/initialization.o ${OBJECTDIR}/_ext/1221570264/interrupts.o ${OBJECTDIR}/_ext/1221570264/exceptions.o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ${OBJECTDIR}/_ext/1221570264/tasks.o ${OBJECTDIR}/_ext/1910538141/mb.o ${OBJECTDIR}/_ext/1910538141/mbcrc.o ${OBJECTDIR}/_ext/1910538141/mb_setup.o ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o ${OBJECTDIR}/_ext/1910538141/fifo.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/plib_nvm.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d ${OBJECTDIR}/_ext/1550581290/plib_clk.o.d ${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d ${OBJECTDIR}/_ext/823310505/plib_evic.o.d ${OBJECTDIR}/_ext/823256677/plib_gpio.o.d ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d ${OBJECTDIR}/_ext/822853734/plib_uart3.o.d ${OBJECTDIR}/_ext/822853734/plib_uart4.o.d ${OBJECTDIR}/_ext/822853734/plib_uart1.o.d ${OBJECTDIR}/_ext/822853734/plib_uart2.o.d ${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d ${OBJECTDIR}/_ext/1585446291/sys_console.o.d ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d ${OBJECTDIR}/_ext/794575281/sys_debug.o.d ${OBJECTDIR}/_ext/270921643/sys_int.o.d ${OBJECTDIR}/_ext/1504571547/sys_time.o.d ${OBJECTDIR}/_ext/1649042674/usb_device.o.d ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d ${OBJECTDIR}/_ext/1221570264/initialization.o.d ${OBJECTDIR}/_ext/1221570264/interrupts.o.d ${OBJECTDIR}/_ext/1221570264/exceptions.o.d ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d ${OBJECTDIR}/_ext/1221570264/tasks.o.d ${OBJECTDIR}/_ext/1910538141/mb.o.d ${OBJECTDIR}/_ext/1910538141/mbcrc.o.d ${OBJECTDIR}/_ext/1910538141/mb_setup.o.d ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d ${OBJECTDIR}/_ext/1910538141/fifo.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/plib_nvm.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ${OBJECTDIR}/_ext/823310505/plib_evic.o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ${OBJECTDIR}/_ext/1585446291/sys_console.o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ${OBJECTDIR}/_ext/794575281/sys_debug.o ${OBJECTDIR}/_ext/270921643/sys_int.o ${OBJECTDIR}/_ext/1504571547/sys_time.o ${OBJECTDIR}/_ext/1649042674/usb_device.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ${OBJECTDIR}/_ext/1221570264/initialization.o ${OBJECTDIR}/_ext/1221570264/interrupts.o ${OBJECTDIR}/_ext/1221570264/exceptions.o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ${OBJECTDIR}/_ext/1221570264/tasks.o ${OBJECTDIR}/_ext/1910538141/mb.o ${OBJECTDIR}/_ext/1910538141/mbcrc.o ${OBJECTDIR}/_ext/1910538141/mb_setup.o ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o ${OBJECTDIR}/_ext/1910538141/fifo.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/plib_nvm.o

# Source Files
SOURCEFILES=../src/config/development/driver/usb/usbfs/src/drv_usbfs.c ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c ../src/config/development/peripheral/clk/plib_clk.c ../src/config/development/peripheral/coretimer/plib_coretimer.c ../src/config/development/peripheral/evic/plib_evic.c ../src/config/development/peripheral/gpio/plib_gpio.c ../src/config/development/peripheral/i2c/plib_i2c1.c ../src/config/development/peripheral/tmr/plib_tmr2.c ../src/config/development/peripheral/uart/plib_uart3.c ../src/config/development/peripheral/uart/plib_uart4.c ../src/config/development/peripheral/uart/plib_uart1.c ../src/config/development/peripheral/uart/plib_uart2.c ../src/config/development/stdio/xc32_monitor.c ../src/config/development/system/console/src/sys_console.c ../src/config/development/system/console/src/sys_console_usb_cdc.c ../src/config/development/system/debug/src/sys_debug.c ../src/config/development/system/int/src/sys_int.c ../src/config/development/system/time/src/sys_time.c ../src/config/development/usb/src/usb_device.c ../src/config/development/usb/src/usb_device_cdc.c ../src/config/development/usb/src/usb_device_cdc_acm.c ../src/config/development/initialization.c ../src/config/development/interrupts.c ../src/config/development/exceptions.c ../src/config/development/usb_device_init_data.c ../src/config/development/tasks.c ../src/modbus_src/mb.c ../src/modbus_src/mbcrc.c ../src/modbus_src/mb_setup.c ../src/modbus_src/RS485_HAL.c ../src/modbus_src/fifo.c ../src/main.c ../src/app.c ../src/plib_nvm.c



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
${OBJECTDIR}/_ext/1456194107/drv_usbfs.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/development/20baae202d1c14fba8b8e4c4a3364aeb46c71d86 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/development/af81cd4f89cea44ea1d7aa5f12d93ba28fa84051 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550581290/plib_clk.o: ../src/config/development/peripheral/clk/plib_clk.c  .generated_files/flags/development/341c5d7203698a5912dccb01203d5520c5d381c1 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550581290" 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550581290/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ../src/config/development/peripheral/clk/plib_clk.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/539061434/plib_coretimer.o: ../src/config/development/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/development/560e7995fd7f1d7bf485759d521aa50f2812ebc7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/539061434" 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ../src/config/development/peripheral/coretimer/plib_coretimer.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823310505/plib_evic.o: ../src/config/development/peripheral/evic/plib_evic.c  .generated_files/flags/development/62e4d33c8f4b83f6066664d8410aa51f9317bb10 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823310505" 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823310505/plib_evic.o.d" -o ${OBJECTDIR}/_ext/823310505/plib_evic.o ../src/config/development/peripheral/evic/plib_evic.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823256677/plib_gpio.o: ../src/config/development/peripheral/gpio/plib_gpio.c  .generated_files/flags/development/dd63594003e334d01710d47854b1c50850930872 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823256677" 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823256677/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ../src/config/development/peripheral/gpio/plib_gpio.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550577330/plib_i2c1.o: ../src/config/development/peripheral/i2c/plib_i2c1.c  .generated_files/flags/development/e4ecd07cd1199b49c2c780a4113eeb4fa1d49302 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550577330" 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d" -o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ../src/config/development/peripheral/i2c/plib_i2c1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550564915/plib_tmr2.o: ../src/config/development/peripheral/tmr/plib_tmr2.c  .generated_files/flags/development/2aae7eb21c3e6d77673c2a81e1b4807139b503d0 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550564915" 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ../src/config/development/peripheral/tmr/plib_tmr2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart3.o: ../src/config/development/peripheral/uart/plib_uart3.c  .generated_files/flags/development/5919df6c24c1cb4e003c4e7808379c6d09289c93 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart3.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ../src/config/development/peripheral/uart/plib_uart3.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart4.o: ../src/config/development/peripheral/uart/plib_uart4.c  .generated_files/flags/development/d349793788859ba6fef5498d0e4d4fc0ba2cb44e .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart4.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ../src/config/development/peripheral/uart/plib_uart4.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart1.o: ../src/config/development/peripheral/uart/plib_uart1.c  .generated_files/flags/development/c6961a677e6ec3227d7c34b5c66bad9ce1fcdf69 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ../src/config/development/peripheral/uart/plib_uart1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart2.o: ../src/config/development/peripheral/uart/plib_uart2.c  .generated_files/flags/development/28db741c0c5f64d75cd480f2bfec0ba59ecbc43b .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ../src/config/development/peripheral/uart/plib_uart2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/111634146/xc32_monitor.o: ../src/config/development/stdio/xc32_monitor.c  .generated_files/flags/development/1926ac8c8b9cf06067de7198f9d8f1525e8089c0 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/111634146" 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ../src/config/development/stdio/xc32_monitor.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console.o: ../src/config/development/system/console/src/sys_console.c  .generated_files/flags/development/f07eb087f0d96fa1382c56f751a9732136d5cb38 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console.o ../src/config/development/system/console/src/sys_console.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o: ../src/config/development/system/console/src/sys_console_usb_cdc.c  .generated_files/flags/development/8a19a5f13543f7661e8bc915567e8923778d9da8 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ../src/config/development/system/console/src/sys_console_usb_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/794575281/sys_debug.o: ../src/config/development/system/debug/src/sys_debug.c  .generated_files/flags/development/9185baeeaebfee92b7feecc6b77c2687797c65f7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/794575281" 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/794575281/sys_debug.o.d" -o ${OBJECTDIR}/_ext/794575281/sys_debug.o ../src/config/development/system/debug/src/sys_debug.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/270921643/sys_int.o: ../src/config/development/system/int/src/sys_int.c  .generated_files/flags/development/7bdb77ce7dd0af99aca25b0c3c13e33e9b08fa80 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/270921643" 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/270921643/sys_int.o.d" -o ${OBJECTDIR}/_ext/270921643/sys_int.o ../src/config/development/system/int/src/sys_int.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1504571547/sys_time.o: ../src/config/development/system/time/src/sys_time.c  .generated_files/flags/development/1e6e0ecf4479e54c8e7524667e4b9e20ee99a330 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1504571547" 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1504571547/sys_time.o.d" -o ${OBJECTDIR}/_ext/1504571547/sys_time.o ../src/config/development/system/time/src/sys_time.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device.o: ../src/config/development/usb/src/usb_device.c  .generated_files/flags/development/5dc87a7d2a28d41df8fdc01ff9c8eaf865723a79 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device.o ../src/config/development/usb/src/usb_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o: ../src/config/development/usb/src/usb_device_cdc.c  .generated_files/flags/development/1150d0d2dde44d853fab46c7052e23ba4fad97b8 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ../src/config/development/usb/src/usb_device_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o: ../src/config/development/usb/src/usb_device_cdc_acm.c  .generated_files/flags/development/44ad24f72fe15e9a060612f24f37c653fe4e46df .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ../src/config/development/usb/src/usb_device_cdc_acm.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/initialization.o: ../src/config/development/initialization.c  .generated_files/flags/development/e3be00520d1637f8089a04e69ca03df2a095c50e .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/initialization.o.d" -o ${OBJECTDIR}/_ext/1221570264/initialization.o ../src/config/development/initialization.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/interrupts.o: ../src/config/development/interrupts.c  .generated_files/flags/development/81854c9c12b2f6e47f5e7bc43dec2343209777f2 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/interrupts.o.d" -o ${OBJECTDIR}/_ext/1221570264/interrupts.o ../src/config/development/interrupts.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/exceptions.o: ../src/config/development/exceptions.c  .generated_files/flags/development/91331c3c07c098c48a8852c4c8f380df03f62922 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/exceptions.o.d" -o ${OBJECTDIR}/_ext/1221570264/exceptions.o ../src/config/development/exceptions.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o: ../src/config/development/usb_device_init_data.c  .generated_files/flags/development/b7df1ab892882bb0c125668cc950a7939b378f47 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d" -o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ../src/config/development/usb_device_init_data.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/tasks.o: ../src/config/development/tasks.c  .generated_files/flags/development/235447f3ae118e6a25bf8e4303677625676468c5 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/tasks.o.d" -o ${OBJECTDIR}/_ext/1221570264/tasks.o ../src/config/development/tasks.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mb.o: ../src/modbus_src/mb.c  .generated_files/flags/development/fe7ae41ffb78c687eed276b7327f8ab0ea1c7411 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mb.o.d" -o ${OBJECTDIR}/_ext/1910538141/mb.o ../src/modbus_src/mb.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mbcrc.o: ../src/modbus_src/mbcrc.c  .generated_files/flags/development/a40d518fc7ee8dc0de523558684ba67f130ac173 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mbcrc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mbcrc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mbcrc.o.d" -o ${OBJECTDIR}/_ext/1910538141/mbcrc.o ../src/modbus_src/mbcrc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mb_setup.o: ../src/modbus_src/mb_setup.c  .generated_files/flags/development/fe03eeeb5ff4e49fb357a065afa41dcd12447c27 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mb_setup.o.d" -o ${OBJECTDIR}/_ext/1910538141/mb_setup.o ../src/modbus_src/mb_setup.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/RS485_HAL.o: ../src/modbus_src/RS485_HAL.c  .generated_files/flags/development/78ee7ef20e7c581fe70f75057f428d9df9de4153 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d" -o ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o ../src/modbus_src/RS485_HAL.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/fifo.o: ../src/modbus_src/fifo.c  .generated_files/flags/development/bbd511a6b89f986a8b747da008664f9c5fdcb906 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/fifo.o.d" -o ${OBJECTDIR}/_ext/1910538141/fifo.o ../src/modbus_src/fifo.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/development/1822007ed47ae55476093bfeb7790a0cd8a62f7f .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/development/898fe571af9df12a118a729e0a6a5fece45567ba .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/plib_nvm.o: ../src/plib_nvm.c  .generated_files/flags/development/258f6de3f8854c60eaf3dd630abdea48cfcf3721 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/plib_nvm.o.d" -o ${OBJECTDIR}/_ext/1360937237/plib_nvm.o ../src/plib_nvm.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1456194107/drv_usbfs.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/development/dea16066a243667affdf5cffcd370e537b0bd6f5 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/development/d64fff81ea35b34efad82088f1b6af4fe0980873 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550581290/plib_clk.o: ../src/config/development/peripheral/clk/plib_clk.c  .generated_files/flags/development/ad882183cba786158ff112defe6483b9e0cb3264 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550581290" 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550581290/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ../src/config/development/peripheral/clk/plib_clk.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/539061434/plib_coretimer.o: ../src/config/development/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/development/b5406cca2e4490baadf1ae2f9e4a768a989fe6cd .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/539061434" 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ../src/config/development/peripheral/coretimer/plib_coretimer.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823310505/plib_evic.o: ../src/config/development/peripheral/evic/plib_evic.c  .generated_files/flags/development/496b02e8d5014db66e9a3df1874451d18471e129 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823310505" 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823310505/plib_evic.o.d" -o ${OBJECTDIR}/_ext/823310505/plib_evic.o ../src/config/development/peripheral/evic/plib_evic.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823256677/plib_gpio.o: ../src/config/development/peripheral/gpio/plib_gpio.c  .generated_files/flags/development/7081b83e9e0a6a7858b1264ad061c247459be3f9 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823256677" 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823256677/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ../src/config/development/peripheral/gpio/plib_gpio.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550577330/plib_i2c1.o: ../src/config/development/peripheral/i2c/plib_i2c1.c  .generated_files/flags/development/485f1ebc968732c7f8d5157ca9cd9fbbb5668ec2 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550577330" 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d" -o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ../src/config/development/peripheral/i2c/plib_i2c1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550564915/plib_tmr2.o: ../src/config/development/peripheral/tmr/plib_tmr2.c  .generated_files/flags/development/3bb29e45b940118766a1f3a5fa2140f2dfde61bc .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550564915" 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ../src/config/development/peripheral/tmr/plib_tmr2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart3.o: ../src/config/development/peripheral/uart/plib_uart3.c  .generated_files/flags/development/fea544a2b9295645df85057746541990cd1a5240 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart3.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ../src/config/development/peripheral/uart/plib_uart3.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart4.o: ../src/config/development/peripheral/uart/plib_uart4.c  .generated_files/flags/development/5cb6b80691ee83d77aa7c0e8cc0e34cdb3dd2b5d .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart4.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ../src/config/development/peripheral/uart/plib_uart4.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart1.o: ../src/config/development/peripheral/uart/plib_uart1.c  .generated_files/flags/development/9741dc7ee7b24f576346e863333094356ac8dd9 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ../src/config/development/peripheral/uart/plib_uart1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart2.o: ../src/config/development/peripheral/uart/plib_uart2.c  .generated_files/flags/development/6244b4b24e9327736fabacad478e6d36ca13560a .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ../src/config/development/peripheral/uart/plib_uart2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/111634146/xc32_monitor.o: ../src/config/development/stdio/xc32_monitor.c  .generated_files/flags/development/6f80e2fb4a8b5016a5193882c1bc4b2eb10ad1cb .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/111634146" 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ../src/config/development/stdio/xc32_monitor.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console.o: ../src/config/development/system/console/src/sys_console.c  .generated_files/flags/development/ab14b36adcb307f85f88729d3fd8812cff29e7b6 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console.o ../src/config/development/system/console/src/sys_console.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o: ../src/config/development/system/console/src/sys_console_usb_cdc.c  .generated_files/flags/development/259d6df3dadd4db1a4d5e77c9a61bf0f65919732 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ../src/config/development/system/console/src/sys_console_usb_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/794575281/sys_debug.o: ../src/config/development/system/debug/src/sys_debug.c  .generated_files/flags/development/13efef7fbedc2de3625679a4b25123c3458ab844 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/794575281" 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/794575281/sys_debug.o.d" -o ${OBJECTDIR}/_ext/794575281/sys_debug.o ../src/config/development/system/debug/src/sys_debug.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/270921643/sys_int.o: ../src/config/development/system/int/src/sys_int.c  .generated_files/flags/development/aa7b0a0a062f45f88b4fe89203f4bef0dd990c4f .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/270921643" 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/270921643/sys_int.o.d" -o ${OBJECTDIR}/_ext/270921643/sys_int.o ../src/config/development/system/int/src/sys_int.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1504571547/sys_time.o: ../src/config/development/system/time/src/sys_time.c  .generated_files/flags/development/683ae93d4b4d9a6f1b9ecba3facd2adf8014802c .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1504571547" 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1504571547/sys_time.o.d" -o ${OBJECTDIR}/_ext/1504571547/sys_time.o ../src/config/development/system/time/src/sys_time.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device.o: ../src/config/development/usb/src/usb_device.c  .generated_files/flags/development/853c698ad246b645513591d86944193ec61e4b59 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device.o ../src/config/development/usb/src/usb_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o: ../src/config/development/usb/src/usb_device_cdc.c  .generated_files/flags/development/ea85b7873130ed305425ced72057561625198f48 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ../src/config/development/usb/src/usb_device_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o: ../src/config/development/usb/src/usb_device_cdc_acm.c  .generated_files/flags/development/7b69c411b7221a617ecdf186041a08d7bcdc15a4 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ../src/config/development/usb/src/usb_device_cdc_acm.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/initialization.o: ../src/config/development/initialization.c  .generated_files/flags/development/1116179f2068c996334194993c71788c4d780b86 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/initialization.o.d" -o ${OBJECTDIR}/_ext/1221570264/initialization.o ../src/config/development/initialization.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/interrupts.o: ../src/config/development/interrupts.c  .generated_files/flags/development/127416755338178d35a83b33e5061e171727dd50 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/interrupts.o.d" -o ${OBJECTDIR}/_ext/1221570264/interrupts.o ../src/config/development/interrupts.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/exceptions.o: ../src/config/development/exceptions.c  .generated_files/flags/development/728ac64a73ad2c3428dba9702c7400bd434cb118 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/exceptions.o.d" -o ${OBJECTDIR}/_ext/1221570264/exceptions.o ../src/config/development/exceptions.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o: ../src/config/development/usb_device_init_data.c  .generated_files/flags/development/1ec159aee88544aa378951509adf41e845228529 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d" -o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ../src/config/development/usb_device_init_data.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/tasks.o: ../src/config/development/tasks.c  .generated_files/flags/development/bf5c27584d26dafb5c802c891a50cae40439d066 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/tasks.o.d" -o ${OBJECTDIR}/_ext/1221570264/tasks.o ../src/config/development/tasks.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mb.o: ../src/modbus_src/mb.c  .generated_files/flags/development/713cf8465d1c144f4479cb0aff64d7e000fa6ace .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mb.o.d" -o ${OBJECTDIR}/_ext/1910538141/mb.o ../src/modbus_src/mb.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mbcrc.o: ../src/modbus_src/mbcrc.c  .generated_files/flags/development/10cebeba236ba19bb500ce5df2763391c9b24657 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mbcrc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mbcrc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mbcrc.o.d" -o ${OBJECTDIR}/_ext/1910538141/mbcrc.o ../src/modbus_src/mbcrc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mb_setup.o: ../src/modbus_src/mb_setup.c  .generated_files/flags/development/7ec768c165b9ad3c9185068dcad0b19c56d7cd8e .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mb_setup.o.d" -o ${OBJECTDIR}/_ext/1910538141/mb_setup.o ../src/modbus_src/mb_setup.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/RS485_HAL.o: ../src/modbus_src/RS485_HAL.c  .generated_files/flags/development/d903e319d6a77c18351c20b29c998749df00bf3c .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d" -o ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o ../src/modbus_src/RS485_HAL.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/fifo.o: ../src/modbus_src/fifo.c  .generated_files/flags/development/85c500b3c9372874d798a76d669dcad357210973 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/fifo.o.d" -o ${OBJECTDIR}/_ext/1910538141/fifo.o ../src/modbus_src/fifo.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/development/473e35bdead8fed0ead8d9e4c15871ec7636bfb3 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/development/f1c2d614d61969a0b3834ba6fae69a1c9f1bf52a .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/plib_nvm.o: ../src/plib_nvm.c  .generated_files/flags/development/e27b60ef543bf5a5d8e9306f5511836ac9274d92 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -I"../src/config/development/peripheral/nvm" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/plib_nvm.o.d" -o ${OBJECTDIR}/_ext/1360937237/plib_nvm.o ../src/plib_nvm.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
