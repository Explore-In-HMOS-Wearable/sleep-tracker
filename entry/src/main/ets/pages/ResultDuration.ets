//this page shows onBedDuration and sleep duration
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
struct ResultDuration {
  bottomOptions: ArcButtonOptions = new ArcButtonOptions({})
  aboutToAppear() {
    this.bottomOptions = new ArcButtonOptions({
      label: 'Next Step',
      fontColor: ColorMetrics.resourceColor('#205375'),
      status: ArcButtonStatus.NORMAL,
      backgroundColor: ColorMetrics.resourceColor('#EFEFEF'),
      styleMode: ArcButtonStyleMode.CUSTOM,
      position: ArcButtonPosition.BOTTOM_EDGE,
      onClick: () => {
        router.pushUrl({ url: 'pages/ResultWakeCount' });
      }
    });
  }
  build() {
    Flex({justifyContent: FlexAlign.Center, alignContent: FlexAlign.Center}){
      Row(){
        Column(){
          Text("In Bed: 7 hours").margin({bottom: 5, top: 34})
            Progress({ value: 7, total: 24, type: ProgressType.Capsule }).width('75%').color(Color.Orange)
              .style({
                borderColor: Color.Orange,
                borderWidth: 1,
                content: 'In Bed',
                font: { size: 13, style: FontStyle.Normal, weight: FontWeight.Bold },
                fontColor: '#fff',
                enableScanEffect: false,
                showDefaultPercentage: true,
                enableSmoothEffect: true,
              })
              .privacySensitive(true)
            Progress({ value: 6.5, total: 24, type: ProgressType.Capsule }).width('75%').color(Color.Orange).margin({top: 10})
              .style({
                borderColor: Color.Orange,
                borderWidth: 1,
                content: 'In Sleep',
                font: { size: 13, style: FontStyle.Normal, weight: FontWeight.Bold },
                fontColor: '#fff',
                enableScanEffect: false,
                showDefaultPercentage: true,
                enableSmoothEffect: true,
              })
              .privacySensitive(true)
            Text("In Sleep: 6.5 hours").margin({top: 5, bottom: 30})
            ArcButton({ options: this.bottomOptions })
          }
        .width('100%')
      }
      .height('100%')
    }
    .backgroundColor('#112B3C')
  }
}