##########################################################################################################################
# File automatically-generated by tool: [projectgenerator] version: [3.17.1] date: [Fri Oct 25 16:55:11 JST 2024] 
##########################################################################################################################

# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#	2017-02-10 - Several enhancements + project update mode
#   2015-07-22 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = app


######################################
# building variables
######################################
# debug build?

# optimization
OPT = -O2


#######################################
# paths
#######################################
# Build path
ifeq ($(DEBUG), 1)
BUILD_DIR = build-debug
else
BUILD_DIR = build
endif


######################################
# source
######################################
# C sources
C_SOURCES =  \
Src/main.c \
Src/stm32f3xx_it.c \
Src/stm32f3xx_hal_msp.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_rcc.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_rcc_ex.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_gpio.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_dma.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_cortex.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_pwr.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_pwr_ex.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_flash.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_flash_ex.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_i2c.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_i2c_ex.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_exti.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_dac.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_dac_ex.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_tim.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_tim_ex.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_uart.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_uart_ex.c \
Src/system_stm32f3xx.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_adc.c \
Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_adc_ex.c

# C++ Souces
CXX_SOURCES := $(wildcard Src/*.cpp)

# ASM sources
ASM_SOURCES =  \
startup_stm32f303x8.s


#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
CXX = $(GCC_PATH)/$(PREFIX)g++
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
CXX = $(PREFIX)g++
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m4

# fpu
FPU = -mfpu=fpv4-sp-d16

# float-abi
FLOAT-ABI = -mfloat-abi=hard 

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS = 

# C defines
C_DEFS =  \
-DUSE_HAL_DRIVER \
-DSTM32F303x8

# C++ defines
CXX_DEFS = $(C_DEFS)

# AS includes
AS_INCLUDES = 

# C includes
C_INCLUDES =  \
-IInc \
-IInc-shared \
-IDrivers/STM32F3xx_HAL_Driver/Inc \
-IDrivers/STM32F3xx_HAL_Driver/Inc/Legacy \
-IDrivers/CMSIS/Device/ST/STM32F3xx/Include \
-IDrivers/CMSIS/Include

CXX_INCLUDES = $(C_INCLUDES) -IInc-shared


# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections 

CXXFLAGS = $(MCU) $(CXX_DEFS) $(CXX_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections -std=c++11

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
CXXFLAGS += -g -gdwarf-2
endif


# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)" 
CXXFLAGS += -MMD -MP -MF"$(@:%.o=%.d)" 


#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = STM32F303K8Tx_FLASH.ld

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nosys.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))
# list of C++ objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(CXX_SOURCES:.cpp=.o)))
vpath %.cpp $(sort $(dir $(CXX_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/%.o: %.cpp Makefile | $(BUILD_DIR) 
	$(CXX) -c $(CXXFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.cpp=.lst)) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CXX) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)
  
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
