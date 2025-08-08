import { router } from '@kit.ArkUI';
import { healthStore } from '@kit.HealthServiceKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct Result {

  aboutToAppear() {
    this.getHealthAuthorization();
  }

  async getHealthAuthorization() {
    let queryAuthorizationRequest: healthStore.AuthorizationRequest = {
      readDataTypes: [
        healthStore.exerciseSequenceHelper.DATA_TYPE,
        healthStore.samplePointHelper.heartRate.DATA_TYPE
      ],
      writeDataTypes: [
        healthStore.exerciseSequenceHelper.DATA_TYPE,
        healthStore.samplePointHelper.heartRate.DATA_TYPE
      ]
    };

    try {
      let queryAuthorizationResponse = await healthStore.getAuthorizations(queryAuthorizationRequest);
      hilog.info(0x0000, 'testTag', `Authorization Response: ${JSON.stringify(queryAuthorizationResponse)}`);
      hilog.info(0x0000, 'testTag', 'Succeeded in getting authorization.');
      queryAuthorizationResponse.writeDataTypes.forEach(dataType => {
        hilog.info(0x0000, 'testTag', `grantedWriteDataType is : ${dataType.name}`);
      });
      queryAuthorizationResponse.readDataTypes.forEach(dataType => {
        hilog.info(0x0000, 'testTag', `grantedReadDataTypes is : ${dataType.name}`);
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag', `Failed to get authorization. Code: ${err.code}, message: ${err.message}`);
    }
  }

  build() {
    Flex({ justifyContent: FlexAlign.Center }) {
      Row() {
        Column() {
          Button('Next')
            .onClick(() => {
              router.pushUrl({ url: 'pages/ResultDuration' });
            })
        }
      }
      .height('100%')
    }
    .width('100%')
    .backgroundColor('#112B3C')
  }
}