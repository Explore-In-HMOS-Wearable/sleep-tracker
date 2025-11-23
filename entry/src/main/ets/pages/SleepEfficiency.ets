import {
  ArcButton,
  ArcButtonOptions,
  ArcButtonPosition,
  ArcButtonStatus,
  ArcButtonStyleMode,
  ColorMetrics,
} from '@kit.ArkUI';

@Component
export struct SleepEfficiency {
  @Consume('NavPathStack') pageStack: NavPathStack;

  bottomOptions: ArcButtonOptions = new ArcButtonOptions({})
  aboutToAppear() {
    this.bottomOptions = new ArcButtonOptions({
      label: 'Next',
      fontColor: ColorMetrics.resourceColor('#205375'),
      status: ArcButtonStatus.NORMAL,
      backgroundColor: ColorMetrics.resourceColor('#EFEFEF'),
      styleMode: ArcButtonStyleMode.CUSTOM,
      position: ArcButtonPosition.BOTTOM_EDGE,
      onClick: () => {
        this.pageStack.pushPathByName('ResultDuration', null);
      }
    });
  }
  build() {
    NavDestination(){
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
    .hideTitleBar(true)
    .hideBackButton(true)
  }
}