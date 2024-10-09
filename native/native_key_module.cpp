//
// Created on 2024/10/9.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#include "native_engine/native_engine.h"
#include "native_engine/native_value.h"
#include "gpio_if.h"
#include "iot_gpio.h"
#include "cmsis_os2.h"

// 全局引擎指针，用于与ArkTS交互
static NativeEngine* g_engine = nullptr;
static NativeValue* g_callback = nullptr;

void KeyPressHandler(int pin)
{
    if (pin == 5) {  // 检查按键GPIO引脚
        printf("Button pressed!\n");
        if (g_callback != nullptr) {
            // 触发ArkTS的回调函数
            g_engine->CallFunction(NativeEngine::GetCurrentContext(), g_callback, nullptr, 0);
        }
    }
}

extern "C" void InitKey(NativeEngine* engine, NativeValue* callback)
{
    g_engine = engine;
    g_callback = callback;

    IoTGpioInit(5);  // 初始化GPIO引脚
    IoTGpioSetDir(5, IOT_GPIO_DIR_IN); // 设置为输入模式

    // 注册按键中断服务函数
    IoTGpioRegisterIsrFunc(5, IOT_GPIO_EDGE_FALL_LEVEL_LOW, KeyPressHandler);
}
