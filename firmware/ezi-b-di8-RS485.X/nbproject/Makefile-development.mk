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
SOURCEFILES_QUOTED_IF_SPACED=../src/config/development/driver/usb/usbfs/src/drv_usbfs.c ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c ../src/config/development/peripheral/clk/plib_clk.c ../src/config/development/peripheral/coretimer/plib_coretimer.c ../src/config/development/peripheral/evic/plib_evic.c ../src/config/development/peripheral/gpio/plib_gpio.c ../src/config/development/peripheral/i2c/plib_i2c1.c ../src/config/development/peripheral/tmr/plib_tmr2.c ../src/config/development/peripheral/uart/plib_uart3.c ../src/config/development/peripheral/uart/plib_uart4.c ../src/config/development/peripheral/uart/plib_uart1.c ../src/config/development/peripheral/uart/plib_uart2.c ../src/config/development/stdio/xc32_monitor.c ../src/config/development/system/console/src/sys_console.c ../src/config/development/system/console/src/sys_console_usb_cdc.c ../src/config/development/system/debug/src/sys_debug.c ../src/config/development/system/int/src/sys_int.c ../src/config/development/system/time/src/sys_time.c ../src/config/development/usb/src/usb_device.c ../src/config/development/usb/src/usb_device_cdc.c ../src/config/development/usb/src/usb_device_cdc_acm.c ../src/config/development/initialization.c ../src/config/development/interrupts.c ../src/config/development/exceptions.c ../src/config/development/usb_device_init_data.c ../src/config/development/tasks.c ../src/modbus_src/mb.c ../src/modbus_src/mbcrc.c ../src/modbus_src/mb_setup.c ../src/modbus_src/RS485_HAL.c ../src/modbus_src/fifo.c ../src/main.c ../src/app.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ${OBJECTDIR}/_ext/823310505/plib_evic.o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ${OBJECTDIR}/_ext/1585446291/sys_console.o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ${OBJECTDIR}/_ext/794575281/sys_debug.o ${OBJECTDIR}/_ext/270921643/sys_int.o ${OBJECTDIR}/_ext/1504571547/sys_time.o ${OBJECTDIR}/_ext/1649042674/usb_device.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ${OBJECTDIR}/_ext/1221570264/initialization.o ${OBJECTDIR}/_ext/1221570264/interrupts.o ${OBJECTDIR}/_ext/1221570264/exceptions.o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ${OBJECTDIR}/_ext/1221570264/tasks.o ${OBJECTDIR}/_ext/1910538141/mb.o ${OBJECTDIR}/_ext/1910538141/mbcrc.o ${OBJECTDIR}/_ext/1910538141/mb_setup.o ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o ${OBJECTDIR}/_ext/1910538141/fifo.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d ${OBJECTDIR}/_ext/1550581290/plib_clk.o.d ${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d ${OBJECTDIR}/_ext/823310505/plib_evic.o.d ${OBJECTDIR}/_ext/823256677/plib_gpio.o.d ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d ${OBJECTDIR}/_ext/822853734/plib_uart3.o.d ${OBJECTDIR}/_ext/822853734/plib_uart4.o.d ${OBJECTDIR}/_ext/822853734/plib_uart1.o.d ${OBJECTDIR}/_ext/822853734/plib_uart2.o.d ${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d ${OBJECTDIR}/_ext/1585446291/sys_console.o.d ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d ${OBJECTDIR}/_ext/794575281/sys_debug.o.d ${OBJECTDIR}/_ext/270921643/sys_int.o.d ${OBJECTDIR}/_ext/1504571547/sys_time.o.d ${OBJECTDIR}/_ext/1649042674/usb_device.o.d ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d ${OBJECTDIR}/_ext/1221570264/initialization.o.d ${OBJECTDIR}/_ext/1221570264/interrupts.o.d ${OBJECTDIR}/_ext/1221570264/exceptions.o.d ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d ${OBJECTDIR}/_ext/1221570264/tasks.o.d ${OBJECTDIR}/_ext/1910538141/mb.o.d ${OBJECTDIR}/_ext/1910538141/mbcrc.o.d ${OBJECTDIR}/_ext/1910538141/mb_setup.o.d ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d ${OBJECTDIR}/_ext/1910538141/fifo.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ${OBJECTDIR}/_ext/823310505/plib_evic.o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ${OBJECTDIR}/_ext/1585446291/sys_console.o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ${OBJECTDIR}/_ext/794575281/sys_debug.o ${OBJECTDIR}/_ext/270921643/sys_int.o ${OBJECTDIR}/_ext/1504571547/sys_time.o ${OBJECTDIR}/_ext/1649042674/usb_device.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ${OBJECTDIR}/_ext/1221570264/initialization.o ${OBJECTDIR}/_ext/1221570264/interrupts.o ${OBJECTDIR}/_ext/1221570264/exceptions.o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ${OBJECTDIR}/_ext/1221570264/tasks.o ${OBJECTDIR}/_ext/1910538141/mb.o ${OBJECTDIR}/_ext/1910538141/mbcrc.o ${OBJECTDIR}/_ext/1910538141/mb_setup.o ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o ${OBJECTDIR}/_ext/1910538141/fifo.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o

# Source Files
SOURCEFILES=../src/config/development/driver/usb/usbfs/src/drv_usbfs.c ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c ../src/config/development/peripheral/clk/plib_clk.c ../src/config/development/peripheral/coretimer/plib_coretimer.c ../src/config/development/peripheral/evic/plib_evic.c ../src/config/development/peripheral/gpio/plib_gpio.c ../src/config/development/peripheral/i2c/plib_i2c1.c ../src/config/development/peripheral/tmr/plib_tmr2.c ../src/config/development/peripheral/uart/plib_uart3.c ../src/config/development/peripheral/uart/plib_uart4.c ../src/config/development/peripheral/uart/plib_uart1.c ../src/config/development/peripheral/uart/plib_uart2.c ../src/config/development/stdio/xc32_monitor.c ../src/config/development/system/console/src/sys_console.c ../src/config/development/system/console/src/sys_console_usb_cdc.c ../src/config/development/system/debug/src/sys_debug.c ../src/config/development/system/int/src/sys_int.c ../src/config/development/system/time/src/sys_time.c ../src/config/development/usb/src/usb_device.c ../src/config/development/usb/src/usb_device_cdc.c ../src/config/development/usb/src/usb_device_cdc_acm.c ../src/config/development/initialization.c ../src/config/development/interrupts.c ../src/config/development/exceptions.c ../src/config/development/usb_device_init_data.c ../src/config/development/tasks.c ../src/modbus_src/mb.c ../src/modbus_src/mbcrc.c ../src/modbus_src/mb_setup.c ../src/modbus_src/RS485_HAL.c ../src/modbus_src/fifo.c ../src/main.c ../src/app.c



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
${OBJECTDIR}/_ext/1456194107/drv_usbfs.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/development/cbe6b80d0cc984908f482957473d8b95c7d3d9b .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/development/f6009ca2a936c78094c801450048656e9de94f05 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550581290/plib_clk.o: ../src/config/development/peripheral/clk/plib_clk.c  .generated_files/flags/development/728eaed3c031e53105a16d46d7c9161f386cded7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550581290" 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550581290/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ../src/config/development/peripheral/clk/plib_clk.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/539061434/plib_coretimer.o: ../src/config/development/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/development/296c185553b42b7378481d5ca1a4bacc7594cbaf .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/539061434" 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ../src/config/development/peripheral/coretimer/plib_coretimer.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823310505/plib_evic.o: ../src/config/development/peripheral/evic/plib_evic.c  .generated_files/flags/development/db096d08d0381cc8177637da39863b67a8940cb8 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823310505" 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823310505/plib_evic.o.d" -o ${OBJECTDIR}/_ext/823310505/plib_evic.o ../src/config/development/peripheral/evic/plib_evic.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823256677/plib_gpio.o: ../src/config/development/peripheral/gpio/plib_gpio.c  .generated_files/flags/development/bef8c1dc7ebf7124ee3c1ae7c5cbd3a508bae4c3 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823256677" 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823256677/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ../src/config/development/peripheral/gpio/plib_gpio.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550577330/plib_i2c1.o: ../src/config/development/peripheral/i2c/plib_i2c1.c  .generated_files/flags/development/282cc0cdb68b1ad1a0e99046aed67a9b09f7b17f .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550577330" 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d" -o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ../src/config/development/peripheral/i2c/plib_i2c1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550564915/plib_tmr2.o: ../src/config/development/peripheral/tmr/plib_tmr2.c  .generated_files/flags/development/42e84994b17c285152b5aaf5fd9283c1983d2367 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550564915" 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ../src/config/development/peripheral/tmr/plib_tmr2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart3.o: ../src/config/development/peripheral/uart/plib_uart3.c  .generated_files/flags/development/c8923fe706cf8e2cb28b0878542353502c8f0c7a .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart3.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ../src/config/development/peripheral/uart/plib_uart3.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart4.o: ../src/config/development/peripheral/uart/plib_uart4.c  .generated_files/flags/development/c80b07282530c6c26975bf7e523d2a63ba6b465d .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart4.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ../src/config/development/peripheral/uart/plib_uart4.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart1.o: ../src/config/development/peripheral/uart/plib_uart1.c  .generated_files/flags/development/1de8e60fd3efdbe4dc330533d34a6d27a102efe7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ../src/config/development/peripheral/uart/plib_uart1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart2.o: ../src/config/development/peripheral/uart/plib_uart2.c  .generated_files/flags/development/6cbfa9df6a25ed0c8a063ac7e08082db16f9e456 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ../src/config/development/peripheral/uart/plib_uart2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/111634146/xc32_monitor.o: ../src/config/development/stdio/xc32_monitor.c  .generated_files/flags/development/36612ba5b3f2750e6b68a967cdddca39ff83cdb6 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/111634146" 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ../src/config/development/stdio/xc32_monitor.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console.o: ../src/config/development/system/console/src/sys_console.c  .generated_files/flags/development/c78532bce7a36d9e6c5a4b9d0bffcc6d32157ebe .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console.o ../src/config/development/system/console/src/sys_console.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o: ../src/config/development/system/console/src/sys_console_usb_cdc.c  .generated_files/flags/development/60366b4f7c6289dc07d64cd8b73b6dbd286e4bc7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ../src/config/development/system/console/src/sys_console_usb_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/794575281/sys_debug.o: ../src/config/development/system/debug/src/sys_debug.c  .generated_files/flags/development/da35a890536b6f49c036b95902ba632a24ecfad4 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/794575281" 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/794575281/sys_debug.o.d" -o ${OBJECTDIR}/_ext/794575281/sys_debug.o ../src/config/development/system/debug/src/sys_debug.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/270921643/sys_int.o: ../src/config/development/system/int/src/sys_int.c  .generated_files/flags/development/5ae945a15e023e33554a3c4343694d78fff3f228 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/270921643" 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/270921643/sys_int.o.d" -o ${OBJECTDIR}/_ext/270921643/sys_int.o ../src/config/development/system/int/src/sys_int.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1504571547/sys_time.o: ../src/config/development/system/time/src/sys_time.c  .generated_files/flags/development/5ea8d2756315f94d1f5dc26f3e8488437f15f7c5 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1504571547" 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1504571547/sys_time.o.d" -o ${OBJECTDIR}/_ext/1504571547/sys_time.o ../src/config/development/system/time/src/sys_time.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device.o: ../src/config/development/usb/src/usb_device.c  .generated_files/flags/development/5a35f9e8a953e8d2c882bb065ca2fca79e4ef58b .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device.o ../src/config/development/usb/src/usb_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o: ../src/config/development/usb/src/usb_device_cdc.c  .generated_files/flags/development/b7cdc72b551bf99cf5c9caad380ed72c55b56f9a .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ../src/config/development/usb/src/usb_device_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o: ../src/config/development/usb/src/usb_device_cdc_acm.c  .generated_files/flags/development/7309921a488f3beea2b80b40a3be78fdb705e3d7 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ../src/config/development/usb/src/usb_device_cdc_acm.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/initialization.o: ../src/config/development/initialization.c  .generated_files/flags/development/a469cf8940ac0d5688c1377cbeef7f813118553f .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/initialization.o.d" -o ${OBJECTDIR}/_ext/1221570264/initialization.o ../src/config/development/initialization.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/interrupts.o: ../src/config/development/interrupts.c  .generated_files/flags/development/f5e6a3e356da2676107fd68dd424a1ef4f193178 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/interrupts.o.d" -o ${OBJECTDIR}/_ext/1221570264/interrupts.o ../src/config/development/interrupts.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/exceptions.o: ../src/config/development/exceptions.c  .generated_files/flags/development/52a0e7a649d1728de827738900889e176f18110b .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/exceptions.o.d" -o ${OBJECTDIR}/_ext/1221570264/exceptions.o ../src/config/development/exceptions.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o: ../src/config/development/usb_device_init_data.c  .generated_files/flags/development/e331953a4ae15aecf35937d828a0833af56b8a49 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d" -o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ../src/config/development/usb_device_init_data.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/tasks.o: ../src/config/development/tasks.c  .generated_files/flags/development/ddd80417224008f5a21d5dae27f783b9eba07c0b .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/tasks.o.d" -o ${OBJECTDIR}/_ext/1221570264/tasks.o ../src/config/development/tasks.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mb.o: ../src/modbus_src/mb.c  .generated_files/flags/development/c27a41ece9cf6fb0f366e175ba805347c010d5ca .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mb.o.d" -o ${OBJECTDIR}/_ext/1910538141/mb.o ../src/modbus_src/mb.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mbcrc.o: ../src/modbus_src/mbcrc.c  .generated_files/flags/development/26f18e69ac495505e6170e777749dff60da841ba .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mbcrc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mbcrc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mbcrc.o.d" -o ${OBJECTDIR}/_ext/1910538141/mbcrc.o ../src/modbus_src/mbcrc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mb_setup.o: ../src/modbus_src/mb_setup.c  .generated_files/flags/development/32ec1341a1a9344473b01ee38641972ffc36dbc6 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mb_setup.o.d" -o ${OBJECTDIR}/_ext/1910538141/mb_setup.o ../src/modbus_src/mb_setup.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/RS485_HAL.o: ../src/modbus_src/RS485_HAL.c  .generated_files/flags/development/8c93e959be5037495a8ef5d8eb7634d06250d434 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d" -o ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o ../src/modbus_src/RS485_HAL.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/fifo.o: ../src/modbus_src/fifo.c  .generated_files/flags/development/812bb4d076933197dfc02fdfd75feee81aaaa25 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/fifo.o.d" -o ${OBJECTDIR}/_ext/1910538141/fifo.o ../src/modbus_src/fifo.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/development/c3b16e05d0667903ab24f02592f978c9de3aba57 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/development/bc1c28995fd40e3bd3e422b51351c021fa7dc808 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1456194107/drv_usbfs.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/development/9181ba30970b681c6794b503c8774ac9070c2971 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o: ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/development/7ef90ce3a9828dab756fc7456272d52f0070b34c .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1456194107" 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o.d" -o ${OBJECTDIR}/_ext/1456194107/drv_usbfs_device.o ../src/config/development/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550581290/plib_clk.o: ../src/config/development/peripheral/clk/plib_clk.c  .generated_files/flags/development/dcf339828d68d63e76dbf9ea995fe03529dc610e .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550581290" 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550581290/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550581290/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1550581290/plib_clk.o ../src/config/development/peripheral/clk/plib_clk.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/539061434/plib_coretimer.o: ../src/config/development/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/development/8312fc62b4751d07a255c0549ab8419d472fad27 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/539061434" 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/539061434/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/539061434/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/539061434/plib_coretimer.o ../src/config/development/peripheral/coretimer/plib_coretimer.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823310505/plib_evic.o: ../src/config/development/peripheral/evic/plib_evic.c  .generated_files/flags/development/edd706f620285e3e7c1c21d171352aae0efaae69 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823310505" 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/823310505/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823310505/plib_evic.o.d" -o ${OBJECTDIR}/_ext/823310505/plib_evic.o ../src/config/development/peripheral/evic/plib_evic.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/823256677/plib_gpio.o: ../src/config/development/peripheral/gpio/plib_gpio.c  .generated_files/flags/development/38384eeb28e26f446eeee19fdcc6b8f7ac60c092 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/823256677" 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/823256677/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/823256677/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/823256677/plib_gpio.o ../src/config/development/peripheral/gpio/plib_gpio.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550577330/plib_i2c1.o: ../src/config/development/peripheral/i2c/plib_i2c1.c  .generated_files/flags/development/7f489e382370cb26e86f96f1d43fb862f8dcc70f .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550577330" 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550577330/plib_i2c1.o.d" -o ${OBJECTDIR}/_ext/1550577330/plib_i2c1.o ../src/config/development/peripheral/i2c/plib_i2c1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1550564915/plib_tmr2.o: ../src/config/development/peripheral/tmr/plib_tmr2.c  .generated_files/flags/development/f33b03a2b1fede34d28a46bb76e9f01938c35adb .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1550564915" 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550564915/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/1550564915/plib_tmr2.o ../src/config/development/peripheral/tmr/plib_tmr2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart3.o: ../src/config/development/peripheral/uart/plib_uart3.c  .generated_files/flags/development/be31272cae9618cb7aa573cfb5da68a2fde8bbf3 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart3.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart3.o ../src/config/development/peripheral/uart/plib_uart3.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart4.o: ../src/config/development/peripheral/uart/plib_uart4.c  .generated_files/flags/development/7c3daa8fcf4335b73544103f601d40768e3b0d82 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart4.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart4.o ../src/config/development/peripheral/uart/plib_uart4.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart1.o: ../src/config/development/peripheral/uart/plib_uart1.c  .generated_files/flags/development/64b0de8cfc01795c44a5cba6427e054f862085ca .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart1.o ../src/config/development/peripheral/uart/plib_uart1.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822853734/plib_uart2.o: ../src/config/development/peripheral/uart/plib_uart2.c  .generated_files/flags/development/95d6acd967fc3f3b9f2c2527207380b468fef84f .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/822853734" 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/822853734/plib_uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822853734/plib_uart2.o.d" -o ${OBJECTDIR}/_ext/822853734/plib_uart2.o ../src/config/development/peripheral/uart/plib_uart2.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/111634146/xc32_monitor.o: ../src/config/development/stdio/xc32_monitor.c  .generated_files/flags/development/ce8805a97995a9c6872e0b9965ea79b11c97bc5a .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/111634146" 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/111634146/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/111634146/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/111634146/xc32_monitor.o ../src/config/development/stdio/xc32_monitor.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console.o: ../src/config/development/system/console/src/sys_console.c  .generated_files/flags/development/84f49d285ab463d322c9ec083344e75413810639 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console.o ../src/config/development/system/console/src/sys_console.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o: ../src/config/development/system/console/src/sys_console_usb_cdc.c  .generated_files/flags/development/2e434fc8bd6272f1ecca4b1f8032bf2eb18e2f93 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1585446291" 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o.d" -o ${OBJECTDIR}/_ext/1585446291/sys_console_usb_cdc.o ../src/config/development/system/console/src/sys_console_usb_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/794575281/sys_debug.o: ../src/config/development/system/debug/src/sys_debug.c  .generated_files/flags/development/d756bbe21e3b8d83b7cd9c7b287b5ece61924e09 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/794575281" 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/794575281/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/794575281/sys_debug.o.d" -o ${OBJECTDIR}/_ext/794575281/sys_debug.o ../src/config/development/system/debug/src/sys_debug.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/270921643/sys_int.o: ../src/config/development/system/int/src/sys_int.c  .generated_files/flags/development/63a93749ecd4984e61017901571983c8d85e4d16 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/270921643" 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/270921643/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/270921643/sys_int.o.d" -o ${OBJECTDIR}/_ext/270921643/sys_int.o ../src/config/development/system/int/src/sys_int.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1504571547/sys_time.o: ../src/config/development/system/time/src/sys_time.c  .generated_files/flags/development/f3b5c0ae2d2e557d5884ea971398345685a5c239 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1504571547" 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1504571547/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1504571547/sys_time.o.d" -o ${OBJECTDIR}/_ext/1504571547/sys_time.o ../src/config/development/system/time/src/sys_time.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device.o: ../src/config/development/usb/src/usb_device.c  .generated_files/flags/development/6b556afab965b81021e0681d0cc1f291a226482b .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device.o ../src/config/development/usb/src/usb_device.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o: ../src/config/development/usb/src/usb_device_cdc.c  .generated_files/flags/development/8dea61c283bc52dbee09576e61f2da233cfa0b49 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc.o ../src/config/development/usb/src/usb_device_cdc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o: ../src/config/development/usb/src/usb_device_cdc_acm.c  .generated_files/flags/development/f88df92986d93a05d5c102bc8a271fb1dc857c80 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1649042674" 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o.d" -o ${OBJECTDIR}/_ext/1649042674/usb_device_cdc_acm.o ../src/config/development/usb/src/usb_device_cdc_acm.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/initialization.o: ../src/config/development/initialization.c  .generated_files/flags/development/420c27a734a5631406579d41b30876f4b4b91ab3 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/initialization.o.d" -o ${OBJECTDIR}/_ext/1221570264/initialization.o ../src/config/development/initialization.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/interrupts.o: ../src/config/development/interrupts.c  .generated_files/flags/development/6069c30d1059bf9e35fbbfab2ebcf5e26e81dd8d .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/interrupts.o.d" -o ${OBJECTDIR}/_ext/1221570264/interrupts.o ../src/config/development/interrupts.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/exceptions.o: ../src/config/development/exceptions.c  .generated_files/flags/development/3b2c10f55d3e76a6093b87f9521aa663d269c3a2 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/exceptions.o.d" -o ${OBJECTDIR}/_ext/1221570264/exceptions.o ../src/config/development/exceptions.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o: ../src/config/development/usb_device_init_data.c  .generated_files/flags/development/1ac7cf3c1d67ff6d733c8f4f2aaa99a94631097c .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o.d" -o ${OBJECTDIR}/_ext/1221570264/usb_device_init_data.o ../src/config/development/usb_device_init_data.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1221570264/tasks.o: ../src/config/development/tasks.c  .generated_files/flags/development/967bf52f7075d0744bfbb84ab93bbbef9c30f5aa .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1221570264" 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1221570264/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1221570264/tasks.o.d" -o ${OBJECTDIR}/_ext/1221570264/tasks.o ../src/config/development/tasks.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mb.o: ../src/modbus_src/mb.c  .generated_files/flags/development/2cb2b10be1cf68dd124e223db95f5e228e586e84 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mb.o.d" -o ${OBJECTDIR}/_ext/1910538141/mb.o ../src/modbus_src/mb.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mbcrc.o: ../src/modbus_src/mbcrc.c  .generated_files/flags/development/e4276056bfda2557390edf0598ac7c26221af171 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mbcrc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mbcrc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mbcrc.o.d" -o ${OBJECTDIR}/_ext/1910538141/mbcrc.o ../src/modbus_src/mbcrc.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/mb_setup.o: ../src/modbus_src/mb_setup.c  .generated_files/flags/development/ee1ca88ff12870385218e145409d4353c87549e6 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/mb_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/mb_setup.o.d" -o ${OBJECTDIR}/_ext/1910538141/mb_setup.o ../src/modbus_src/mb_setup.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/RS485_HAL.o: ../src/modbus_src/RS485_HAL.c  .generated_files/flags/development/596e546e3f3fff225438aefaecac2e4fdd525db1 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/RS485_HAL.o.d" -o ${OBJECTDIR}/_ext/1910538141/RS485_HAL.o ../src/modbus_src/RS485_HAL.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1910538141/fifo.o: ../src/modbus_src/fifo.c  .generated_files/flags/development/27b202653299d5968a348ead4b03a46a4a7dce98 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1910538141" 
	@${RM} ${OBJECTDIR}/_ext/1910538141/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1910538141/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1910538141/fifo.o.d" -o ${OBJECTDIR}/_ext/1910538141/fifo.o ../src/modbus_src/fifo.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/development/1a6bb536522f6229aa5bdee2cb26de73749d954a .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/development/34232ba5e2e6b1960d4d2b752f67276b79a4fd84 .generated_files/flags/development/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/development" -I"../src/packs/PIC32MX250F256H_DFP" -I"../src/modbus_inc" -I"../src/modbus_src" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_development=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
