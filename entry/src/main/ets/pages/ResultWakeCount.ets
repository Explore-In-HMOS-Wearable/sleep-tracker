//this page shows people's wake count
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
struct ResultWakeCount {
  private count: number = 4
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
        router.pushUrl({url: 'pages/ResultRem'});
      }
    });
  }
    build() {
    Flex({justifyContent: FlexAlign.Center,
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center}){
      Text(`Times woke up: ${this.count} times`).fontSize(15).fontColor(0xCCCCCC)
        .fontWeight(FontWeight.Bold).margin({top: 65})
      if (this.count <= 1){
        Progress({ value: 1, total:4, type: ProgressType.Linear })
          .width('75%').color(Color.Yellow).margin({top: 5, bottom: 10})
        Text('This indicates uninterrupted and high quality sleep.').fontSize(13)
          .backgroundColor(Color.Yellow).fontWeight(FontWeight.Bold)
          .padding(5).borderRadius(50).fontColor('#205375').width('90%')
      }
      if (this.count > 1 && this.count <=3){
        Progress({ value: 2, total:4, type: ProgressType.Linear })
          .width('75%').color('#FF7601').margin({top: 5, bottom: 10})
        Text('This is considered normal from time to time.').fontSize(13)
          .backgroundColor('#FF7601').fontWeight(FontWeight.Bold)
          .padding(5).borderRadius(50).width('90%')
      }
      if (this.count >= 4){
        Progress({ value: 4, total:4, type: ProgressType.Linear })
          .width('75%').color(Color.Red).margin({top: 5, bottom: 10})
        Text('This may indicate fragmented and non restorative sleep.').fontSize(13)
          .backgroundColor(Color.Red).fontWeight(FontWeight.Bold)
          .padding(5).borderRadius(50).width('90%')
      }
      ArcButton({ options: this.bottomOptions }).margin({top: 40})
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#112B3C')
  }
}