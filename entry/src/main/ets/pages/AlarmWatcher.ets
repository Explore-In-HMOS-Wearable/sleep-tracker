import {
  ArcButton,
  ArcButtonOptions,
  ArcButtonPosition,
  ArcButtonStatus,
  ArcButtonStyleMode,
  ColorMetrics,
  router
} from '@kit.ArkUI';
import { AlarmService } from '../service/AlarmService'
import { vibrator } from '@kit.SensorServiceKit'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct AlarmWatcher {
  bottomOptions: ArcButtonOptions = new ArcButtonOptions({})
  @State alarmTime: string = 'Loading...'
  @State currentTime: string = ''
  private intervalId: number = -1

  aboutToAppear() {
    this.bottomOptions = new ArcButtonOptions({
      label: 'Stop',
      fontColor: ColorMetrics.resourceColor('#205375'),
      status: ArcButtonStatus.NORMAL,
      backgroundColor: ColorMetrics.resourceColor('#EFEFEF'),
      styleMode: ArcButtonStyleMode.CUSTOM,
      position: ArcButtonPosition.BOTTOM_EDGE,
      onClick: () => {
        AlarmService.clearAlarm()
        clearInterval(this.intervalId)
        this.stopVibrate()
        router.pushUrl({ url: 'pages/SleepEfficiency' });
      }
    });

    const alarm = AlarmService.getAlarm();
    if (alarm) {
      this.alarmTime = AlarmService.formatToAMPM(alarm);
    } else {
      this.alarmTime = 'Alarm not set';
    }

    this.intervalId = setInterval(() => {
      const now = new Date();
      this.currentTime = AlarmService.formatToAMPM(now);

      const alarm = AlarmService.getAlarm();
      if (alarm && now >= alarm) {
        console.info('[AlarmWatcher] Alarm triggered!');
        this.startVibrate();
        AlarmService.clearAlarm();
        clearInterval(this.intervalId);
      }
    }, 1000);
  }

  aboutToDisappear() {
    clearInterval(this.intervalId);
    this.stopVibrate();
  }

  startVibrate() {
    try {
      vibrator.startVibration(
        {
          type: 'time',
          duration: 10000
        },
        {
          id: 0,
          usage: 'alarm'
        },
        (error: BusinessError) => {
          if (error) {
            console.error(`Failed to start vibration. Code: ${error.code}, message: ${error.message}`);
            return;
          }
          console.info('Succeed in starting vibration');
        }
      );
    } catch (err) {
      let e: BusinessError = err as BusinessError;
      console.error(`Unexpected error. Code: ${e.code}, message: ${e.message}`);
    }
  }

  stopVibrate() {
    try {
      vibrator.stopVibration(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_TIME, (error: BusinessError) => {
        if (error) {
          console.error(`Failed to stop vibration. Code: ${error.code}, message: ${error.message}`);
        } else {
          console.info('Vibration stopped successfully');
        }
      });
    } catch (err) {
      let e: BusinessError = err as BusinessError;
      console.error(`Unexpected stop error. Code: ${e.code}, message: ${e.message}`);
    }
  }

  build() {
    Flex({
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center
    }) {
      Row() {
        Column() {
          Image($r('app.media.sleeping'))
            .width('48%')
            .backgroundColor('#205375')
            .padding(5)
            .borderRadius(100)
            .margin({ top: 15 })

          Row() {
            Image($r("app.media.alarm_icon")).width('11%')
            Text(`Alarm set: ${this.alarmTime}`)
              .fontColor('#ffffff')
              .fontSize(16)
          }
          .backgroundColor('#205375')
          .margin({ top: 10, bottom: 8 })
          .padding(5)
          .borderRadius(90)

          ArcButton({ options: this.bottomOptions })
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#112B3C')
  }
}