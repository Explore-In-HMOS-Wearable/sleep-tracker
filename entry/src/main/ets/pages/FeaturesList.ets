import { ArcList, ArcListItem, UIContext,
  ComponentContent  } from '@kit.ArkUI';

@Builder
function header() {
  Column() {
    Text('All Features')
      .fontSize('45px')
      .fontWeight(FontWeight.Bold)
  }.margin(0)
}

@Component
export struct FeaturesList {
  context: UIContext = this.getUIContext()
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(header));
  @Consume('NavPathStack') pageStack: NavPathStack;

  onPageShow(): void {
    this.pageStack.clear()
  }

  build() {
    NavDestination(){
      Flex({justifyContent: FlexAlign.Center,
        direction: FlexDirection.Column,
        alignItems: ItemAlign.Center}){
        ArcList({ header: this.tabBar1 }) {
          ArcListItem() {
            Row() {
              Image($r('app.media.home'))
                .width(40)
                .height(40)
                .padding(5)
                .objectFit(ImageFit.Contain)
                .onClick(() => {
                  this.pageStack.pushPathByName('Index', null);
                });
              Blank(3)
              Text('Home')
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .width('90%')
                .textAlign(TextAlign.Start)
                .fontSize(16)
            }
            .backgroundColor('#205375')
            .borderRadius(25)
            .margin(5)
            .width('85%')
            .padding({
              top: 3,
              bottom: 3,
              left: 4,
              right: 3
            })
            .onClick(() => {
              this.pageStack.pushPathByName('Index', null);
            });
          }
          ArcListItem() {
            Row() {
              Image($r('app.media.sleep_efficiency'))
                .width(40)
                .height(40)
                .padding(5)
                .objectFit(ImageFit.Contain)
                .onClick(() => {
                  this.pageStack.pushPathByName('SleepEfficiency', null);
                });
              Blank(3)
              Text('Sleep Efficiency')
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .width('90%')
                .textAlign(TextAlign.Start)
                .fontSize(16)
            }
            .backgroundColor('#205375')
            .borderRadius(25)
            .margin(5)
            .width('85%')
            .padding({
              top: 3,
              bottom: 3,
              left: 4,
              right: 3
            })
            .onClick(() => {
              this.pageStack.pushPathByName('SleepEfficiency', null);
            });
          }
          ArcListItem() {
            Row() {
              Image($r('app.media.duration'))
                .width(40)
                .height(40)
                .padding(5)
                .objectFit(ImageFit.Contain)
                .onClick(() => {
                  this.pageStack.pushPathByName('ResultDuration', null);
                });
              Blank(3)
              Text('Sleeping Duration')
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .width('90%')
                .textAlign(TextAlign.Start)
                .fontSize(16)
            }
            .backgroundColor('#205375')
            .borderRadius(25)
            .margin(5)
            .width('85%')
            .padding({
              top: 3,
              bottom: 3,
              left: 4,
              right: 3
            })
            .onClick(() => {
              this.pageStack.pushPathByName('ResultDuration', null);
            });
          }
          ArcListItem() {
            Row() {
              Image($r('app.media.wake_count'))
                .width(40)
                .height(40)
                .padding(5)
                .objectFit(ImageFit.Contain)
                .onClick(() => {
                  this.pageStack.pushPathByName('ResultWakeCount', null);
                });
              Blank(3)
              Text('Wake Count')
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .width('90%')
                .textAlign(TextAlign.Start)
                .fontSize(16)
            }
            .backgroundColor('#205375')
            .borderRadius(25)
            .margin(5)
            .width('85%')
            .padding({
              top: 3,
              bottom: 3,
              left: 4,
              right: 3
            })
            .onClick(() => {
              this.pageStack.pushPathByName('ResultWakeCount', null);
            });
          }
          ArcListItem() {
            Row() {
              Image($r('app.media.dream'))
                .width(40)
                .height(40)
                .padding(5)
                .objectFit(ImageFit.Contain)
                .onClick(() => {
                  this.pageStack.pushPathByName('ResultRem', null);
                });
              Blank(3)
              Text('Rem Sleep')
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .width('90%')
                .textAlign(TextAlign.Start)
                .fontSize(16)
            }
            .backgroundColor('#205375')
            .borderRadius(25)
            .margin(5)
            .width('85%')
            .padding({
              top: 3,
              bottom: 3,
              left: 4,
              right: 3
            })
            .onClick(() => {
              this.pageStack.pushPathByName('ResultRem', null);
            });
          }
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#112B3C')
    }
    .hideTitleBar(true)
    .hideBackButton(true)
  }
}