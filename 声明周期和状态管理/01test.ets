import {router} from '@kit.ArkUI';

@Entry
@Component
struct mainPage{
  aboutToAppear(){
    console.log('toAppear')
  }
  aboutToDisappear(){
    console.log('toDisappear')
  }
  onPageShow(){
    console.log('onshow')
  }
  onPageHide(){
    console.log('hide')
  }

  build(){
    Button('sss')
      .onClick(()=>{
        router.pushUrl({url:'pages/Page'});
      })
  }
}


/*

import {router} from '@kit.ArkUI';

@Entry
@Component
struct subPage{
  pathStack: NavPathStack = new NavPathStack();
  build(){
    Button('aaa')
      .onClick(()=>{
        router.back({url:'pages/Index'});
      })
  }
}

*/