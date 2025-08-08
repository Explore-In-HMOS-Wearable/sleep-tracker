import {
  ArcButton,
  ArcButtonOptions,
  ArcButtonPosition,
  ArcButtonStatus,
  ArcButtonStyleMode,
  ColorMetrics,
  router
} from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct ResultRem {
  bottomOptions: ArcButtonOptions = new ArcButtonOptions({})
  private remDuration: string = '15%'
  aboutToAppear() {
    this.bottomOptions = new ArcButtonOptions({
      label: 'Next',
      fontColor: ColorMetrics.resourceColor('#205375'),
      status: ArcButtonStatus.NORMAL,
      backgroundColor: ColorMetrics.resourceColor('#EFEFEF'),
      styleMode: ArcButtonStyleMode.CUSTOM,
      position: ArcButtonPosition.BOTTOM_EDGE,
      onClick: () => {
        router.pushUrl({ url: 'pages/FeaturesList' });
      }
    });
  }

  build() {
    Flex({
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center,
      direction: FlexDirection.Column
    }) {
          Stack(){
              Progress({ value: 11, total: 100, type: ProgressType.ScaleRing })
                .color(Color.Orange).width(125).height(125)
                .style({
                  strokeWidth: 15,
                  scaleCount: 15,
                  scaleWidth: 5,
                  enableSmoothEffect: true
                })
            Image($r('app.media.dream_svg'))
              .width('35%')
              .padding(5)
              .margin({ top: 20, bottom: 23 })
          }
          Text(`Rem Sleep: ${this.remDuration}`).fontWeight(FontWeight.Bold).margin({top: 15})

          ArcButton({ options: this.bottomOptions }).margin({top: 20})
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#112B3C')
  }
}