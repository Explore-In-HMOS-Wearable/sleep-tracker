import {
  ArcButton,
  ArcButtonOptions,
  ArcButtonPosition,
  ArcButtonStatus,
  ArcButtonStyleMode,
  ColorMetrics,
  router
} from '@kit.ArkUI';
@Entry
@Component
struct SleepEfficiency {
  bottomOptions: ArcButtonOptions = new ArcButtonOptions({})
  private gradientColor: LinearGradient = new LinearGradient([{ color: Color.Yellow, offset: 0.5 },
    { color: Color.Orange, offset: 1.0 }])
  aboutToAppear() {
    this.bottomOptions = new ArcButtonOptions({
      label: 'Next',
      fontColor: ColorMetrics.resourceColor('#205375'),
      status: ArcButtonStatus.NORMAL,
      backgroundColor: ColorMetrics.resourceColor('#EFEFEF'),
      styleMode: ArcButtonStyleMode.CUSTOM,
      position: ArcButtonPosition.BOTTOM_EDGE,
      onClick: () => {
        router.pushUrl({ url: 'pages/ResultDuration' });
      }
    });
  }
  build() {
    Flex({justifyContent: FlexAlign.Center}){
      Row(){
        Column(){
          Stack() {
            Progress({ value: 58, total: 100, type: ProgressType.Ring })
              .width(180)
              .height(180)
              .color(Color.Orange)
              .style({ strokeWidth: 15, shadow: true, enableScanEffect: true })

            Text('Sleep Efficiency:\n 58%')
              .fontColor('#FFFFFF')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
          }
          ArcButton({ options: this.bottomOptions })
        }
      }
      .height('100%')
    }
    .width('100%')
    .backgroundColor('#112B3C')
  }
}