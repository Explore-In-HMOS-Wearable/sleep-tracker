import {
  ArcButton,
  ArcButtonOptions,
  ArcButtonPosition,
  ArcButtonStatus,
  ArcButtonStyleMode,
  ColorMetrics } from '@kit.ArkUI';
import { AlarmWatcher } from './AlarmWatcher';
import { FeaturesList } from './FeaturesList';
import { ResultDuration } from './ResultDuration';
import { ResultRem } from './ResultRem';
import { ResultWakeCount } from './ResultWakeCount';
import { SetAlarm } from './SetAlarm';
import { SleepEfficiency } from './SleepEfficiency';

@Entry
@Component
struct Index {
  @State message: string = 'Sleep Cycle';
  bottomOptions: ArcButtonOptions = new ArcButtonOptions({})

  @Provide('NavPathStack') pageStack: NavPathStack = new NavPathStack()

  @Builder
  PagesMap(name: string) {
    if (name === 'SetAlarm') {
      SetAlarm()
    }
    else if(name === 'AlarmWatcher'){
      AlarmWatcher()
    }
    else if(name === 'SleepEfficiency'){
      SleepEfficiency()
    }
    else if(name === 'ResultDuration'){
      ResultDuration()
    }
    else if(name === 'ResultWakeCount'){
      ResultWakeCount()
    }
    else if(name === 'ResultRem'){
      ResultRem()
    }
    else if(name === 'FeaturesList'){
      FeaturesList()
    }
  }
  aboutToAppear() {
    this.bottomOptions = new ArcButtonOptions({
      label: 'Start',
      fontColor: ColorMetrics.resourceColor('#205375'),
      status: ArcButtonStatus.NORMAL,
      backgroundColor: ColorMetrics.resourceColor('#EFEFEF'),
      styleMode: ArcButtonStyleMode.CUSTOM,
      position: ArcButtonPosition.BOTTOM_EDGE,
      onClick: () => {
        this.pageStack.pushPathByName('SetAlarm', null);
      }
    });
  }
  build() {
    Navigation(this.pageStack){
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
    .hideTitleBar(true)
    .navDestination(this.PagesMap)
    .hideBackButton(true)
    .ignoreLayoutSafeArea()
  }
}