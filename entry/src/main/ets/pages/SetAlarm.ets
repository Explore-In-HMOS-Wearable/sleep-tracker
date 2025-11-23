import {
  ArcButton,
  ArcButtonOptions,
  ArcButtonPosition,
  ArcButtonStatus,
  ArcButtonStyleMode,
  ColorMetrics,
} from '@kit.ArkUI';
import { AlarmService } from '../service/AlarmService'

@Component
export struct SetAlarm {
  bottomOptions: ArcButtonOptions = new ArcButtonOptions({})
  @State today: number = new Date().getDate()
  @State month: number = new Date().getMonth()
  @State year: number = new Date().getFullYear()
  @State selectedTime: Date = new Date()
  @Consume('NavPathStack') pageStack: NavPathStack;

  aboutToAppear() {
    const day = String(this.today).padStart(2, '0');
    const month = String(this.month + 1).padStart(2, '0');
    const formatted = `${this.year}-${month}-${day}T08:00:00`;
    this.selectedTime = new Date(formatted);

    this.bottomOptions = new ArcButtonOptions({
      label: 'Set Alarm',
      fontColor: ColorMetrics.resourceColor('#205375'),
      status: ArcButtonStatus.NORMAL,
      backgroundColor: ColorMetrics.resourceColor('#EFEFEF'),
      styleMode: ArcButtonStyleMode.CUSTOM,
      position: ArcButtonPosition.BOTTOM_EDGE,
      onClick: () => {
        AlarmService.setAlarm(this.selectedTime);
        this.pageStack.pushPathByName('AlarmWatcher', null);
      }
    });
  }

  build() {
    NavDestination(){
      Flex({
        justifyContent: FlexAlign.Center,
        direction: FlexDirection.Column,
        alignItems: ItemAlign.Center
      }) {
        TimePicker({
          selected: this.selectedTime
        })
          .disappearTextStyle({ color: '#004aaf', font: { size: 18, weight: FontWeight.Lighter } })
          .textStyle({ color: Color.White, font: { size: 18, weight: FontWeight.Normal } })
          .selectedTextStyle({ color: '#EFEFEF', font: { size: 20, weight: FontWeight.Bolder } })
          .backgroundColor('#112B3C')
          .onChange((value: TimePickerResult) => {
            if (value.hour >= 0) {
              this.selectedTime.setHours(value.hour, value.minute)
            }
          })
        ArcButton({ options: this.bottomOptions })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#112B3C')
    }
    .hideTitleBar(true)
    .hideBackButton(true)
  }
}
