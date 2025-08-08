import {
  router,
  ArcButton,
  ArcButtonOptions,
  ArcButtonPosition,
  ArcButtonStatus,
  ArcButtonStyleMode,
  ColorMetrics } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Sleep Cycle';
  bottomOptions: ArcButtonOptions = new ArcButtonOptions({})
  aboutToAppear() {
    this.bottomOptions = new ArcButtonOptions({
      label: 'Start',
      fontColor: ColorMetrics.resourceColor('#205375'),
      status: ArcButtonStatus.NORMAL,
      backgroundColor: ColorMetrics.resourceColor('#EFEFEF'),
      styleMode: ArcButtonStyleMode.CUSTOM,
      position: ArcButtonPosition.BOTTOM_EDGE,
      onClick: () => {
        router.pushUrl({ url: 'pages/SetAlarm' });
      }
    });
  }
  build() {
    Flex({justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center,
      direction: FlexDirection.Column}){
          Text(this.message)
            .fontSize(24)
            .fontWeight(FontWeight.Bold).margin({bottom:10 , top: 30})
          Image($r('app.media.sleep_cycle'))
            .width('32%')
          ArcButton({ options: this.bottomOptions }).margin({top: 40})
        }
    .width('100%')
    .height('100%')
    .backgroundColor('#112B3C')
  }
}